import jwt from "jsonwebtoken";

const SECRET_KEY = "frutweb_secret_key_123";

export const authJWT = (req, res, next) => {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    return res.status(401).json({ error: "Token no enviado" });
  }

  const token = authHeader.split(" ")[1]; // Bearer TOKEN

  try {
    const decoded = jwt.verify(token, SECRET_KEY);
    req.user = decoded; // 👈 aquí vive el usuario
    next();
  } catch (error) {
    return res.status(401).json({ error: "Token inválido o expirado" });
  }
};
export const isAdmin = (req, res, next) => {
  if (!req.user) {
    return res.status(401).json({ error: "No autenticado" });
  }

  if (req.user.rol !== "admin") {
    return res.status(403).json({ error: "Acceso denegado: solo admin" });
  }

  next();
};
