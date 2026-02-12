import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { UsuarioModel } from "../models/usuario.model.js";

const SECRET_KEY = "frutweb_secret_key_123";

export const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await UsuarioModel.findByEmail(email);
    if (!user) return res.status(401).json({ error: "Usuario no encontrado" });

    const ok = await bcrypt.compare(password, user.password);
    if (!ok) return res.status(401).json({ error: "Credenciales incorrectas" });

    const token = jwt.sign(
      { id: user.id_usuario, rol: user.rol, nombre: user.nombre },
      SECRET_KEY,
      { expiresIn: "4h" }
    );

    await UsuarioModel.updateLastLogin(user.id_usuario);

    return res.json({
      message: "Login correcto",
      token,
      user: {
        id: user.id_usuario,
        nombre: user.nombre,
        rol: user.rol,
        email: user.email
      }
    });

  } catch (error) {
    console.error("Error en login:", error);
    res.status(500).json({ message: "Error interno del servidor" });
  }
};

export const logout = (req, res) => {
  // Con JWT no hay sesión que destruir en el backend
  res.json({ message: "Logout correcto (el cliente debe borrar el token)" });
};

export const me = (req, res) => {
  res.json(req.user); // viene del middleware JWT
};

export const register = async (req, res) => {
  try {
    const { nombre, email, password } = req.body;

    const salt = await bcrypt.genSalt(10);
    const passwordHash = await bcrypt.hash(password, salt);

    await UsuarioModel.create({
      nombre,
      email,
      passwordHash,
      rol: "cliente",
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
