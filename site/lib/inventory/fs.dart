import 'dart:io';

const _skipDirs = {
  'node_modules', '.git', 'build', '.dart_tool', 'Pods', '.zoo-worktrees', '.lab-worktrees',
  '.worktrees', 'worktrees', '.fvm', 'dist', '.nuxt', '.output', 'vendor',
};

String? readText(String path) {
  try {
    return File(path).readAsStringSync();
  } on FileSystemException {
    return null;
  }
}

String realPath(String path) {
  try {
    return File(path).resolveSymbolicLinksSync();
  } on FileSystemException {
    return path;
  }
}

List<Directory> subdirs(String path) {
  final dir = Directory(path);
  if (!dir.existsSync()) return const [];
  return dir.listSync().whereType<Directory>().toList()..sort((a, b) => a.path.compareTo(b.path));
}

/// Files named one of [names] under [root], at most [maxDepth] folders deep.
List<String> findFiles(String root, Set<String> names, {int maxDepth = 4}) {
  final found = <String>[];
  void walk(Directory dir, int depth) {
    final List<FileSystemEntity> entries;
    try {
      entries = dir.listSync(followLinks: false);
    } on FileSystemException {
      return;
    }
    for (final e in entries) {
      final name = e.uri.pathSegments.where((s) => s.isNotEmpty).last;
      if (e is File && names.contains(name)) found.add(e.path);
      if (e is Directory && depth < maxDepth && !_skipDirs.contains(name)) walk(e, depth + 1);
    }
  }

  if (Directory(root).existsSync()) walk(Directory(root), 0);
  return found..sort();
}

/// All `.md` files under [path], recursively, sorted.
List<String> listMarkdown(String path) {
  final dir = Directory(path);
  if (!dir.existsSync()) return const [];
  return [
    for (final e in dir.listSync(recursive: true))
      if (e is File && e.path.endsWith('.md')) e.path,
  ]..sort();
}
