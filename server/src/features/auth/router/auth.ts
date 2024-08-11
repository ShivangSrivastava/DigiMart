import express from "express";
import {
  loginController,
  registerController,
} from "../controller/authController";

const authRouter = express.Router();

// login api
authRouter.post("/login", loginController);

// register api
authRouter.post("/register", registerController);

export default authRouter;
