import { pool } from "../plugins/pg";
import { apiErrors } from "../utils/apiErrors";
import { isAdminLogin } from "../admin/admin.service";

interface IBody {
  name: string;
}

export const postGuestsService = async (body: IBody) => {
  const name = body.name?.trim();
  if (!name) throw apiErrors.badRequest("Name is required");
  if (name.length > 50) throw apiErrors.badRequest("Name is too long");
  if (isAdminLogin(name)) return { admin: true };

  const result = await pool.query(
    `
    insert into guests (name)
    values ($1)
    returning id, name
    `,
    [name],
  );
  return result.rows[0];
};

export const getOneGuestsService = async (id: number) => {
  if (!Number.isInteger(id) || id < 1) throw apiErrors.badRequest("Wrong id");
  const result = await pool.query(
    `
    select id, name from guests where id = $1
    `,
    [id],
  );
  if (!result.rows[0]) throw apiErrors.notFound("Guest not found");

  return result.rows[0];
};
