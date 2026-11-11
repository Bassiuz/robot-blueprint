import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Shown instead of machine-specific lists in public builds.
class PrivateNote extends StatelessComponent {
  const PrivateNote({super.key});

  @override
  Component build(BuildContext context) => p(classes: 'rb-note', [
        Component.text('This list is built from the local machine (local.yaml) and is not part of the public build.'),
      ]);
}
