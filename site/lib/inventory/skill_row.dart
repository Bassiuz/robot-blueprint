import 'agent_file.dart';

/// One installed skill and where it comes from.
class SkillRow {
  SkillRow({required this.name, required this.description, required this.source, required this.file});

  final String name;
  final String description;

  /// "Local", "Linked from …", "claude.ai synced", "Plugin: …", "Codex built-in", "Project: …".
  final String source;
  final AgentFile file;
}
