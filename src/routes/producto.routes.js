import express from "express";
import { authJWT } from "../middlewares/auth.jwt.js";
import { isAdmin } from "../middlewares/isAdmin.js";
import {
  getProductos,
  crearProducto,
  actualizarProducto,
  eliminarProducto
} from "../controllers/producto.controller.js";

const router = express.Router();

router.get("/", authJWT, isAdmin, getProductos);
router.post("/", authJWT, isAdmin, crearProducto);
router.put("/:id", authJWT, isAdmin, actualizarProducto);
router.delete("/:id", authJWT, isAdmin, eliminarProducto);

export default router;
