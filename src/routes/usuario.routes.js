import express from "express";
import { getUsuarios, eliminarUsuario } from "../controllers/usuario.controller.js";
import { authJWT, isAdmin } from "../middlewares/auth.jwt.js";

const router = express.Router();

router.get("/", authJWT, isAdmin, getUsuarios);
router.delete("/:id", authJWT, isAdmin, eliminarUsuario);

export default router;
