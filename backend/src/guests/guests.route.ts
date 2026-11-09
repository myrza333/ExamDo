import { Router } from "express";
import {
  getOneGuestsController,
  postGuestsController,
} from "./guests.controller";
import { guestLimit } from "../middlewares/guestLimit";

const router = Router();
router.post("/", guestLimit, postGuestsController);
router.get("/:id", getOneGuestsController);

export default router;
