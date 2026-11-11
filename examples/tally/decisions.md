# Decisions

## 2026-11-11 Totals are derived by a function
**Why:** the client can't be trusted to keep `meta/totals` right, and the rules
can then forbid client writes to it.
**Revisit when:** totals need to be per user.

## 2026-11-11 Tallies are created through `addTally`, not by the client
**Why:** the function sets `owner` and validates the name in one place; the
rules only allow the owner to change `count`.
