import express from "express";
import session from "express-session";
import cors from "cors";

import authRoutes from "./routes/auth.routes.js";
import productoRoutes from "./routes/producto.routes.js";
import usuarioRoutes from "./routes/usuario.routes.js";


const app = express();

app.use(cors({
  origin: function (origin, callback) {
    // Permitir si el origen es de Live Server (127.0.0.1 o localhost)
    const allowedOrigins = ["http://127.0.0.1:5500", "http://localhost:5500"];
    if (!origin || allowedOrigins.indexOf(origin) !== -1) {
      callback(null, true);
    } else {
      callback(new Error("No permitido por CORS"));
    }
  },
  credentials: true,
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"]
}));

app.use(express.json());
app.use(express.static("public"));

app.use(session({
  name: "frutweb.sid",
  secret: "frutweb_secret_key",
  resave: false,
  saveUninitialized: false,
  cookie: {
    httpOnly: true,
    maxAge: 1000 * 60 * 60 * 2
  }
}));

app.use("/api/auth", authRoutes);
app.use("/api/productos", productoRoutes);
app.use("/api/usuarios", usuarioRoutes);


export default app;  
