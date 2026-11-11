---
title: Toolkit
description: "The local tools that make up the harness."
---

All the local tools share one shape: **Nuxt + Tailwind + better-sqlite3 + Vitest**,
pnpm, kept running by launchd, and calling the `claude` CLI on the MAX
subscription (no API key). Each has a `decisions.md`.

## Harbas — `:4272`, `~/Projects/harbas`
*Harness + Bas.* One chat front door and a "what's waiting on you" dashboard.
A message becomes a thought (linked in the thought bank), an idea, a zoo
ticket, a Review Coach review, or a Seedling task with its Jira ticket. Runs on
Claude or Codex CLI, **Auto** picks whichever has room. Local sqlite with
Firestore sync across machines, a Flutter mobile app, an MCP server (the
`harbas` tools every agent gets), and an Orca integration (`orca/harbas-orca.mjs`).
Its `server/harbas/prompts/rules.md` holds the house rules for every model.

## Agent Petting Zoo — `:12345`, `~/Projects/agent_petting_zoo`
A kanban that agents read and work from:
Drop-off → Grooming → Trough → Paddock → School → Course → Ring → Moment → Meadow.
Agents refine tickets, implement them in `.zoo-worktrees/`, run tests and open
PRs. A repo joins as an **enclosure** (the `zoo-enclosure` skill).

## Review Coach — `:9670`, `~/Projects/review_coach`
Walks a PR page by page in plain language and turns the notes into inline PR comments.

## Project Composer — `:9671`, `~/Projects/project-composer`
The hand-coding counterpart to the zoo. Claude reads the repo and writes a plan
(a schematic, then code to place, with tests in between); I write the code.

## Experiment Lab — `:12346`
Kanban for experiments that need numbers (a model, a pipeline step). Ideas are
measured on a test rig against a baseline; results go to the Show Ring or are
filed as failed, numbers kept. Driven by the `lab-*` skills; rig runs go
through a queue, never ad-hoc scripts.

## Seedling — `~/Seedling`
Daily-planning notebook on phone, Mac and a colour e-ink tablet. Tasks, Jira
links, quarter-hour time logging and the weekly timesheet, all reachable from Harbas.

## Orca — `/Applications/Orca.app`
Agent IDE / terminal multiplexer (stablyai). Hooks into Claude Code, Codex,
Copilot and opencode to show per-pane agent status and permission prompts.
Adopted 2026-11-06; `ctrl+alt+g` opens the agent view. Harbas plugs in as a harness.

## lifebase — `~/Projects/lifebase`
Home server: ThinkCentre, ZFS, Docker Compose, Cloudflare Tunnel, Tailscale,
Restic to Hetzner. Hosts self-hosted services (ntfy for Harbas pushes, Python
services). Self-hosted first.

## Testing tools
- **jewelry**: own Dart package for integration tests and video goldens on emulators,
  with `jewelry_firebase` seeding the Firebase emulators.
- **test_laser** / **build_laser**: run Flutter tests and builds with readable output.

## Other agents' homes
- **Codex CLI** (`~/.codex`): Harbas's second harness; has the Orca hooks.
- **opencode** (`~/.config/opencode`): Cloudflare skills plus the Orca status plugin.
- **Notes vault**: weekly and quarterly reviews (`quarterly-review` skill).
