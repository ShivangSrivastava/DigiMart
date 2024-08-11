import bcrypt from "bcrypt";
import express from "express";
import jwt from "jsonwebtoken";
import UserModel from "../../../core/common/userModel";

// loginController
export const loginController = async (
  req: express.Request,
  res: express.Response
) => {
  const { email, password } = req.body;
  await UserModel.findOne({ email }).then((user) => {
    if (!user) {
      return res.status(400).json({ message: "User not found" });
    }
    bcrypt.compare(password, user.password, (err, data) => {
      if (err) {
        return res.status(400).json({ message: "User not found" });
      }
      if (data) {
        const secret = process.env.JWT_SECRET_KEY;

        if (!secret) {
          throw new Error("JWT_SECRET is not defined");
        }
        const token = jwt.sign(
          {
            id: user.id,
            role: user.role,
          },
          secret
        );
        return res.status(200).json({ token });
      } else {
        return res.status(400).json({ message: "Invalid credentials" });
      }
    });
  });
};

// registerController
export const registerController = async (
  req: express.Request,
  res: express.Response
) => {
  const { email, password, name, role } = req.body;
  if (!email || !password || !name || !role) {
    res.status(400).json({ message: "Please fill all the fields" });
  }

  try {
    const newUser = new UserModel({
      email: email,
      password: password,
      name: name,
      role: role,
    });
    await newUser.save();
    res.status(200).json({ message: "Registration successful" });
  } catch (err) {
    res.status(400).json({ message: "User already exists" });
  }
};
