import 'agent_file.dart';
import 'file_group.dart';
import 'fs.dart';
import 'local_config.dart';

/// Finds the rule and memory files of every agent instance and repository.
class AgentFilesScanner {
  AgentFilesScanner(this.config);

  final LocalConfig config;

  /// Instance-wide rules (CLAUDE.md, AGENTS.md) and the extra files from local.yaml.
  List<FileGroup> globalRules() {
    final byPath = <String, AgentFile>{};
    for (final instance in config.instances) {
      final names = instance.isClaude ? ['CLAUDE.md'] : ['AGENTS.md', 'AGENTS.override.md'];
      for (final name in names) {
        final path = '${instance.dir}/$name';
        final content = readText(path);
        if (content == null) continue;
        byPath
            .putIfAbsent(realPath(path), () => AgentFile(title: tildePath(path), path: path, content: content))
            .instances
            .add(instance.name);
      }
    }
    final extra = [
      for (final path in config.extraFiles)
        if (readText(path) case final content?) AgentFile(title: tildePath(path), path: path, content: content),
    ];
    return [
      FileGroup(title: 'Agent instances', files: byPath.values.toList()),
      if (extra.isNotEmpty) FileGroup(title: 'Harness prompts', files: extra),
    ];
  }

  /// Claude project memory, one group per project, merged across instances.
  List<FileGroup> memory() {
    final groups = <String, FileGroup>{};
    final filesByKey = <String, AgentFile>{};
    for (final instance in config.instances.where((i) => i.isClaude)) {
      for (final project in subdirs('${instance.dir}/projects')) {
        final memoryDir = '${project.path}/memory';
        final mdFiles = listMarkdown(memoryDir);
        if (mdFiles.isEmpty) continue;
        final (label, name) = _projectName(project.uri.pathSegments.where((s) => s.isNotEmpty).last);
        final group = groups.putIfAbsent(name, () => FileGroup(title: name, badge: label, files: []));
        for (final path in mdFiles) {
          final content = readText(path) ?? '';
          final fileName = path.substring(memoryDir.length + 1);
          final key = '$name/$fileName/${content.hashCode}';
          final existing = filesByKey[key];
          if (existing != null) {
            existing.instances.add(instance.name);
            continue;
          }
          final file = AgentFile(title: fileName, path: path, content: content, instances: {instance.name});
          filesByKey[key] = file;
          group.files.add(file);
        }
      }
    }
    for (final g in groups.values) {
      g.files.sort((a, b) => a.title == 'MEMORY.md' ? -1 : b.title == 'MEMORY.md' ? 1 : a.title.compareTo(b.title));
    }
    return groups.values.where((g) => g.files.isNotEmpty).toList()
      ..sort((a, b) => '${a.badge}${a.title}'.compareTo('${b.badge}${b.title}'));
  }

  /// CLAUDE.md and AGENTS.md files inside the repositories, one group per root.
  List<FileGroup> repoRules() => [
        for (final root in config.repoRoots)
          FileGroup(title: root.label, files: [
            for (final path in findFiles(root.dir, {'CLAUDE.md', 'AGENTS.md'}))
              AgentFile(
                title: path.substring(root.dir.length + 1),
                path: path,
                content: readText(path) ?? '',
              ),
          ]),
      ];

  /// Claude stores memory per project as the path with every non-alphanumeric turned into `-`.
  (String, String) _projectName(String encoded) {
    String encode(String path) => path.replaceAll(RegExp('[^A-Za-z0-9]'), '-');
    for (final root in config.repoRoots) {
      final prefix = '${encode(root.dir)}-';
      if (encoded.startsWith(prefix)) return (root.label, encoded.substring(prefix.length));
    }
    final homePrefix = '${encode(home)}-';
    final rest = encoded.startsWith(homePrefix) ? encoded.substring(homePrefix.length) : encoded;
    return ('Other', rest.replaceFirst(RegExp('^-+'), ''));
  }
}
