import { NextFunction, Request, Response } from "express";
import {
  deleteAdminGuestsService,
  getAdminGuestsService,
  loginAdminService,
} from "./admin.service";
import { addFail, clearFails } from "../middlewares/loginLimit";
import { apiErrors } from "../utils/apiErrors";

export const loginAdminController = async (
  req: Request<{}, {}, { login: string; password: string }>,
  res: Response,
  next: NextFunction,
) => {
  try {
    const token = loginAdminService(req.body);
    if (!token) {
      addFail(req);
      throw apiErrors.unauthorized("Неверный логин или пароль");
    }
    clearFails(req);

    res.status(200).json({
      message: "Admin logged in",
      data: { token },
    });
  } catch (error: any) {
    next(error);
  }
};

export const getAdminGuestsController = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const result = await getAdminGuestsService();

    res.status(200).json({
      message: "All guests",
      data: result,
    });
  } catch (error: any) {
    next(error);
  }
};

export const deleteAdminGuestsController = async (
  req: Request<{ id: string }>,
  res: Response,
  next: NextFunction,
) => {
  try {
    const id = Number(req.params.id);
    const result = await deleteAdminGuestsService(id);

    res.status(200).json({
      message: "Guest deleted successfully",
      deleted: result,
    });
  } catch (error: any) {
    next(error);
  }
};
