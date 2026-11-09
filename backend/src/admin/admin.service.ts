import { createHash, timingSafeEqual } from "node:crypto";
import jwt from "jsonwebtoken";
import { pool } from "../plugins/pg";
import { apiErrors } from "../utils/apiErrors";

interface ILoginBody {
  login: string;
  password: string;
}

const same = (a: string, b: string) =>
  timingSafeEqual(
    createHash("sha256").update(a).digest(),
    createHash("sha256").update(b).digest(),
  );

export const isAdminLogin = (name: string) => {
  const login = process.env.ADMIN_LOGIN;
  return !!login && name === login;
};

export const loginAdminService = (body: ILoginBody) => {
  const login = process.env.ADMIN_LOGIN;
  const password = process.env.ADMIN_PASSWORD;
  const secret = process.env.ADMIN_SECRET;
  if (!login || !password || !secret)
    throw apiErrors.forbidden("Вход админа не настроен");

  const ok =
    same(body.login ?? "", login) && same(body.password ?? "", password);
  if (!ok) return null;

  return jwt.sign({ role: "admin" }, secret, { expiresIn: "12h" });
};

export const getAdminGuestsService = async () => {
  const result = await pool.query(
    `
    select id, name, created_at from guests
    order by id desc
    `,
  );
  return result.rows;
};

export const deleteAdminGuestsService = async (id: number) => {
  if (!Number.isInteger(id) || id < 1) throw apiErrors.badRequest("Wrong id");
  const result = await pool.query(
    `
    delete from guests where id = $1
    returning id, name
    `,
    [id],
  );
  if (!result.rows[0]) throw apiErrors.notFound("Guest not found");

  return result.rows[0];
};
