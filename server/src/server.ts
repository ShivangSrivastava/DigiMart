import express, { Application } from "express";
import http from "http";
import connectDB from "./config/db";
import authRouter from "./features/auth/router/auth";
import userOrderRouter from "./features/order/router/userOrder";
import vendorOrderRouter from "./features/order/router/vendorOrder";
import productRouter from "./features/products/router/product";
import vendorProductRouter from "./features/products/router/vendorProduct";
import profileRouter from "./features/profile/router/profile";

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
app.use("/api/product/vendor", vendorProductRouter);
app.use("/api/order/user", userOrderRouter);
app.use("/api/order/vendor", vendorOrderRouter);

// server
new http.Server(app).listen(PORT, HOST, () =>
  console.log(`Starting server on http://${HOST}:${PORT}`)
);
