import bcrypt from "bcrypt"; 
import { UsuarioModel } from "../models/usuario.model.js";

export const getUsuarios = async (req, res) => {
  const usuarios = await UsuarioModel.findAll();
  res.json(usuarios);
};

export const crearUsuario = async (req, res) => {
  const { nombre, email, password, rol, acepta_marketing, consentimiento_datos } = req.body;

  if (!consentimiento_datos) {
    return res.status(400).json({ error: "Debe aceptar la política de privacidad" });
  }

  const passwordHash = await bcrypt.hash(password, 10);

  await UsuarioModel.create({
    nombre,
    email,
    passwordHash,
    rol,
    consentimiento_datos,
    fecha_consentimiento: new Date(),
    acepta_marketing: acepta_marketing ? 1 : 0,
    creador: req.user.id
  });

  res.json({ message: "Usuario creado" });
};

export const actualizarUsuario = async (req, res) => {
  const { id } = req.params;
  const { nombre, email, rol, estado } = req.body;

  await UsuarioModel.update(id, {
    nombre,
    email,
    rol,
    estado,
    modificador: req.user.id
  });

  res.json({ message: "Usuario actualizado" });
};

export const eliminarUsuario = async (req, res) => {
  const { id } = req.params;

  await UsuarioModel.softDelete(id, req.user.id);
  res.json({ message: "Usuario desactivado" });
};
