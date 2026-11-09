import { Router } from "express";
import {
  getRandomTasksController,
  getSolutionTasksController,
} from "./tasks.controller";

const router = Router();
router.get("/random", getRandomTasksController);
router.get("/:id/solution", getSolutionTasksController);

export default router;
