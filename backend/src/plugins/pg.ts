import { Pool } from "pg";

export const pool = process.env.DATABASE_URL
  ? new Pool({
      connectionString: process.env.DATABASE_URL,
      ssl: { rejectUnauthorized: false },
      max: 3,
      idleTimeoutMillis: 10000,
    })
  : new Pool({
      database: process.env.DB_NAME || "examdo",
      host: process.env.DB_HOST || "localhost",
      port: Number(process.env.DB_PORT) || 5432,
      user: process.env.DB_USER || "postgres",
      password: process.env.DB_PASSWORD,
    });

pool
  .connect()
  .then((client) => {
    console.log("DB Connected");
    client.release();
  })
  .catch((error) => {
    console.error("DB connection error:", error.message);
  });
