import "../plugins/env";
import { pool } from "../plugins/pg";

pool
  .query(
    "select (select count(*) from questions)::int as questions, (select count(*) from tasks)::int as tasks, (select count(*) from guests)::int as guests",
  )
  .then((result) => console.log("База:", result.rows[0]))
  .catch((error) => {
    console.error("Ошибка:", error.message);
    process.exitCode = 1;
  })
  .finally(() => pool.end());
