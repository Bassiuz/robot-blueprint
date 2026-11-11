/// Escapes `<` outside code so HTML-like text in a memory file (`<Widget>`,
/// `<dialog>`) can't break the page. Fenced blocks and code spans are left as is;
/// the markdown renderer escapes those itself.
String escapeHtmlOutsideCode(String markdown) {
  final out = StringBuffer();
  var inFence = false;
  for (final line in markdown.split('\n')) {
    if (line.trimLeft().startsWith('```') || line.trimLeft().startsWith('~~~')) inFence = !inFence;
    if (inFence || line.trimLeft().startsWith('```') || line.trimLeft().startsWith('~~~')) {
      out.writeln(line);
      continue;
    }
    final parts = line.split('`');
    for (var i = 0; i < parts.length; i++) {
      out.write(i.isEven ? parts[i].replaceAll('<', '&lt;') : parts[i]);
      if (i < parts.length - 1) out.write('`');
    }
    out.writeln();
  }
  return out.toString();
}

void main() {
  assert(escapeHtmlOutsideCode('a <b> `c<d>`\n') == 'a &lt;b> `c<d>`\n\n');
  assert(escapeHtmlOutsideCode('```\n<x>\n```\n').contains('\n<x>\n'));
  print('ok');
}
