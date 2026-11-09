import { pool } from "../plugins/pg";
import { apiErrors } from "../utils/apiErrors";
import { cached } from "../utils/cache";
import { mixTopics, pickByTopic, shuffle } from "../utils/random";

interface ITask {
  id: number;
  level: string;
  topic: string;
  title: string;
  description: string;
  fn: string;
  params: string;
  tests: unknown[];
  forbidden: string[];
  required: string[];
}

const levels = ["easy", "hard"];

const getAllTasks = () =>
  cached("tasks", async () => {
    const result = await pool.query<ITask>(
      `
      select id, level, topic, title, description, fn, params, tests, forbidden, required
      from tasks
      `,
    );
    return result.rows;
  });

export const getRandomTasksService = async (level: string, count: number) => {
  if (!levels.includes(level)) throw apiErrors.badRequest("Wrong level");

  const tasks = await getAllTasks();
  const byLevel = tasks.filter((el) => el.level === level);

  return mixTopics(pickByTopic(shuffle(byLevel), count, 2));
};

export const getSolutionTasksService = async (id: number) => {
  if (!Number.isInteger(id) || id < 1) throw apiErrors.badRequest("Wrong id");

  const result = await pool.query(
    `
    select solution, explanation from tasks where id = $1
    `,
    [id],
  );
  if (!result.rows[0]) throw apiErrors.notFound("Task not found");

  return result.rows[0];
};
