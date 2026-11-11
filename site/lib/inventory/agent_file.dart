/// A markdown file an agent reads: rules, memory, or a skill.
class AgentFile {
  AgentFile({required this.title, required this.path, required this.content, Set<String>? instances})
      : instances = instances ?? {};

  final String title;
  final String path;
  final String content;

  /// Names of the agent instances that use this file.
  final Set<String> instances;
}
