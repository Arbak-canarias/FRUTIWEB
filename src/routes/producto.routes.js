import express from "express";
import { getProductos, crearProducto } from "../controllers/producto.controller.js";
import { isAuth, isAdmin } from "../middlewares/auth.middleware.js";

const router = express.Router();

router.get("/", isAuth, isAdmin, getProductos);
router.post("/", isAuth, isAdmin, crearProducto);

export default router;
