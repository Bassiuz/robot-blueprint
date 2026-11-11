import { getFirestore } from "firebase-admin/firestore";
import { HttpsError, onCall } from "firebase-functions/v2/https";

/** App action: create a tally. Auth first, then input, then data. */
export const addTally = onCall(async (request) => {
  if (!request.auth) throw new HttpsError("unauthenticated", "Sign in first.");
  const name = String(request.data?.name ?? "").trim();
  if (!name || name.length > 60) throw new HttpsError("invalid-argument", "Name must be 1-60 characters.");
  const ref = await getFirestore().collection("tallies").add({ name, count: 0, owner: request.auth.uid });
  return { id: ref.id };
});
