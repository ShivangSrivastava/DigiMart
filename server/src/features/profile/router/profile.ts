import express from "express";
import authenticateJWT from "../../../core/middleware/jwt";
import {
  deleteProfileController,
  getProfileController,
  putProfileController,
} from "../controller/profileController";

const profileRouter = express.Router();

profileRouter.use(authenticateJWT);

profileRouter.get("/", getProfileController);

profileRouter.put("/", putProfileController);

profileRouter.delete("/", deleteProfileController);

export default profileRouter;
