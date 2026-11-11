---
title: Agents
description: "Which agents run where, on which model."
---

There are no custom subagent definitions (`~/.claude/agents/` does not exist).
The "agents" are the harnesses and the roles the tools give them.

| Agent | Runs in | Model / account | Used for |
|---|---|---|---|
| Claude Code | terminal, Orca panes | Opus (settings `model: opus`), MAX | interactive work in a repo |
| Harbas chat | Harbas web / phone / Orca | Claude or Codex, **Auto** | capture, triage, tasks, zoo, reviews |
| Zoo groomer | Agent Petting Zoo | `claude -p` | refining drop-offs into tickets, asking questions |
| Zoo implementer | Zoo, `.zoo-worktrees/` | `claude -p` | implement, test, open PR |
| Review Coach | Review Coach | `claude -p` | explaining a PR in pages |
| Composer planner | Project Composer | `claude -p` | plans for hand-coding |
| Lab researcher | Experiment Lab | `claude -p` (`lab-research`) | proposing experiments |
| Codex | `~/.codex`, Harbas | ChatGPT subscription | second harness when Claude has no room |
| Subagents | inside Claude Code | per task | Explore for wide searches, plugin reviewers |

## Right-sizing
- Medium effort by default; a mechanical job doesn't need the biggest model.
- Anything over ~30 minutes of machine time is a command to run, not a job to wait on.
- Never re-run a full subagent review after a small fix (a 29-minute loop taught that).

## Two accounts
- `~/.claude` is the personal account; a second config folder (picked with
  `CLAUDE_CONFIG_DIR`) is the work account, with the org's limits. Most of it is
  symlinked to `~/.claude`; history and project memory are its own.
