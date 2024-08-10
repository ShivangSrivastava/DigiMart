import express, { Application } from "express";
import http from "http";
import connectDB from "./config/db";
import authRouter from "./router/auth/auth";
import profileRouter from "./router/auth/profile";
import userOrderRouter from "./router/user/order";
import userProductRouter from "./router/user/product";
import vendorOrderRouter from "./router/vendor/order";
import vendorProductRouter from "./router/vendor/product";

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
app.use("/api/user/order", userOrderRouter);
app.use("/api/user/product", userProductRouter);
app.use("/api/vendor/order", vendorOrderRouter);
app.use("/api/vendor/product", vendorProductRouter);

// server
new http.Server(app).listen(PORT, HOST, () =>
  console.log(`Starting server on http://${HOST}:${PORT}`)
);
