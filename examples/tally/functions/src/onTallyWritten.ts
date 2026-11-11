import { getFirestore } from "firebase-admin/firestore";
import { onDocumentWritten } from "firebase-functions/v2/firestore";
import { applyChange, Totals } from "./totals";

/** Keeps meta/totals in step with the tallies collection. Clients may not write it. */
export const onTallyWritten = onDocumentWritten("tallies/{id}", async (event) => {
  const before = event.data?.before.data()?.count as number | undefined;
  const after = event.data?.after.data()?.count as number | undefined;
  const ref = getFirestore().doc("meta/totals");
  await getFirestore().runTransaction(async (tx) => {
    const current = ((await tx.get(ref)).data() as Totals | undefined) ?? { tallies: 0, count: 0 };
    tx.set(ref, applyChange(current, before, after));
  });
});
