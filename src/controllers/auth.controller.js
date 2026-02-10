import bcrypt from "bcrypt";
import { UsuarioModel } from "../models/usuario.model.js";

export const login = async (req, res) => {
  try{
  const { email, password } = req.body;
  const user = await UsuarioModel.findByEmail(email);
  if (!user) return res.status(401).json({ error: "Usuario no encontrado" });

  const ok = await bcrypt.compare(password, user.password);
  if (!ok) return res.status(401).json({ error: "Credenciales incorrectas" });

  req.session.user = {
    id: user.id_usuario,
    rol: user.rol,
    nombre: user.nombre
  };

  await UsuarioModel.updateLastLogin(user.id_usuario);

  res.json({ message: "Login correcto", rol: user.rol,
    user: { nombre: user.nombre, rol: user.rol }});
  } catch (error) {
    console.error("Error en login:", error);
    res.status(500).json({ message: "Error interno del servidor" });
  }  

};

export const logout = (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      return res.status(500).json({ message: "No se pudo cerrar la sesión" });
    }
    res.clearCookie('connect.sid'); 
    res.json({ message: "Sesión cerrada correctamente en el servidor" });
  });
};
export const me = (req, res) => {
  if (!req.session.user) return res.status(401).json({ auth: false });
  res.json(req.session.user);
};
export const register = async (req, res) => {
  try {
    const { nombre, email, password } = req.body;

    // 1. Cifrar la contraseña (Trazabilidad: Seguridad)
    const salt = await bcrypt.genSalt(10);
    const passwordHash = await bcrypt.hash(password, salt);

    // 2. Guardar en la base de datos
    // Ajustamos los datos para que coincidan con tu UsuarioModel.create
    await UsuarioModel.create({
      nombre,
      email,
      passwordHash,
      rol: 'cliente', // Por defecto se registran como clientes
      consentimiento_datos: 1,
      fecha_consentimiento: new Date(),
      acepta_marketing: 0,
      creador: null
    });

    res.status(201).json({ message: "Usuario registrado con éxito" });
  } catch (error) {
    console.error("Error en registro:", error);
    res.status(500).json({ message: "Error al registrar el usuario" });
  }
};
