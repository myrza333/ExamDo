import { Router } from "express";
import {
  deleteAdminGuestsController,
  getAdminGuestsController,
  loginAdminController,
} from "./admin.controller";
import { adminAuth } from "../middlewares/adminAuth";
import { loginLimit } from "../middlewares/loginLimit";

const router = Router();
router.post("/login", loginLimit, loginAdminController);
router.get("/guests", adminAuth, getAdminGuestsController);
router.delete("/guests/:id", adminAuth, deleteAdminGuestsController);

export default router;
