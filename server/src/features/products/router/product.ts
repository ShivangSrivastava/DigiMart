import express from "express";
import {
  getAllCategoryController,
  productOnCategoryController,
  searchController,
} from "../controller/productController";

const productRouter = express.Router();

productRouter.get("/all-categories", getAllCategoryController);

productRouter.get("/:category", productOnCategoryController);

productRouter.get("/search/:q", searchController);

export default productRouter;
