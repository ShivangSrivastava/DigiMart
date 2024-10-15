import express from "express";
import authenticateJWT from "../../../core/middleware/jwt";
import {
  createOrderController,
  deleteOrderController,
  viewOrderController,
} from "../controller/orderController";

const orderRouter = express.Router();
orderRouter.use(authenticateJWT);

// create an order
orderRouter.post("/", createOrderController);

// view orders
orderRouter.get("/", viewOrderController);

// cancel order
orderRouter.delete("/", deleteOrderController);

export default orderRouter;
