import e from "express";
import OrderModel from "../../model/order/orderModel";

export const vendorGetAllOrderController = (
  req: e.Request,
  res: e.Response
) => {
  const vendorID = (req as any).user?.id;
  OrderModel.find({ vendorID: vendorID })
    .then((orders) => res.json(orders))
    .catch((err) => res.status(500).json({ error: err }));
};
export const vendorOrderDetailController = (
  req: e.Request,
  res: e.Response
) => {
  const vendorID = (req as any).user?.id;
  const orderID = req.params.orderID;
  OrderModel.findOne({ vendorID: vendorID, orderID: orderID })
    .then((order) => res.json(order))
    .catch((err) => res.status(500).json({ error: err }));
};
export const vendorUpdateOrderController = (
  req: e.Request,
  res: e.Response
) => {
  const vendorID = (req as any).user?.id;
  const orderID = req.params.orderID;
  const status = req.body.status;
  OrderModel.findOneAndUpdate(
    { vendorID: vendorID, orderID: orderID },
    { status },
    { new: true }
  )
    .then((order) => res.json(order))
    .catch((err) => res.status(500).json({ error: err }));
};
