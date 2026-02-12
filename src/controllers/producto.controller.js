import { pool } from "../config/db.js";

export const getProductos = async (req, res) => {
  const [rows] = await pool.query("SELECT * FROM producto");
  res.json(rows);
};

export const crearProducto = async (req, res) => {
    try {
        const { nombre, categoria, precio, stock, descripcion, imagen_url } = req.body;
        
        // El ID debe venir del middleware authJWT que ya validó el token
        const userId = req.user?.id || req.userId; 

        if (!userId) {
            return res.status(401).json({ message: "No autorizado: ID de usuario no encontrado." });
        }

        await pool.query(
            `INSERT INTO producto (nombre, categoria, precio, stock, descripcion, imagen_url, u_creacion, f_creacion)
             VALUES (?, ?, ?, ?, ?, ?, ?, NOW())`,
            [nombre, categoria, precio, stock, descripcion, imagen_url, userId]
        );

        return res.status(200).json({ message: "Producto creado con éxito" });
    } catch (error) {
        console.error("Error detallado en consola del servidor:", error);
        // Enviamos el error detallado para que el frontend sepa qué pasó exactamente
        return res.status(500).json({ message: "Error en base de datos", error: error.message });
    }
};
export const actualizarProducto = async (req, res) => {
    try {
        const { id } = req.params;
        const { nombre, categoria, precio, stock, descripcion, imagen_url } = req.body;
        const userId = req.user.id; // Usuario que modifica

        const [result] = await pool.query(
            `UPDATE producto 
             SET nombre = ?, categoria = ?, precio = ?, stock = ?, descripcion = ?, imagen_url = ?, u_modificacion = ?, f_modificacion = NOW()
             WHERE id_producto = ?`,
            [nombre, categoria, precio, stock, descripcion, imagen_url, userId, id]
        );

        if (result.affectedRows === 0) return res.status(404).json({ message: "Producto no encontrado" });
        
        res.json({ message: "Producto actualizado con éxito" });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al actualizar el producto" });
    }
};


export const eliminarProducto = async (req, res) => {
    try {
        const { id } = req.params;
        const [result] = await pool.query("DELETE FROM producto WHERE id_producto = ?", [id]);

        if (result.affectedRows === 0) return res.status(404).json({ message: "Producto no encontrado" });

        res.json({ message: "Producto eliminado" });
    } catch (error) {
        res.status(500).json({ message: "Error al eliminar el producto" });
    }
};