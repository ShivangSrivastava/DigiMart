import express from "express";
import ProductModel from "../../products/model/productModel";
import OrderModel from "../model/orderModel";

export const userCreateOrderController = (
  req: express.Request,
  res: express.Response
) => {
  const userID = (req as any).user?.id;
  const { quantity, productID } = req.body;
  ProductModel.findById(productID).then((product) => {
    if (!product) {
      return res.status(404).json({ message: "Product not found" });
    }
    if ((product as any).stock < quantity) {
      return res.status(400).json({ message: "Not enough products in stock" });
    }
    const stock = (product as any).stock - quantity;
    ProductModel.findByIdAndUpdate(productID, { stock }, { new: true }).then(
      (newProduct) => {
        const totalPrice =
          Math.round((newProduct as any).price * quantity * 100) / 100;
        const order = new OrderModel({
          productID,
          userID,
          quantity,
          totalPrice,
        });

        order
          .save()
          .then((order) => res.status(201).json(order))
          .catch((err: any) => res.status(500).json(err));
      }
    );
  });
};

export const userViewOrderController = (
  req: express.Request,
  res: express.Response
) => {
  const userID = (req as any).user?.id;
  OrderModel.find({ userID })
    .then((orders) => res.status(200).json(orders))
    .catch((err: any) => res.status(500).json(err));
};
export const userDeleteOrderController = (
  req: express.Request,
  res: express.Response
) => {
  const { orderID } = req.body;
  OrderModel.findByIdAndDelete(orderID).then((order) => {
    if (!order) return res.status(404).json({ message: "Order not found" });
    ProductModel.findById(order.productID)
      .then((product) => {
        const stock = (product as any).stock + order.quantity;
        ProductModel.findByIdAndUpdate(
          order.productID,
          { stock },
          { new: true }
        ).then((newProduct) => {
          res.status(200).json(order);
        });
      })
      .catch((err: any) => res.status(500).json(err));
  });
};

export const userPaymentController = (
  req: express.Request,
  res: express.Response
) => {
  const orderID = req.params.id;
  const { paymentStatus } = req.body;
  OrderModel.findByIdAndUpdate(orderID, { paymentStatus })
    .then((order) => res.status(200).json(order))
    .catch((err: any) => res.status(500).json(err));
};
