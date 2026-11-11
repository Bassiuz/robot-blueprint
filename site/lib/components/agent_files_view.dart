import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../inventory/agent_files_scanner.dart';
import '../inventory/local_config.dart';
import 'file_group_view.dart';
import 'private_note.dart';
import 'viewer_styles.dart';

/// `<AgentFiles/>`: every rule and memory file, readable in place.
class AgentFilesView extends StatelessComponent {
  const AgentFilesView({super.key});

  @override
  Component build(BuildContext context) {
    final config = LocalConfig.current;
    if (config == null) return const PrivateNote();
    final scanner = AgentFilesScanner(config);
    final memory = scanner.memory();
    return Component.fragment([
      const ViewerStyles(),
      h2([Component.text('Global rules')]),
      for (final group in scanner.globalRules()) FileGroupView(group, showInstances: true),
      h2([Component.text('Rules in repositories')]),
      for (final group in scanner.repoRules()) FileGroupView(group),
      h2([Component.text('Memory')]),
      p([
        Component.text('${memory.length} projects, ${memory.fold(0, (n, g) => n + g.files.length)} files. '
            'A badge names the Claude account a file lives in. Codex keeps no memory files; '
            'it gets its rules through the Harbas prompts above.'),
      ]),
      for (final group in memory) FileGroupView(group, showInstances: true),
    ]);
  }
}
