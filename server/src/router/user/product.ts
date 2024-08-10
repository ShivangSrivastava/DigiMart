import express from "express";
import {
  userGetAllCategoryController,
  userProductOnCategoryController,
  userSearchController,
} from "../../controller/user/productController";
import authenticateJWT from "../../middleware/jwt";

const userProductRouter = express.Router();

userProductRouter.use(authenticateJWT);

userProductRouter.get("/all-categories", userGetAllCategoryController);

userProductRouter.get("/:category", userProductOnCategoryController);

userProductRouter.get("/search/:q", userSearchController);

export default userProductRouter;
