import { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";
import { apiErrors } from "../utils/apiErrors";

export const adminAuth = (req: Request, res: Response, next: NextFunction) => {
  const token = req.headers.authorization?.replace("Bearer ", "");
  const secret = process.env.ADMIN_SECRET;
  if (!token || !secret) return next(apiErrors.unauthorized("Нужен вход админа"));

  try {
    const payload = jwt.verify(token, secret) as { role?: string };
    if (payload.role !== "admin") throw new Error();
    next();
  } catch {
    next(apiErrors.unauthorized("Сессия админа истекла, войди заново"));
  }
};
