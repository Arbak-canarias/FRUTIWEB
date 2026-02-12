import express from "express";

import cors from "cors";


import authRoutes from "./routes/auth.routes.js";
import productoRoutes from "./routes/producto.routes.js";
import usuarioRoutes from "./routes/usuario.routes.js";


const app = express();

app.use(cors({
  origin: ["http://localhost:5500","http://127.0.0.1:5500"],
  credentials: false,
 // methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  //allowedHeaders: ["Content-Type", "Authorization"]
}));

app.use(express.json());
app.use(express.static("public"));

app.use("/api/auth", authRoutes);
app.use("/api/productos", productoRoutes);
app.use("/api/usuarios", usuarioRoutes);


export default app;  
