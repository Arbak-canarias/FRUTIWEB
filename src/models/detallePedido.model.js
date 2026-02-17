import { pool } from '../config/db.js';

const DetallePedido = {
    crear: async (id_pedido, id_producto, cantidad, precio_unitario, id_usuario, estado = 'pendiente') => {
        try {
            const query = `
                INSERT INTO detalle_pedido 
                (id_pedido, id_producto, cantidad, precio_unitario, u_creacion, estado)
                VALUES (?, ?, ?, ?, ?, ?)
            `;

            const [result] = await pool.execute(query, [
                id_pedido,
                id_producto,
                cantidad,
                Number(precio_unitario),
                id_usuario,
                estado
            ]);

            return result;

        } catch (error) {
            console.error("Error en DetallePedido.crear:", error);
            throw error;
        }
    }
};

export default DetallePedido;
