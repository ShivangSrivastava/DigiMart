import express from "express";
import authenticateJWT from "../../../core/middleware/jwt";
import authenticateVendor from "../../../core/middleware/vendor";
import {
  vendorCreateProductController,
  vendorDeleteProductController,
  vendorReadProductController,
  vendorUpdateProductController,
} from "../controller/vendorProductController";

const vendorProductRouter = express.Router();

vendorProductRouter.use(authenticateJWT);
vendorProductRouter.use(authenticateVendor);
// create product
vendorProductRouter.post("/", vendorCreateProductController);

// Read own products
vendorProductRouter.get("/", vendorReadProductController);

// update product detail
vendorProductRouter.put("/:id", vendorUpdateProductController);

// delete own product
vendorProductRouter.delete("/:id", vendorDeleteProductController);

export default vendorProductRouter;
