import mongoose from "mongoose";

const productSchema = new mongoose.Schema({
  venderId: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  desc: {
    type: String,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  stock: {
    type: Number,
    required: true,
  },
  images: {
    type: [String],
    required: true,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
  updatedAt: {
    type: Date,
  },
});

productSchema.index({ name: "text", desc: "text", category: "text" });
// Middleware
productSchema.pre("save", function (next) {
  this.updatedAt = new Date(Date.now());
  next();
});

const ProductModel = mongoose.model("Products", productSchema);
ProductModel.syncIndexes();
export default ProductModel;
