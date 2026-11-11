import 'agent_file.dart';

/// A heading with the files under it, e.g. one project's memory.
class FileGroup {
  FileGroup({required this.title, this.badge, required this.files});

  final String title;
  final String? badge;
  final List<AgentFile> files;
}
