// define tất cả API dảnh riêng cho table users
// define userRoutes
import express from "express";
import { getUSers, createUser } from "../controllers/userController.js";

// tạo userRoutes
const userRoutes = express.Router();

// define API
userRoutes.get("/get-users", getUSers);

// API create user
userRoutes.post("/create-user", createUser);

export default userRoutes;
