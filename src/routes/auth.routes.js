import express from "express";
import { login,register,logout,me } from "../controllers/auth.controller.js";
import { authJWT } from "../middlewares/auth.jwt.js";


const router = express.Router();
router.post("/login", login);
router.post("/register", register);
router.post("/logout", logout);
router.get("/me",authJWT, me);

export default router;
