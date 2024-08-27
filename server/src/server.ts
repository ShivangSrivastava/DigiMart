import express, { Application } from "express";
import http from "http";
import addProductRouter from "./addBulkProduct";
import connectDB from "./config/db";
import authRouter from "./features/auth/router/auth";
import userOrderRouter from "./features/order/router/userOrder";
import productRouter from "./features/products/router/product";
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
app.use("/api/order", userOrderRouter);
app.use("/api/add", addProductRouter);
// server
new http.Server(app).listen(PORT, HOST, () =>
  console.log(`Starting server on http://${HOST}:${PORT}`)
);
