import { pool } from "../config/db.js";

export const getProductos = async (req, res) => {
  const [rows] = await pool.query("SELECT * FROM producto");
  res.json(rows);
};

export const crearProducto = async (req, res) => {
  const { nombre, categoria, precio, stock, descripcion, imagen_url } = req.body;

  await pool.query(
    `INSERT INTO producto (nombre, categoria, precio, stock, descripcion, imagen_url, u_creacion)
     VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [nombre, categoria, precio, stock, descripcion, imagen_url, req.session.user.id]
  );

  res.json({ message: "Producto creado" });
};
