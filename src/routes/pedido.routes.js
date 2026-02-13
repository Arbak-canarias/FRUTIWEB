import express from 'express';
const router = express.Router();
import { crearPedido } from '../controllers/pedido.controller.js';
import { finalizarPedido } from '../controllers/pedido.controller.js'
import { authJWT } from '../middlewares/auth.jwt.js';

router.post('/crear', authJWT, crearPedido);
router.post('/finalizar', authJWT, finalizarPedido);

export default router; 