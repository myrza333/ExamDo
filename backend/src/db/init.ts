import "../plugins/env";
import fs from "node:fs";
import path from "node:path";
import { pool } from "../plugins/pg";

const dbDir = path.join(__dirname, "../../../db");
const force = process.argv.includes("--force");

const initDb = async () => {
  const exists = await pool.query(
    "select to_regclass('public.questions') as name",
  );
  if (exists.rows[0]?.name && !force) {
    console.log("База уже заполнена. Для полной перезаливки: npm run db:init -- --force");
    return;
  }

  if (force) {
    await pool.query("drop table if exists tasks, questions, guests");
    console.log("Старые таблицы удалены");
  }

  const files = fs
    .readdirSync(dbDir)
    .filter((file) => file.endsWith(".sql"))
    .sort();

  for (const file of files) {
    await pool.query(fs.readFileSync(path.join(dbDir, file), "utf8"));
    console.log("Загружен", file);
  }

  const counts = await pool.query(
    `
    select
      (select count(*) from questions)::int as questions,
      (select count(*) from tasks)::int as tasks,
      (select count(*) from guests)::int as guests
    `,
  );
  console.log("Готово:", counts.rows[0]);
};

initDb()
  .catch((error) => {
    console.error("Ошибка:", error.message);
    process.exitCode = 1;
  })
  .finally(() => pool.end());
