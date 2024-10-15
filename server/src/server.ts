import express, { Application } from "express";
import http from "http";
import addProductRouter from "./addBulkProduct";
import connectDB from "./config/connectDB";
import authRouter from "./features/auth/router/authRouter";
import orderRouter from "./features/order/router/orderRouter";
import productRouter from "./features/products/router/productRouter";
import profileRouter from "./features/profile/router/profileRouter";

// env config
require("dotenv").config();

// DB connection
connectDB();

const app: Application = express();
const PORT = 8000;
const HOST = "0.0.0.0";

// middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// router
app.use("/api/auth", authRouter);
app.use("/api/profile", profileRouter);
app.use("/api/product", productRouter);
app.use("/api/order", orderRouter);
app.use("/api/add", addProductRouter);
// server
new http.Server(app).listen(PORT, HOST, () =>
  console.log(`Starting server on http://${HOST}:${PORT}`)
);
