import { NextFunction, Request, Response } from "express";
import { apiErrors } from "../utils/apiErrors";

const maxAttempts = 5;
const blockTime = 15 * 60 * 1000;
const attempts = new Map<string, { count: number; until: number }>();

const getIp = (req: Request) => req.ip ?? "unknown";

export const loginLimit = (req: Request, res: Response, next: NextFunction) => {
  const item = attempts.get(getIp(req));
  if (item && item.count >= maxAttempts && item.until > Date.now()) {
    const minutes = Math.ceil((item.until - Date.now()) / 60000);
    return next(
      apiErrors.limit(`Слишком много попыток. Попробуй через ${minutes} мин.`),
    );
  }
  next();
};

export const addFail = (req: Request) => {
  const ip = getIp(req);
  const item = attempts.get(ip);
  const fresh = !item || item.until < Date.now();
  attempts.set(ip, {
    count: fresh ? 1 : item.count + 1,
    until: Date.now() + blockTime,
  });
};

export const clearFails = (req: Request) => {
  attempts.delete(getIp(req));
};
