import express from "express";
import {
  deleteProfileController,
  getProfileController,
  putProfileController,
} from "../../controller/auth/profileController";
import authenticateJWT from "../../middleware/jwt";

const profileRouter = express.Router();

profileRouter.use(authenticateJWT);

profileRouter.get("/", getProfileController);

profileRouter.put("/", putProfileController);

profileRouter.delete("/", deleteProfileController);

export default profileRouter;
