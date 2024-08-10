import express from "express";
import {
  vendorGetAllOrderController,
  vendorOrderDetailController,
  vendorUpdateOrderController,
} from "../../controller/vendor/orderController";
import authenticateJWT from "../../middleware/jwt";
import authenticateVendor from "../../middleware/vendor";

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
