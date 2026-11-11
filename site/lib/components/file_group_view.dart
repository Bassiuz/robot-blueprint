import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../inventory/file_group.dart';
import 'file_viewer.dart';

/// A heading with a wrapped list of clickable files.
class FileGroupView extends StatelessComponent {
  const FileGroupView(this.group, {this.showInstances = false, super.key});

  final FileGroup group;
  final bool showInstances;

  @override
  Component build(BuildContext context) => Component.fragment([
        h3([
          Component.text(group.title),
          if (group.badge != null) span(classes: 'rb-badge', [Component.text(group.badge!)]),
        ]),
        if (group.files.isEmpty) p([Component.text('None.')]),
        ul(classes: 'rb-files', [
          for (final file in group.files)
            li([
              FileViewer(file),
              if (showInstances)
                for (final instance in file.instances) span(classes: 'rb-badge', [Component.text(instance)]),
            ]),
        ]),
      ]);
}
