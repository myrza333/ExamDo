import { NextFunction, Request, Response } from "express";

export const errorHandler = (
  err: any,
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  if (err.type === "entity.parse.failed") {
    return res.status(400).json({
      message: "Invalid JSON",
    });
  }

  if (err.status && err.status < 500 && err.message) {
    return res.status(err.status).json({
      message: err.message,
    });
  }

  console.error(err);
  return res.status(500).json({
    message: "Internal Server Error",
  });
};
