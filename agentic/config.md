---
title: Config and hooks
description: "The two config folders, the hooks, MCP servers and settings."
---

## Folders
- `~/.claude`: personal config. `CLAUDE.md` is almost empty (only the graphify pointer).
- a second config folder for the work account. `CLAUDE.md`, `settings.json`, `hooks/`,
  `plugins/`, `skills/`, `keybindings.json` are symlinks into `~/.claude`.

## Settings
`model: opus`, fullscreen TUI, `dark-daltonized` theme, hold-to-talk voice,
push notifications on. Almost no permission allow-list (bypass mode). Status
line from ponytail. `ctrl+alt+g` opens the Orca agent view.

## Hooks
- **Stop → `~/.claude/hooks/say-reply.sh`**: reads the last reply aloud with
  macOS `say`, skipping code blocks. Only when voice is on and this session
  owns `~/.claude/speak-session` (claimed by `/converse`).
- **Orca hooks** on ~16 events (SessionStart/End, UserPromptSubmit, tool use,
  permissions, subagents, Stop…): all call `~/.orca/agent-hooks/claude-hook.sh`
  and do nothing outside an Orca pane. Codex has the same set in `~/.codex/hooks.json`.

## MCP servers
- **harbas**: thoughts, Seedling, zoo, Review Coach, cards, products.
- **marionette**: drives a running Flutter app; enabled per project.
- **vibe_kanban**: stale, times out. Remove.
- claude.ai connectors (Docs, Data, and the OAuth ones).

## Memory
`~/.claude/projects/<project>/memory/` with a `MEMORY.md` index per project.
See [Rule and memory files](/agentic/files).
