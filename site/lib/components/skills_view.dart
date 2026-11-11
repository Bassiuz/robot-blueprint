import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../inventory/local_config.dart';
import '../inventory/skill_row.dart';
import '../inventory/skills_scanner.dart';
import 'file_viewer.dart';
import 'private_note.dart';
import 'viewer_styles.dart';

/// `<SkillTable/>`: every installed skill per source, with a column per agent instance.
class SkillsView extends StatelessComponent {
  const SkillsView({super.key});

  @override
  Component build(BuildContext context) {
    final config = LocalConfig.current;
    if (config == null) return const PrivateNote();
    final rows = SkillsScanner(config).scan();
    final instances = [for (final i in config.instances) i.name];
    final bySource = <String, List<SkillRow>>{};
    for (final row in rows) {
      bySource.putIfAbsent(row.source, () => []).add(row);
    }
    final sources = bySource.keys.toList()..sort((x, y) => _rank(x) != _rank(y) ? _rank(x) - _rank(y) : x.compareTo(y));

    return Component.fragment([
      const ViewerStyles(),
      ul([
        for (final name in instances)
          li([
            strong([Component.text(name)]),
            Component.text(': ${rows.where((r) => r.file.instances.contains(name)).length} skills'),
          ]),
      ]),
      for (final source in sources) ...[
        h3([Component.text(source), span(classes: 'rb-badge', [Component.text('${bySource[source]!.length}')])]),
        table(classes: 'rb-skills', [
          thead([
            tr([
              th([Component.text('Skill')]),
              th([Component.text('What it is for')]),
              for (final name in instances) th([Component.text(name)]),
            ]),
          ]),
          tbody([
            for (final row in bySource[source]!)
              tr([
                td([FileViewer(row.file, label: row.name)]),
                td([Component.text(_short(row.description))]),
                for (final name in instances)
                  td(classes: 'rb-check', [Component.text(row.file.instances.contains(name) ? '✓' : '')]),
              ]),
          ]),
        ]),
      ],
    ]);
  }

  static int _rank(String source) => switch (source) {
        'Local' => 0,
        _ when source.startsWith('Linked') => 1,
        _ when source.startsWith('Project') => 2,
        'claude.ai synced' => 3,
        _ when source.startsWith('Claude plugin') => 4,
        _ when source.startsWith('Codex plugin') => 6,
        _ => 5,
      };

  static String _short(String text) {
    final oneLine = text.replaceAll(RegExp(r'\s+'), ' ');
    return oneLine.length <= 220 ? oneLine : '${oneLine.substring(0, 217)}…';
  }
}
