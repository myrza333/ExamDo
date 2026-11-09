import { NextFunction, Request, Response } from "express";
import {
  getRandomTasksService,
  getSolutionTasksService,
} from "./tasks.service";

export const getRandomTasksController = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const level = String(req.query.level ?? "easy");
    const result = await getRandomTasksService(level, 5);

    res.status(200).json({
      message: "Random tasks",
      data: result,
    });
  } catch (error: any) {
    next(error);
  }
};

export const getSolutionTasksController = async (
  req: Request<{ id: string }>,
  res: Response,
  next: NextFunction,
) => {
  try {
    const id = Number(req.params.id);
    const result = await getSolutionTasksService(id);

    res.status(200).json({
      message: "Task solution",
      data: result,
    });
  } catch (error: any) {
    next(error);
  }
};
