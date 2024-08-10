import mongoose from "mongoose";
import MONGO_URI from "./config";

const connectDB = () => {
  mongoose
    .connect(MONGO_URI)
    .then(() => console.log("MongoDB Connected"))
    .catch((e) => console.error(e));
};
export default connectDB;
