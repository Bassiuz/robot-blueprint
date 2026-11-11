---
title: How I work with agents
description: "The loop from idea to merged code, and where each tool sits in it."
---

## The loop
1. **Capture.** Anything that comes up goes into **Harbas** chat (desktop, phone,
   or Orca). A thought is saved and linked, an idea is flagged, a task lands in
   **Seedling**. Nothing gets built on the spot.
2. **Drop off.** Work for an agent becomes a ticket in the **Agent Petting Zoo**.
   Agents groom it (asking questions back), then implement it in a worktree,
   run the repo's tests, and open a PR.
3. **Review.** **Review Coach** walks the PR page by page in plain language and
   turns my notes into inline comments.
4. **Hand-code what matters.** Tickets that are too big or too much mine go to
   **Project Composer**: Claude writes the plan and tests, I write the code.
5. **Experiment.** Ideas that need numbers go to the **Experiment Lab**, measured on a test rig
   against a baseline, kept or failed with numbers.
6. **Remember.** Per-project memory plus `decisions.md` / `engineering.md` in
   every repo carry what was learned into the next session.

## Pages
- [Toolkit](/agentic/toolkit): Harbas, Zoo, Review Coach, Composer, Lab, Seedling, Orca, lifebase.
- [Agents](/agentic/agents): which agents and models run where.
- [Skills](/agentic/skills): active skills and plugins.
- [Retired](/agentic/retired): what I stopped using, and why.
- [Config and hooks](/agentic/config): the two config folders, hooks, MCP servers.
- [Rules](/agentic/rules): what the CLAUDE.md blueprint and the house rules say.
- [Rule and memory files](/agentic/files): every CLAUDE.md, AGENTS.md, harness prompt and memory file, readable in place.
