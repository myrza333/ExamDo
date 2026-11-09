import { NextFunction, Request, Response } from "express";
import {
  checkAnswerService,
  getRandomQuestionsService,
} from "./questions.service";

export const getRandomQuestionsController = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const result = await getRandomQuestionsService(15);

    res.status(200).json({
      message: "Random questions",
      data: result,
    });
  } catch (error: any) {
    next(error);
  }
};

export const checkAnswerController = async (
  req: Request<{}, {}, { id: number; answer: string }>,
  res: Response,
  next: NextFunction,
) => {
  try {
    const body = req.body;
    const result = await checkAnswerService(body);

    res.status(200).json({
      message: "Answer checked",
      data: result,
    });
  } catch (error: any) {
    next(error);
  }
};
