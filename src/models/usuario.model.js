import { pool } from "../config/db.js";

export const UsuarioModel = {
  // Obtiene todos los usuarios para el Dashboard
  findAll: async () => {
    try {
      const [rows] = await pool.query(
        "SELECT id_usuario, nombre, email, rol, estado, ultimo_login, f_creacion, acepta_marketing FROM usuario"
      );
      return rows;
    } catch (error) {
      throw error;
    }
  },

  // Busca un usuario por email (usado en el Login)
  findByEmail: async (email) => {
    try {
      const [rows] = await pool.query(
        "SELECT * FROM usuario WHERE email = ?",
        [email]
      );
      return rows[0];
    } catch (error) {
      throw error;
    }
  },

  // Actualiza la fecha de acceso
  updateLastLogin: async (id) => {
    try {
      await pool.query(
        "UPDATE usuario SET ultimo_login = NOW() WHERE id_usuario = ?",
        [id]
      );
    } catch (error) {
      throw error;
    }
  },

  // Busca por ID (usado por el middleware de JWT)
  findById: async (id) => {
    try {
      const [rows] = await pool.query(
        "SELECT id_usuario, nombre, email, rol, estado FROM usuario WHERE id_usuario = ?",
        [id]
      );
      return rows[0];
    } catch (error) {
      throw error;
    }
  },

  // Crea un nuevo usuario (Registro)
  create: async (data) => {
    const {
      nombre, email, passwordHash, rol,
      consentimiento_datos, fecha_consentimiento, acepta_marketing, creador
    } = data;

    try {
      await pool.query(`
        INSERT INTO usuario
        (nombre, email, password, rol, consentimiento_datos, fecha_consentimiento, acepta_marketing, u_creacion, f_creacion)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())
      `, [
        nombre, email, passwordHash, rol || 'cliente', 
        consentimiento_datos || 1, fecha_consentimiento || new Date(), 
        acepta_marketing || 0, creador || null
      ]);
    } catch (error) {
      throw error;
    }
  },

  // Actualiza datos desde el Dashboard
  update: async (id, data) => {
    const { nombre, email, rol, estado, modificador } = data;
    try {
      await pool.query(`
        UPDATE usuario
        SET nombre = ?, email = ?, rol = ?, estado = ?, u_modificacion = ?, f_modificacion = NOW()
        WHERE id_usuario = ?
      `, [nombre, email, rol, estado, modificador, id]);
    } catch (error) {
      throw error;
    }
  },

  // Desactiva un usuario (Borrado lógico)
  softDelete: async (id, modificador) => {
    try {
      await pool.query(`
        UPDATE usuario 
        SET estado = 0, u_modificacion = ?, f_modificacion = NOW()
        WHERE id_usuario = ?
      `, [modificador, id]);
    } catch (error) {
      throw error;
    }
  }
};