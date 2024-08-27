import express from "express";
import ProductModel from "./features/products/model/productModel";

const addProductRouter = express.Router();

// Add product route
addProductRouter.post("/", async (req, res) => {
  try {
    // Extract data from request body
    const { name, desc, category, price, stock, images } = req.body;

    // Validate required fields
    if (!name || !desc || !category || !price || !stock || !images) {
      return res.status(400).json({ error: "All fields are required" });
    }

    // Create a new product instance
    const newProduct = new ProductModel({
      name,
      desc,
      category,
      price,
      stock,
      images,
    });

    // Save the product to the database
    const savedProduct = await newProduct.save();

    // Respond with the saved product
    res.status(201).json(savedProduct);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});

export default addProductRouter;
