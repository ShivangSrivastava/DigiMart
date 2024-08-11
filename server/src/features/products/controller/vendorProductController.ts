import express from "express";
import UserModel from "../../../core/common/userModel";
import ProductModel from "../model/productModel";

export const vendorCreateProductController = async (
  req: express.Request,
  res: express.Response
) => {
  const id = (req as any).user?.id;
  UserModel.findById(id).then(async (user) => {
    if (!user || user.role != "vendor") {
      res.status(400).json({ message: "invalid credentials" });
    } else {
      const { name, desc, category, price, stock, images } = req.body;

      try {
        const newProduct = new ProductModel({
          name: name,
          desc: desc,
          category: category,
          price: price,
          stock: stock,
          images: images,
          venderId: id,
        });
        await newProduct.save();
        res.status(200).json({ message: "Product created successful" });
      } catch (err) {
        res.status(400).json({ message: "Something went wrong" });
      }
    }
  });
};
export const vendorReadProductController = async (
  req: express.Request,
  res: express.Response
) => {
  const id = (req as any).user?.id;
  UserModel.findById(id).then(async (user) => {
    if (!user || user.role != "vendor") {
      res.status(400).json({ message: "invalid credentials" });
    } else {
      try {
        const products = await ProductModel.find({ venderId: id });
        res.status(200).json({ products });
      } catch (err) {
        res.status(400).json({ message: "Something went wrong" });
      }
    }
  });
};
export const vendorUpdateProductController = (
  req: express.Request,
  res: express.Response
) => {
  const productId = req.params.id;
  const { name, desc, category, price, stock, images } = req.body;

  ProductModel.findByIdAndUpdate(
    productId,
    { name, desc, category, price, stock, images },
    { new: true }
  ).then((product) => {
    if (!product) {
      res.status(400).json({ message: "Product not found" });
    } else {
      res.status(200).json(product);
    }
  });
};
export const vendorDeleteProductController = (
  req: express.Request,
  res: express.Response
) => {
  const productId = req.params.id;
  ProductModel.findByIdAndDelete(productId).then((_product: any) => {
    res.status(200).json({ message: "Deleted Successfully" });
  });
};
