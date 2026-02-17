import express from 'express';
const router = express.Router();
import { crearPedido } from '../controllers/pedido.controller.js';
import { finalizarPedido } from '../controllers/pedido.controller.js'
import { obtenerPedidos } from '../controllers/pedido.controller.js';
import { authJWT,isAdmin } from '../middlewares/auth.jwt.js';
import { actualizarEstadoPedido } from '../controllers/pedido.controller.js';
import { obtenerPedidosPorUsuario } from '../controllers/pedido.controller.js';

router.patch('/:id', authJWT, isAdmin, actualizarEstadoPedido);
router.post('/crear', authJWT, crearPedido);
router.post('/finalizar', authJWT, finalizarPedido);
router.get("/", authJWT, isAdmin, obtenerPedidos);
router.get('/usuario/:id', authJWT, obtenerPedidosPorUsuario);

console.log("pedido.routes cargado");

export default router; 