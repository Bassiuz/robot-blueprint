import { test } from "node:test";
import assert from "node:assert/strict";
import { applyChange } from "./totals";

test("create, update and delete keep totals right", () => {
  let t = { tallies: 0, count: 0 };
  t = applyChange(t, undefined, 3);
  assert.deepEqual(t, { tallies: 1, count: 3 });
  t = applyChange(t, 3, 5);
  assert.deepEqual(t, { tallies: 1, count: 5 });
  t = applyChange(t, 5, undefined);
  assert.deepEqual(t, { tallies: 0, count: 0 });
});
