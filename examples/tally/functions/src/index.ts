import { initializeApp } from "firebase-admin/app";
import { setGlobalOptions } from "firebase-functions/v2";

initializeApp();
setGlobalOptions({ region: "europe-west4" });

export * from "./onTallyWritten";
export * from "./addTally";
