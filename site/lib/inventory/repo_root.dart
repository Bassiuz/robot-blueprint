/// A folder whose subfolders are repositories, with a label such as "Personal".
class RepoRoot {
  const RepoRoot({required this.label, required this.dir});

  final String label;
  final String dir;
}
