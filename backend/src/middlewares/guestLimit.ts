import { NextFunction, Request, Response } from "express";
import { apiErrors } from "../utils/apiErrors";
import { isAdminLogin } from "../admin/admin.service";

const maxGuests = 10;
const period = 60 * 60 * 1000;
const created = new Map<string, number[]>();

const getIp = (req: Request) => req.ip ?? "unknown";

const getRecent = (ip: string) =>
  (created.get(ip) ?? []).filter((time) => time > Date.now() - period);

export const guestLimit = (req: Request, res: Response, next: NextFunction) => {
  if (isAdminLogin(req.body?.name?.trim() ?? "")) return next();
  const recent = getRecent(getIp(req));
  if (recent.length >= maxGuests) {
    const oldest = recent[0] ?? Date.now();
    const minutes = Math.ceil((oldest + period - Date.now()) / 60000);
    return next(
      apiErrors.limit(
        `Слишком много новых гостей с этого устройства. Попробуй через ${minutes} мин.`,
      ),
    );
  }
  next();
};

export const addGuest = (req: Request) => {
  const ip = getIp(req);
  created.set(ip, [...getRecent(ip), Date.now()]);
};
