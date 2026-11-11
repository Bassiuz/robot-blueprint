/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

import 'package:jaspr_content/components/callout.dart';
import 'package:jaspr_content/components/code_block.dart';
import 'package:jaspr_content/components/header.dart';
import 'package:jaspr_content/components/image.dart';
import 'package:jaspr_content/components/sidebar.dart';
import 'package:jaspr_content/components/theme_toggle.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/theme.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';
import 'components/agent_files_view.dart';
import 'components/skills_view.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [ContentApp] spins up the content rendering pipeline from jaspr_content to render
  // your markdown files in the content/ directory to a beautiful documentation site.
  runApp(
    ContentApp(
      // Enables mustache templating inside the markdown files.
      templateEngine: MustacheTemplateEngine(),
      parsers: [
        MarkdownParser(),
      ],
      extensions: [
        // Adds heading anchors to each heading.
        HeadingAnchorsExtension(),
        // Generates a table of contents for each page.
        TableOfContentsExtension(),
      ],
      components: [
        // The <Info> block and other callouts.
        Callout(),
        // Adds syntax highlighting to code blocks.
        CodeBlock(),
        CustomComponent(pattern: 'AgentFiles', builder: (_, _, _) => const AgentFilesView()),
        CustomComponent(pattern: 'SkillTable', builder: (_, _, _) => const SkillsView()),
        // Adds zooming and caption support to images.
        Image(zoom: true),
      ],
      layouts: [
        // Out-of-the-box layout for documentation sites.
        DocsLayout(
          header: Header(
            title: 'Robot Blueprint',
            logo: '/images/logo.svg',
            items: [
              // Enables switching between light and dark mode.
              ThemeToggle(),
            ],
          ),
          sidebar: Sidebar(
            groups: [
              SidebarGroup(
                links: [
                  SidebarLink(text: 'Overview', href: '/'),
                ],
              ),
              SidebarGroup(
                title: 'Blueprints',
                links: [
                  SidebarLink(text: 'All blueprints', href: '/blueprints'),
                  SidebarLink(text: 'Static website', href: '/blueprints/static-website'),
                  SidebarLink(text: 'Flutter app', href: '/blueprints/flutter-app'),
                  SidebarLink(text: 'Flutter web app', href: '/blueprints/flutter-web-app'),
                  SidebarLink(text: 'Cloud functions', href: '/blueprints/cloud-functions'),
                  SidebarLink(text: 'Firebase data', href: '/blueprints/firebase-data'),
                  SidebarLink(text: 'Local database', href: '/blueprints/local-database'),
                  SidebarLink(text: 'Repository split', href: '/blueprints/repo-split'),
                ],
              ),
              SidebarGroup(
                title: 'Agentic coding',
                links: [
                  SidebarLink(text: 'The loop', href: '/agentic'),
                  SidebarLink(text: 'Toolkit', href: '/agentic/toolkit'),
                  SidebarLink(text: 'Agents', href: '/agentic/agents'),
                  SidebarLink(text: 'Skills and plugins', href: '/agentic/skills'),
                  SidebarLink(text: 'Retired', href: '/agentic/retired'),
                  SidebarLink(text: 'Config and hooks', href: '/agentic/config'),
                  SidebarLink(text: 'Rules', href: '/agentic/rules'),
                  SidebarLink(text: 'Rule and memory files', href: '/agentic/files'),
                ],
              ),
            ],
          ),
        ),
      ],
      theme: ContentTheme(
        // Customizes the default theme colors.
        primary: ThemeColor(ThemeColors.emerald.$700, dark: ThemeColors.emerald.$300),
        background: ThemeColor(ThemeColors.slate.$50, dark: ThemeColors.zinc.$950),
        colors: [
          ContentColors.quoteBorders.apply(ThemeColors.emerald.$500),
        ],
      ),
    ),
  );
}
