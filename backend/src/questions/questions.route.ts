import { Router } from "express";
import {
  checkAnswerController,
  getRandomQuestionsController,
} from "./questions.controller";

const router = Router();
router.get("/random", getRandomQuestionsController);
router.post("/check", checkAnswerController);

export default router;
