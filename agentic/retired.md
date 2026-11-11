---
title: Retired
description: "Tools and skills I stopped using, and why. Don't re-propose these."
---

| What | Stopped | Why | Replaced by |
|---|---|---|---|
| **Vibe Kanban** | 2026-03-29 | Didn't work well for the inbox flow. Its MCP server is still configured and times out: remove it. | `INBOX.md` + item-* skills, then Agent Petting Zoo (August) |
| **Manual git worktrees** | 2026-05-26 | Wanted in-progress work on one branch. Superpowers' worktree step is skipped. The zoo and lab still make their own worktrees. | work on the current branch |
| **superpowers** (as the default flow) | from June 2026 | Slow subagent review loops (one took 29 minutes); the plan/execute flow moved into the zoo and Composer. Still installed. | zoo, Composer, Harbas |
| **grill-me** | 2026 | Renamed. Rounds came out as plain text; grilling asks through AskUserQuestion so it works on the phone. | `grilling` (grill-me is a stub) |
| **ruflo** plugins | never adopted | Installed 2026-05-03, never used. Candidate for removal. | — |
| **claude-fable-5-1** default | 2026-11-06 | Settings switched to `opus`. | Opus |
| **bloc, riverpod, freezed, golden_toolkit, mocktail** | 2026 | More code and build_runner for no gain in small apps. | ChangeNotifier, fromMap/toMap, plain goldens, fakes |

## Settled, don't re-propose
The house rules keep a list of approaches that were tried and dropped, so
agents stop proposing them again. Vibe Kanban and manual worktrees are on it;
the rest are project-specific experiments.
