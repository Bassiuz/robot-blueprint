import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:markdown/markdown.dart' as md;

import '../inventory/agent_file.dart';
import '../inventory/escape_html.dart';
import '../inventory/local_config.dart';

/// A file name that opens the file, rendered as markdown, in a modal dialog.
/// No client JS beyond showModal(); the raw text sits behind a `<details>` toggle.
class FileViewer extends StatelessComponent {
  const FileViewer(this.file, {this.label, super.key});

  final AgentFile file;
  final String? label;

  static int _next = 0;
  static final _frontmatter = RegExp(r'^---\r?\n([\s\S]*?)\r?\n---\r?\n?');

  @override
  Component build(BuildContext context) {
    final id = 'rb-file-${_next++}';
    final match = _frontmatter.firstMatch(file.content);
    final front = match?.group(1);
    final body = match == null ? file.content : file.content.substring(match.end);
    return Component.fragment([
      button(
        classes: 'rb-open',
        attributes: {'onclick': "document.getElementById('$id').showModal()", 'type': 'button'},
        [Component.text(label ?? file.title)],
      ),
      dialog(
        id: id,
        classes: 'rb-dialog',
        attributes: {'onclick': 'if (event.target === this) this.close()'},
        [
          div(classes: 'rb-head', [
            code([Component.text(tildePath(file.path))]),
            form(method: FormMethod.dialog, [
              button(classes: 'rb-open', [Component.text('Close')]),
            ]),
          ]),
          div(classes: 'content rb-body', [
            if (front != null) pre(classes: 'rb-front', [Component.text(front)]),
            RawText(md.markdownToHtml(escapeHtmlOutsideCode(body), extensionSet: md.ExtensionSet.gitHubWeb)),
            details(classes: 'rb-rawtoggle', [
              summary([Component.text('Raw')]),
              pre(classes: 'rb-raw', [Component.text(file.content)]),
            ]),
          ]),
        ],
      ),
    ]);
  }
}
