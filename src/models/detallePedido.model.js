import db from '../config/db.js';
const DetallePedido = {
    crear: (id_pedido, id_producto, cantidad, precio_unitario, id_usuario) => {
        return new Promise((resolve, reject) => {
            const query = `
                INSERT INTO detalle_pedido 
                (id_pedido, id_producto, cantidad, precio_unitario, u_creacion) 
                VALUES (?, ?, ?, ?, ?)
            `;
            db.query(query, [id_pedido, id_producto, cantidad, precio_unitario, id_usuario], (err, res) => {
                if (err) reject(err);
                else resolve(res);
            });
        });
    }
};
export default DetallePedido;