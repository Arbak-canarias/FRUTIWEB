import pool from '../config/db.js';

const Pedido = {
   crear: async(id_usuario, total) => {
            // Ajustado a tus columnas: id_usuario, total, estado, u_creacion
            // f_creacion suele ser CURRENT_TIMESTAMP en la DB, si no, lo añadimos
            const query = `
                INSERT INTO pedido 
                (id_usuario, total, estado, u_creacion, fecha) 
                VALUES (?, ?, 'pendiente', ?, NOW())
            `;
            const [result] = await pool.execute(query, [id_usuario, total, id_usuario]);
        return result;
        
    }
};

export default Pedido;