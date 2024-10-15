import mongoose from "mongoose";

const orderSchema = new mongoose.Schema({
  productID: {
    type: String,
    required: true,
  },
  userID: {
    type: String,
    required: true,
  },
  quantity: {
    type: Number,
    required: true,
  },
  totalPrice: {
    type: Number,
    required: true,
  },
  shippingStatus: {
    type: String,
    default: "pending",
    enum: ["pending", "shipped", "delivered"],
  },
  date: {
    type: Date,
    default: Date.now,
  },
});
const OrderModel = mongoose.model("Order", orderSchema);
export default OrderModel;
