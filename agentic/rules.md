---
title: Rules
description: "What the CLAUDE.md blueprint and the house rules tell every agent."
---

There are three layers. Agents get all three.

1. **House rules**: `~/Projects/harbas/server/harbas/prompts/rules.md`, for
   every model behind Harbas.
2. **Global CLAUDE.md**: `~/.claude/CLAUDE.md`. Almost empty on purpose; the
   rules live in the house rules and in each repo.
3. **Repo CLAUDE.md**: copied from [`templates/CLAUDE.md`](https://github.com/Bassiuz/robot-blueprint/blob/main/templates/CLAUDE.md), plus project memory.

## House rules, in short
**Talking**
- English, unless my latest message is Dutch.
- Brief: act, then report in one or two lines. Light markdown, readable on a phone.
- One question at a time, through AskUserQuestion. After "ga door", stop asking.
- Commands for me paste-ready, one line, `&&`-chained.

**Acting**
- Look things up; never invent ids, URLs or numbers.
- Verified means observed.
- "Why" / "look at" means analysis only, no fixes.
- Do what was asked; no unasked thoughts, tasks or tickets.
- Creative and personal choices stay mine.
- Work repos: never commit, push, merge or rebase. Personal: agents may. Never AI attribution.
- `project_changes` before `zoo_ask`; jobs over ~30 min are commands for me.

**Conventions**
- Work and personal never mix; gcloud/firebase default to the work account, so personal projects pass their own.
- English in code; Dutch only on screen. `fvm flutter`. Small widgets, one class per file, a golden per UI element. `decisions.md`, `engineering.md`, README in every repo.
- Self-hosted first (lifebase). Shared data caches are reused, never re-downloaded. Rig tests go through their queue, never ad-hoc scripts.
- Hardware: never diagnose from a photo; ask for a label or a measurement.
- New idea → thought or zoo drop-off, not an instant build.

## Repo CLAUDE.md blueprint
[`templates/CLAUDE.md`](https://github.com/Bassiuz/robot-blueprint/blob/main/templates/CLAUDE.md), distilled from the rules that recur across the
older Flutter repos' CLAUDE.md files and the house rules:

| Rule | Why |
|---|---|
| Read README, decisions, engineering first | the repo's memory lives there, not in chat |
| Analysis before action | a fix can undo a deliberate choice |
| Verified means observed | green tests have shipped broken features |
| Ideas go to the inbox | keeps the change small and reviewable |
| Commit allowed, no AI attribution | personal repos; attribution is noise |
| English code, Dutch screens | one language per audience |
| Delete unused code, no single-impl abstractions | less to read at 3am |
| Always fvm, never edit generated files | version drift and lost edits |
| One class per file, small widgets, theme only | findable files, consistent look |
| Golden per UI element, test before refactor | goldens catch what review misses |
| Tests are the truth | an agent "fixing" a test hides the bug |

## Where rules repeat
Three of the older Flutter repos share nearly the same CLAUDE.md (including a
duplicated "Clean up unused code" bullet), and the biggest one keeps a
CLAUDE.md per `lib/` folder. Newer repos moved the content into
`decisions.md` and `engineering.md` and skip CLAUDE.md. The template brings
CLAUDE.md back as a short pointer plus the rules, so every harness picks it up.
