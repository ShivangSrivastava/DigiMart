import express from "express";
import authenticateJWT from "../../../core/middleware/jwt";
import authenticateVendor from "../../../core/middleware/vendor";
import {
  vendorGetAllOrderController,
  vendorOrderDetailController,
  vendorUpdateOrderController,
} from "../controller/vendorOrderController";

const vendorOrderRouter = express.Router();

vendorOrderRouter.use(authenticateJWT);
vendorOrderRouter.use(authenticateVendor);

// Get all orders for a specific vendor.
vendorOrderRouter.get("/", vendorGetAllOrderController);

// Get details of a specific order.
vendorOrderRouter.get("/:orderID", vendorOrderDetailController);

// Update the status of the order to “Shipped”, “Delivered”
vendorOrderRouter.put("/:orderID", vendorUpdateOrderController);

export default vendorOrderRouter;
