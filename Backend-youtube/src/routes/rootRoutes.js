// rootRoutes sẽ tổng hợp tất cả routes của ứng dụng
// VD: /users, /products, /orders, ...
// define rootRoutes
import express from "express";
// import userRoutes, lưu ý: khi import phải có đuôi .js
import userRoutes from "./userRoutes.js";
import videoRoutes from "./videoRoutes.js";

const rootRoutes = express.Router();

// iport userRoutes vào rootRoutes
// hhtp://localhost:3000/users/.....
rootRoutes.use("/users", userRoutes);
rootRoutes.use("/videos", videoRoutes);

export default rootRoutes;
