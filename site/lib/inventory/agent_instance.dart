/// One agent config folder: a Claude account (`~/.claude…`) or Codex (`~/.codex`).
class AgentInstance {
  const AgentInstance({required this.name, required this.kind, required this.dir, this.accountFile});

  final String name;
  final String kind;
  final String dir;
  final String? accountFile;

  bool get isClaude => kind == 'claude';
}
