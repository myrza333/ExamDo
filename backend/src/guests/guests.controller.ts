import { NextFunction, Request, Response } from "express";
import { getOneGuestsService, postGuestsService } from "./guests.service";
import { addGuest } from "../middlewares/guestLimit";

export const postGuestsController = async (
  req: Request<{}, {}, { name: string }>,
  res: Response,
  next: NextFunction,
) => {
  try {
    const body = req.body;
    const result = await postGuestsService(body);

    if ("admin" in result) {
      res.status(200).json({
        message: "Admin password required",
        data: result,
      });
      return;
    }

    addGuest(req);
    res.status(201).json({
      message: "Guest created successfully",
      data: result,
    });
  } catch (error: any) {
    next(error);
  }
};

export const getOneGuestsController = async (
  req: Request<{ id: string }>,
  res: Response,
  next: NextFunction,
) => {
  try {
    const id = Number(req.params.id);
    const result = await getOneGuestsService(id);

    res.status(200).json({
      message: "Get guest by id",
      data: result,
    });
  } catch (error: any) {
    next(error);
  }
};
