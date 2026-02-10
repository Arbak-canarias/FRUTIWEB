import express from "express";
import {
  getUsuarios,
  crearUsuario,
  actualizarUsuario,
  eliminarUsuario
} from "../controllers/usuario.controller.js";
import { isAuth, isAdmin } from "../middlewares/auth.middleware.js";

const router = express.Router();

router.get("/", isAuth, isAdmin, getUsuarios);
router.post("/", isAuth, isAdmin, crearUsuario);
router.put("/:id", isAuth, isAdmin, actualizarUsuario);
router.delete("/:id", isAuth, isAdmin, eliminarUsuario);

export default router;
