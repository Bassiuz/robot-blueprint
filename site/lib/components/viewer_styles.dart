import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Styles for the file lists, skill tables and the raw-file dialog.
class ViewerStyles extends StatelessComponent {
  const ViewerStyles({super.key});

  static const _css = '''
.rb-open { all: unset; cursor: pointer; color: var(--primary); text-decoration: underline; text-underline-offset: 3px; }
.rb-open:hover { opacity: .75; }
.rb-files { list-style: none; padding: 0; display: flex; flex-wrap: wrap; gap: .35rem 1.25rem; }
.rb-files li { margin: 0; }
.rb-badge { font-size: .7rem; padding: .05rem .45rem; border-radius: 999px; background: rgba(4,120,87,.12); margin-left: .4rem; white-space: nowrap; }
.rb-dialog { background: var(--background); color: var(--content-headings); width: min(960px, 92vw); max-height: 85vh; padding: 0; border: 1px solid rgba(127,127,127,.3); border-radius: .75rem; }
.rb-dialog::backdrop { background: rgba(0,0,0,.45); }
.rb-head { position: sticky; top: 0; display: flex; justify-content: space-between; align-items: center; gap: 1rem; padding: .75rem 1rem; background: inherit; border-bottom: 1px solid rgba(127,127,127,.25); font-size: .85rem; }
.rb-head form { margin: 0; }
.rb-body { padding: .5rem 1.5rem 1.5rem; max-width: none; }
.rb-front { font-size: .75rem; opacity: .8; }
.rb-rawtoggle { margin-top: 2rem; font-size: .8rem; }
.rb-rawtoggle summary { cursor: pointer; opacity: .7; }
.rb-raw { margin: 0; padding: 1rem; white-space: pre-wrap; word-break: break-word; font-size: .8rem; line-height: 1.5; background: transparent; color: var(--content-headings); }
.rb-skills td, .rb-skills th { vertical-align: top; font-size: .85rem; }
.rb-skills td.rb-check { text-align: center; }
.rb-note { padding: 1rem; border-radius: .5rem; background: rgba(127,127,127,.1); }
''';

  @override
  Component build(BuildContext context) => Component.element(tag: 'style', children: [RawText(_css)]);
}
