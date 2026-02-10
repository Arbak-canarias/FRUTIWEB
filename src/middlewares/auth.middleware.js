export const isAuth = (req, res, next) => {
  if (!req.session.user) {
    return res.status(401).json({ error: "No autenticado" });
  }
  next();
};

export const isAdmin = (req, res, next) => {
  if (!req.session.user || req.session.user.rol !== "admin") {
    return res.status(403).json({ error: "No autorizado" });
  }
  next();
};
