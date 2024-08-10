import express from "express";
import {
  vendorCreateProductController,
  vendorDeleteProductController,
  vendorReadProductController,
  vendorUpdateProductController,
} from "../../controller/vendor/productController";
import authenticateJWT from "../../middleware/jwt";
import authenticateVendor from "../../middleware/vendor";

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
