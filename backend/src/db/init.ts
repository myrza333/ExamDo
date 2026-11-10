import "../plugins/env";
import fs from "node:fs";
import path from "node:path";
import { pool } from "../plugins/pg";

const dbDir = path.join(__dirname, "../../../db");
const force = process.argv.includes("--force");
const onlyQuestions = process.argv.includes("--questions");

const readSql = () =>
  fs
    .readdirSync(dbDir)
    .filter((file) => file.endsWith(".sql"))
    .sort()
    .map((file) => ({
      file,
      sql: fs.readFileSync(path.join(dbDir, file), "utf8"),
    }));

const printCounts = async () => {
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

const reloadQuestions = async () => {
  const files = readSql().filter((el) =>
    el.sql.trimStart().startsWith("insert into questions"),
  );
  const client = await pool.connect();
  try {
    await client.query("begin");
    await client.query("truncate questions restart identity");
    for (const el of files) {
      await client.query(el.sql);
      console.log("Загружен", el.file);
    }
    await client.query("commit");
  } catch (error) {
    await client.query("rollback");
    throw error;
  } finally {
    client.release();
  }
};

const initDb = async () => {
  if (onlyQuestions) {
    await reloadQuestions();
    await printCounts();
    return;
  }

  const exists = await pool.query(
    "select to_regclass('public.questions') as name",
  );
  if (exists.rows[0]?.name && !force) {
    console.log("База уже заполнена. Для полной перезаливки: npm run db:init -- --force");
    console.log("Только вопросы: npm run db:init -- --questions");
    return;
  }

  if (force) {
    await pool.query("drop table if exists tasks, questions, guests");
    console.log("Старые таблицы удалены");
  }

  for (const el of readSql()) {
    await pool.query(el.sql);
    console.log("Загружен", el.file);
  }
  await printCounts();
};

initDb()
  .catch((error) => {
    console.error("Ошибка:", error.message);
    process.exitCode = 1;
  })
  .finally(() => pool.end());
