import pool from '../config/db.js';

const Pedido = {
   crear: async(id_usuario, total,telefono,direccion) => {
            // Ajustado a tus columnas: id_usuario, total, estado, u_creacion
            // f_creacion suele ser CURRENT_TIMESTAMP en la DB, si no, lo añadimos
             if (!telefono || !direccion) {
            throw new Error("Faltan datos de envío");
            }

            if (!/^[0-9]{9}$/.test(telefono)) {
                throw new Error("Teléfono no válido");
            }

            const query = `
                INSERT INTO pedido 
                (id_usuario, total, estado, telefono, direccion, u_creacion, fecha) 
                VALUES (?, ?, 'pendiente', ?, NOW())
            `;
            const [result] = await pool.execute(query, [id_usuario, total, telefono, direccion, id_usuario]);
        return result;
        
    }
};

export default Pedido;