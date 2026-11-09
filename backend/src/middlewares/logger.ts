import { NextFunction, Request, Response } from "express";

export const logger = (req: Request, res: Response, next: NextFunction) => {
  console.log(`
    Time:             Method:                URL:
    ${new Date()}     ${req.method} ===>   ${req.url}
    `);
  next();
};
