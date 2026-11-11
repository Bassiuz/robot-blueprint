// Pure logic: no Firebase imports, so it tests with node --test.

export interface Totals {
  tallies: number;
  count: number;
}

export function applyChange(totals: Totals, before?: number, after?: number): Totals {
  return {
    tallies: totals.tallies + (after === undefined ? 0 : 1) - (before === undefined ? 0 : 1),
    count: totals.count + (after ?? 0) - (before ?? 0),
  };
}
