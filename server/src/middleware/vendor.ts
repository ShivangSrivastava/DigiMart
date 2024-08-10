import e from "express";

const authenticateVendor = (
  req: e.Request,
  res: e.Response,
  next: e.NextFunction
) => {
  const role = (req as any).user?.role;

  if (role !== "vendor") {
    return res.status(401).json({ message: "Unauthorized" });
  }
  next();
};

export default authenticateVendor;
