import 'dart:io';

import 'package:yaml/yaml.dart';

import 'agent_instance.dart';
import 'repo_root.dart';

/// The machine-specific sources from `../local.yaml`. Null in public builds:
/// when the file is missing or `ROBOT_PUBLIC=1` is set.
class LocalConfig {
  const LocalConfig({required this.instances, required this.repoRoots, required this.extraFiles});

  final List<AgentInstance> instances;
  final List<RepoRoot> repoRoots;
  final List<String> extraFiles;

  static final LocalConfig? current = _load();

  static LocalConfig? _load() {
    if (Platform.environment['ROBOT_PUBLIC'] == '1') return null;
    final file = File('../local.yaml');
    if (!file.existsSync()) return null;
    final yaml = loadYaml(file.readAsStringSync()) as YamlMap;
    return LocalConfig(
      instances: [
        for (final i in (yaml['instances'] as YamlList? ?? const []))
          AgentInstance(
            name: i['name'] as String,
            kind: i['kind'] as String,
            dir: expandHome(i['dir'] as String),
            accountFile: i['account_file'] == null ? null : expandHome(i['account_file'] as String),
          ),
      ],
      repoRoots: [
        for (final r in (yaml['repo_roots'] as YamlList? ?? const []))
          RepoRoot(label: r['label'] as String, dir: expandHome(r['dir'] as String)),
      ],
      extraFiles: [for (final f in (yaml['extra_files'] as YamlList? ?? const [])) expandHome(f as String)],
    );
  }
}

String get home => Platform.environment['HOME'] ?? '';

String expandHome(String path) => path.startsWith('~/') ? '$home${path.substring(1)}' : path;

String tildePath(String path) => path.startsWith(home) ? '~${path.substring(home.length)}' : path;
