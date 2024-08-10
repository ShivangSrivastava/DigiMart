import express from "express";
import {
  userCreateOrderController,
  userDeleteOrderController,
  userPaymentController,
  userViewOrderController,
} from "../../controller/user/orderController";
import authenticateJWT from "../../middleware/jwt";

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
