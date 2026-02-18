import Pedido from '../models/pedido.model.js';
import DetallePedido from '../models/detallePedido.model.js';
import { pool } from '../config/db.js';

export const crearPedido = async (req, res) => {
    const { carrito, total,telefono,direccion } = req.body;
    const id_usuario = req.user.id; 
    
    try {
         if (!telefono || !direccion) {
            return res.status(400).json({ error: "Faltan datos de envío" });
        }

        if (!/^[0-9]{9}$/.test(telefono)) {
            return res.status(400).json({ error: "Teléfono no válido" });
        }
        const resultadoPedido = await Pedido.crear(id_usuario, total,telefono,direccion);
        const id_pedido = resultadoPedido.insertId;

        const promesas = carrito.map(item => 
            DetallePedido.crear(
                id_pedido,
                item.id_producto,
                item.cantidad,
                item.precio,
                id_usuario,
                'pendiente'
            )
        );

        await Promise.all(promesas);
        res.status(201).json({ message: "Pedido guardado con éxito", id_pedido });
    } catch (error) {
        console.error("Error en crearPedido:", error);
        res.status(500).json({ error: "Error al procesar el pedido" });
    }
};

export const finalizarPedido = async (req, res) => {
    const connection = await pool.getConnection();

    try {
        await connection.beginTransaction();

        const { carrito, total,telefono, direccion } = req.body;
        const id_usuario = req.user.id;
         if (!telefono || !direccion) {
            throw new Error("Faltan datos de envío");
        }

        if (!/^[0-9]{9}$/.test(telefono)) {
            throw new Error("Teléfono no válido");
        }
        
        if (!carrito || carrito.length === 0) {
            throw new Error("El carrito está vacío");
        }

        // 1. Crear pedido
        const [resultPedido] = await connection.execute(
            `INSERT INTO pedido (id_usuario, total, estado, telefono, direccion, u_creacion, fecha)
            VALUES (?, ?, 'pendiente', ?, ?, ?, NOW())`,
            [id_usuario, total, telefono, direccion, id_usuario]
        );

        const id_pedido = resultPedido.insertId;

        // 2. Procesar carrito
        for (const item of carrito) {

            // 🔎 Obtener producto real
            const [producto] = await connection.execute(
                `SELECT stock, precio FROM producto WHERE id_producto = ?`,
                [item.id_producto]
            );

            if (producto.length === 0) {
                throw new Error(`Producto no existe`);
            }

            if (producto[0].stock < item.cantidad) {
                const [producto] = await connection.execute(
                    `SELECT nombre, stock, precio FROM producto WHERE id_producto = ?`,
                    [item.id_producto]
                );

                if (producto.length === 0) {
                    throw new Error(`Producto con ID ${item.id_producto} no existe`);
                }

                const productoInfo = producto[0];

                if (productoInfo.stock < item.cantidad) {
                    throw new Error(`Stock insuficiente para "${productoInfo.nombre}". Stock disponible: ${productoInfo.stock}, cantidad solicitada: ${item.cantidad}`);
                }
                
            }

            const precioReal = producto[0].precio;

            // 3. Insertar detalle
            await connection.execute(
                `INSERT INTO detalle_pedido
                 (id_pedido, id_producto, cantidad, precio_unitario, u_creacion, estado)
                 VALUES (?, ?, ?, ?, ?, 'pendiente')`,
                [id_pedido, item.id_producto, item.cantidad, precioReal, id_usuario]
            );

            // 4. Restar stock
            await connection.execute(
                `UPDATE producto 
                 SET stock = stock - ?
                 WHERE id_producto = ?`,
                [item.cantidad, item.id_producto]
            );
        }

        await connection.commit();

        res.status(201).json({
            success: true,
            mensaje: "Pedido realizado correctamente",
            id_pedido
        });

    } catch (error) {
        await connection.rollback();

        console.error(error);

        res.status(500).json({
            success: false,
            error: error.message
        });

    } finally {
        connection.release();
    }
};
export const obtenerPedidos = async (req, res) => {
    try {
        const [rows] = await pool.execute(`
            SELECT 
                p.id_pedido,
                u.nombre AS cliente,
                p.estado,
                p.total,
                p.telefono,
                p.direccion,
                dp.cantidad,
                dp.precio_unitario,
                pr.nombre AS producto,
                p.fecha
            FROM pedido p
            JOIN usuario u ON p.id_usuario = u.id_usuario
            JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
            JOIN producto pr ON dp.id_producto = pr.id_producto
            ORDER BY p.id_pedido DESC
        `);

        res.json(rows);

    } catch (error) {
        console.error("Error al obtener pedidos:", error);
        res.status(500).json({ error: "Error al obtener pedidos" });
    }
};
export const actualizarEstadoPedido = async (req, res) => {
    const { id } = req.params;
    const { estado } = req.body;

    // Validar enum
    const estadosValidos = ['pendiente','preparando','enviando','entregado'];
    if (!estadosValidos.includes(estado)) {
        return res.status(400).json({ error: 'Estado inválido' });
    }

    try {
        // Actualizar tabla pedido
        const [result] = await pool.execute(
            `UPDATE pedido SET estado = ? WHERE id_pedido = ?`,
            [estado, id]
        );

        // Actualizar tabla detalle_pedido
        await pool.execute(
            `UPDATE detalle_pedido SET estado = ? WHERE id_pedido = ?`,
            [estado, id]
        );

        res.json({ success: true, mensaje: `Pedido ${id} actualizado a ${estado}` });

    } catch (error) {
        console.error("Error al actualizar estado del pedido:", error);
        res.status(500).json({ error: "No se pudo actualizar el estado del pedido" });
    }
};
export const obtenerPedidosPorUsuario = async (req, res) => {
    const id = req.user.id; // 🔒 seguro

    try {
        const [pedidos] = await pool.execute(
            `SELECT id_pedido, total, fecha, estado, telefono, direccion
             FROM pedido 
             WHERE id_usuario = ? 
             ORDER BY fecha DESC`,
            [id]
        );

        const pedidosConDetalle = await Promise.all(
            pedidos.map(async (pedido) => {
                const [detalles] = await pool.execute(
                    `SELECT dp.cantidad, dp.precio_unitario, p.nombre 
                     FROM detalle_pedido dp
                     JOIN producto p ON dp.id_producto = p.id_producto
                     WHERE dp.id_pedido = ?`,
                    [pedido.id_pedido]
                );

                return {
                    id: pedido.id_pedido,
                    total: pedido.total,
                    fecha: pedido.fecha,
                    estado: pedido.estado,
                    telefono:pedido.telefono,
                    direccion:pedido.direccion,
                    items: detalles
                };
            })
        );

        res.json(pedidosConDetalle);

    } catch (error) {
        console.error("Error al obtener pedidos por usuario:", error);
        res.status(500).json({ error: "Error al cargar el historial de pedidos" });
    }
};