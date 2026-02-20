import express from "express";
import cors from "cors";
import path from "path";
import { fileURLToPath } from "url";

import authRoutes from "./routes/auth.routes.js";
import productoRoutes from "./routes/producto.routes.js";
import usuarioRoutes from "./routes/usuario.routes.js";
import pedidoRoutes from "./routes/pedido.routes.js";

const app = express();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.use(cors({
  origin: ["http://localhost:5500","http://127.0.0.1:5500"],
  credentials: false,
}));

app.use(express.json());

// APIs
app.use("/api/auth", authRoutes);
app.use("/api/productos", productoRoutes);
app.use("/api/usuarios", usuarioRoutes);
app.use("/api/pedidos", pedidoRoutes);

// SERVIR FRONTEND
app.use(express.static(path.join(__dirname, "..")));

// Ruta raíz
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "..", "index.html"));
});

export default app;