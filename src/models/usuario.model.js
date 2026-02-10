import { pool } from "../config/db.js";

export const UsuarioModel = {
  findAll: async () => {
    const [rows] = await pool.query(
      "SELECT id_usuario, nombre, email, rol, estado, ultimo_login, f_creacion FROM usuario"
    );
    return rows;
  },
  findByEmail: async (email) => {
    const [rows] = await pool.query(
      "SELECT * FROM usuario WHERE email = ?",
      [email]
    );
    return rows[0]; // Retorna el usuario o undefined si no existe
  },

  updateLastLogin: async (id) => {
    await pool.query(
      "UPDATE usuario SET ultimo_login = NOW() WHERE id_usuario = ?",
      [id]
    );
  },

  findById: async (id) => {
    const [rows] = await pool.query(
      "SELECT id_usuario, nombre, email, rol, estado FROM usuario WHERE id_usuario = ?",
      [id]
    );
    return rows[0];
  },

  create: async (data) => {
    const {
      nombre, email, passwordHash, rol,
      consentimiento_datos, fecha_consentimiento, acepta_marketing, creador
    } = data;

    await pool.query(`
      INSERT INTO usuario
      (nombre, email, password, rol, consentimiento_datos, fecha_consentimiento, acepta_marketing, u_creacion)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `, [
      nombre, email, passwordHash, rol,
      consentimiento_datos, fecha_consentimiento, acepta_marketing, creador
    ]);
  },

  update: async (id, data) => {
    const { nombre, email, rol, estado, modificador } = data;

    await pool.query(`
      UPDATE usuario
      SET nombre = ?, email = ?, rol = ?, estado = ?, u_modificacion = ?, f_modificacion = NOW()
      WHERE id_usuario = ?
    `, [nombre, email, rol, estado, modificador, id]);
  },

  softDelete: async (id, modificador) => {
    await pool.query(`
      UPDATE usuario 
      SET estado = 0, u_modificacion = ?, f_modificacion = NOW()
      WHERE id_usuario = ?
    `, [modificador, id]);
  }
};
