import express from "express";
import cors from "cors";
import compression from "compression";
import guestsRouter from "./guests/guests.route";
import questionsRouter from "./questions/questions.route";
import adminRouter from "./admin/admin.route";
import tasksRouter from "./tasks/tasks.route";
import { logger } from "./middlewares/logger";
import { errorHandler } from "./middlewares/errorHandler";

const origins = (process.env.CORS_ORIGIN || "http://localhost:3000")
  .split(",")
  .map((el) => el.trim());

const createApi = () => {
  const app = express();
  app.disable("x-powered-by");
  app.set("trust proxy", true);
  app.use(cors({ origin: origins }));
  app.use(compression());

  app.use(express.json({ limit: "20kb" }));
  if (process.env.NODE_ENV !== "production") app.use(logger);
  app.get("/health", (req, res) => {
    res.status(200).json({ message: "ok" });
  });
  app.use("/guests", guestsRouter);
  app.use("/questions", questionsRouter);
  app.use("/admin", adminRouter);
  app.use("/tasks", tasksRouter);
  app.use(errorHandler);
  return app;
};
export default createApi;
