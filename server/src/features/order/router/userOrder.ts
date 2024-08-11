import express from "express";
import authenticateJWT from "../../../core/middleware/jwt";
import { userCreateOrderController, userViewOrderController, userDeleteOrderController, userPaymentController } from "../controller/userOrderController";

const userOrderRouter = express.Router();
userOrderRouter.use(authenticateJWT);

// create an order
userOrderRouter.post("/", userCreateOrderController);

// view orders
userOrderRouter.get("/", userViewOrderController);

// cancel order
userOrderRouter.delete("/", userDeleteOrderController);

// payment
userOrderRouter.put("/:id", userPaymentController);

export default userOrderRouter;
