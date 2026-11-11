import 'dart:convert';
import 'dart:io';

import 'agent_file.dart';
import 'agent_instance.dart';
import 'frontmatter.dart';
import 'fs.dart';
import 'local_config.dart';
import 'skill_row.dart';

/// Lists every skill each agent instance can use, merged by the real SKILL.md path.
class SkillsScanner {
  SkillsScanner(this.config);

  final LocalConfig config;
  final _rows = <String, SkillRow>{};

  List<SkillRow> scan() {
    for (final instance in config.instances) {
      if (instance.isClaude) {
        _claudeLocal(instance);
        _claudeSynced(instance);
        _claudePlugins(instance);
      } else {
        _codex(instance);
      }
    }
    _projects();
    return _rows.values.toList()..sort((a, b) => a.name.compareTo(b.name));
  }

  void _add(String skillMd, String source, Iterable<String> instances) {
    final content = readText(skillMd);
    if (content == null) return;
    final key = realPath(skillMd);
    final existing = _rows[key];
    if (existing != null) {
      existing.file.instances.addAll(instances);
      return;
    }
    final meta = readFrontmatter(content);
    final dirName = File(skillMd).parent.uri.pathSegments.where((s) => s.isNotEmpty).last;
    _rows[key] = SkillRow(
      name: meta.name ?? dirName,
      description: meta.description,
      source: source,
      file: AgentFile(title: meta.name ?? dirName, path: skillMd, content: content, instances: {...instances}),
    );
  }

  void _claudeLocal(AgentInstance instance) {
    final skillsDir = realPath('${instance.dir}/skills');
    for (final dir in subdirs('${instance.dir}/skills')) {
      if (dir.path.endsWith('/synced')) continue;
      final real = realPath(dir.path);
      final linked = !real.startsWith(skillsDir);
      final source = linked ? 'Linked from ${tildePath(File(real).parent.parent.path)}' : 'Local';
      _add('${dir.path}/SKILL.md', source, [instance.name]);
    }
  }

  void _claudeSynced(AgentInstance instance) {
    final account = instance.accountFile == null ? null : readText(instance.accountFile!);
    if (account == null) return;
    final org = (jsonDecode(account) as Map<String, dynamic>)['oauthAccount']?['organizationUuid'] as String?;
    if (org == null) return;
    for (final bucket in subdirs('${instance.dir}/skills/synced')) {
      if (!bucket.path.split('/').last.startsWith(org)) continue;
      for (final dir in subdirs(bucket.path)) {
        _add('${dir.path}/SKILL.md', 'claude.ai synced', [instance.name]);
      }
    }
  }

  void _claudePlugins(AgentInstance instance) {
    final installed = readText('${instance.dir}/plugins/installed_plugins.json');
    if (installed == null) return;
    final settings = readText('${instance.dir}/settings.json');
    final enabled = settings == null
        ? const <String, dynamic>{}
        : ((jsonDecode(settings) as Map<String, dynamic>)['enabledPlugins'] as Map<String, dynamic>? ?? const {});
    final plugins = (jsonDecode(installed) as Map<String, dynamic>)['plugins'] as Map<String, dynamic>;
    for (final MapEntry(:key, :value) in plugins.entries) {
      final installPath = ((value as List).last as Map<String, dynamic>)['installPath'] as String;
      final name = key.split('@').first;
      final source = 'Claude plugin: $name${enabled[key] == true ? '' : ' (disabled)'}';
      for (final dir in subdirs('$installPath/skills')) {
        _add('${dir.path}/SKILL.md', source, [instance.name]);
      }
    }
  }

  void _codex(AgentInstance instance) {
    for (final path in findFiles('${instance.dir}/skills', {'SKILL.md'})) {
      _add(path, path.contains('/.system/') ? 'Codex built-in' : 'Local', [instance.name]);
    }
    for (final market in subdirs('${instance.dir}/plugins/cache')) {
      for (final plugin in subdirs(market.path)) {
        final versions = subdirs(plugin.path);
        if (versions.isEmpty) continue;
        final latest = versions.last.path;
        for (final dir in subdirs('$latest/skills')) {
          _add('${dir.path}/SKILL.md', 'Codex plugin: ${plugin.path.split('/').last}', [instance.name]);
        }
      }
    }
  }

  /// Skills checked into a repository's `.claude/skills/`; any Claude instance gets them there.
  void _projects() {
    final claude = [for (final i in config.instances) if (i.isClaude) i.name];
    for (final root in config.repoRoots) {
      for (final path in findFiles(root.dir, {'SKILL.md'}, maxDepth: 6)) {
        final marker = path.indexOf('/.claude/skills/');
        if (marker < 0) continue;
        _add(path, 'Project: ${root.label} / ${path.substring(root.dir.length + 1, marker)}', claude);
      }
    }
  }
}
