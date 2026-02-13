import Pedido from '../models/pedido.model.js';
import DetallePedido from '../models/detallePedido.model.js';

export const crearPedido = async (req, res) => {
   
    const { carrito, total } = req.body;
    const id_usuario = req.user.id; 
    try {
        const resultadoPedido = await Pedido.crear({ id_usuario, total });
        const id_pedido = resultadoPedido.insertId;

        const promesas = carrito.map(item => 
             DetallePedido.crear(
                id_pedido,
                item.id_producto,
                item.cantidad,
                item.precio,
                id_usuario,

            )
        );

        await Promise.all(promesas);

        res.status(201).json({ message: "Pedido guardado con éxito", id_pedido });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Error al procesar el pedido en el servidor" });
    }
};

export const finalizarPedido = async (req, res) => {
    const { carrito, total } = req.body;
    const id_usuario = req.user.id; 

    try {
        // 1. Crear el registro en la tabla 'pedido'
        const resultPedido = await Pedido.crear(id_usuario, total);
        const id_pedido = resultPedido.insertId;

        // 2. Crear los registros en 'detalle_pedido'
        // Usamos Promise.all para que todas las inserciones se hagan en paralelo
        const promesasDetalles = carrito.map(item => {
            return DetallePedido.crear(
                id_pedido, 
                item.id_producto, 
                item.cantidad, 
                item.precio,
                id_usuario // u_creacion
            );
        });

        await Promise.all(promesasDetalles);

        res.status(201).json({ 
            success: true,
            mensaje: "Pedido realizado con éxito", 
            id_pedido: id_pedido 
        });

    } catch (error) {
        console.error("Error al finalizar pedido:", error);
        res.status(500).json({ error: "No se pudo procesar la compra en la base de datos" });
    }
};