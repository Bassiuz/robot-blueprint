import 'package:yaml/yaml.dart';

/// Reads `name` and `description` from a SKILL.md front matter block.
({String? name, String description}) readFrontmatter(String content) {
  final match = RegExp(r'^---\r?\n([\s\S]*?)\r?\n---', multiLine: false).firstMatch(content);
  if (match == null) return (name: null, description: '');
  try {
    final yaml = loadYaml(match.group(1)!);
    if (yaml is! YamlMap) return (name: null, description: '');
    return (name: yaml['name']?.toString(), description: (yaml['description'] ?? '').toString().trim());
  } on YamlException {
    return (name: null, description: '');
  }
}
