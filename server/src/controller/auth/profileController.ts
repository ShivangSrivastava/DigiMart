import express from "express";
import UserModel from "../../model/auth/userModel";

export const getProfileController = (
  req: express.Request,
  res: express.Response
) => {
  const id = (req as any).user?.id;
  UserModel.findById(id).then((user: any) => {
    if (user) {
      const userObj = user.toObject();
      delete userObj.password;
      res.status(200).json(userObj);
    } else {
      res.status(404).json({ message: "User not found" });
    }
  });
};
export const putProfileController = (
  req: express.Request,
  res: express.Response
) => {
  const id = (req as any).user?.id;
  const { name, password } = req.body;
  UserModel.findByIdAndUpdate(id, { name, password }, { new: true }).then(
    (user: any) => {
      if (user) {
        const userObj = user.toObject();
        delete userObj.password;
        res.status(200).json(userObj);
      } else {
        res.status(404).json({ message: "User not found" });
      }
    }
  );
};
export const deleteProfileController = (
  req: express.Request,
  res: express.Response
) => {
  const id = (req as any).user?.id;
  const { password } = req.body;
  UserModel.findByIdAndDelete(id, { password }).then((user: any) => {
    res.status(200).json({ message: "Deleted Successfully" });
  });
};
