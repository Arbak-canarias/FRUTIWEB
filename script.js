// --- FUNCIONES DE LOGIN (COMPARTIDAS) ---
function openModal(tipo) {
            const modal = document.getElementById("loginModal");
            const loginForm = document.getElementById("login-form");
            const registerForm = document.getElementById("register-form");

            modal.style.display = "flex"; // Usamos flex para centrar

            if (tipo === 'login') {
                loginForm.style.display = "block";
                registerForm.style.display = "none";
            } else {
                loginForm.style.display = "none";
                registerForm.style.display = "block";
            }
        }
function closeModal() {
            document.getElementById("loginModal").style.display = "none";
        }
function toggleForm() {
            const loginForm = document.getElementById("login-form");
            const registerForm = document.getElementById("register-form");
            if (loginForm.style.display === "none") {
                loginForm.style.display = "block";
                registerForm.style.display = "none";
            } else {
                loginForm.style.display = "none";
                registerForm.style.display = "block";
            }
        }
async function login(e) {
            e.preventDefault();
            const email = document.getElementById("login-email").value;
            const password = document.getElementById("login-password").value;
            const errorDiv = document.getElementById("login-error");

            errorDiv.style.display = "none";

            try {
                const res = await fetch("http://localhost:3000/api/auth/login", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ email, password })
                });

                const data = await res.json();
                
                if (res.ok) {
                    // 1. Guardar con seguridad
                    localStorage.setItem("token", data.token);
                    localStorage.setItem("user", JSON.stringify(data.user));
                        const welcomeModal = document.getElementById("welcomeModal");
                        const welcomeText = document.getElementById("welcome-message");
                        welcomeText.innerText = `¡BIENVENIDO, ${data.user.nombre}!`;
                        welcomeModal.style.display = "flex";
                    // 2. ¿Teníamos una compra pendiente?                   
                    setTimeout(() => {
                        const productoPendiente = sessionStorage.getItem("productoPendiente");
                        const destinoPendiente = sessionStorage.getItem("redireccionPostLogin");

                        if (productoPendiente && destinoPendiente) {
                            sessionStorage.removeItem("productoPendiente");
                            sessionStorage.removeItem("redireccionPostLogin");
                            window.location.href = destinoPendiente + `?autoAdd=${productoPendiente}`;
                        } else {
                            window.location.href = data.user.rol.toLowerCase() === "admin" 
                                ? "/pages/dashboardcontrol.html" 
                                : "/pages/dashboardcliente.html";
                        }
                    }, 2000);

                } else {
                    // Mostrar error en el HTML, no en alert
                    errorDiv.innerText = data.message || "Credenciales incorrectas";
                    errorDiv.style.display = "block";
                }
                    } catch (error) {
                        console.error("Error en el login:", error);
                        errorDiv.innerText = "Error de conexión con el servidor";
                        errorDiv.style.display = "block";;
                    }
                }

        // --- REGISTRO ---
async function register(e) {
            e.preventDefault();
            const nombre = document.getElementById("reg-nombre").value;
            const email = document.getElementById("reg-email").value;
            const password = document.getElementById("reg-password").value;
            const acepta_marketing = document.getElementById("reg-marketing").checked ? 1 : 0;

            const res = await fetch("http://localhost:3000/api/auth/register", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ nombre, email, password,acepta_marketing })
            });

            if (res.ok) {
                mostrarAvisoFrutweb("Registro completado. Ahora puedes iniciar sesión.");
  
                toggleForm();
            } else {
                const data = await res.json();
                alert("Error en el registro: " + data.message);
            }
        }
function revisarEstadoSesion() {
    const userStr = localStorage.getItem("user");
    const perfilBtn = document.getElementById("btn-mi-perfil");
    const logoutBtn = document.getElementById("btn-logout");
    const historialBtn = document.getElementById("btn-historial");
    const loginBtn = document.getElementById("btn-login");

    if (userStr) {
        const user = JSON.parse(userStr);
        if (perfilBtn) {
            perfilBtn.style.display = "inline-block";
            perfilBtn.textContent = `HOLA, ${user.nombre.toUpperCase()}`;
            perfilBtn.onclick = () => {
                window.location.href = user.rol === 'admin' 
                    ? '/pages/dashboardcontrol.html' 
                    : '/pages/dashboardcliente.html';
            };
        }
        if (logoutBtn) logoutBtn.style.display = "inline-block";
        if (historialBtn) historialBtn.style.display = "inline-block";
        if (loginBtn) loginBtn.style.display = "none"; // Ocultar login si hay sesión
    } else {
        if (perfilBtn) perfilBtn.style.display = "none";
        if (logoutBtn) logoutBtn.style.display = "none";
        if (historialBtn) historialBtn.style.display = "none";
        if (loginBtn) loginBtn.style.display = "inline-block"; // Mostrar login si no hay sesión
    }
}

document.addEventListener("DOMContentLoaded", revisarEstadoSesion);

function abrirModalLogout() {
    const modal = document.getElementById('logoutModal');
    if (modal) modal.style.display = "flex";
}

function cerrarModalLogout() {
    const modal = document.getElementById('logoutModal');
    if (modal) {
        modal.style.display = "none";
    }
}

async function ejecutarSalidaBackend() {
    try {
        cerrarModalLogout();
        const token = localStorage.getItem("token");
        
        // Llamada al servidor
        await fetch("http://localhost:3000/api/auth/logout", {
            method: "POST",
            headers: {"Authorization": `Bearer ${token}`}
        });

        // Limpiamos siempre el localstorage por seguridad
        localStorage.removeItem("user");
        localStorage.removeItem("token");

        // Mostramos el modal de despedida que tienes en el HTML
        const despedida = document.getElementById("despedidaModal");
        if (despedida) despedida.style.display = "flex";
            setTimeout(() => {
                // Redirigimos a la raíz (ajusta la ruta según si estás en shop/ o no)
                window.location.href = "/index.html"; 
            }, 2000);
       
        
        } catch (error) {
        console.error("Error al cerrar sesión:", error);
        localStorage.removeItem("user");
        window.location.href = "/index.html";
    }
}
// ================== NAVBAR ==================
function verificarEstadoNavegacion() {
  const token = localStorage.getItem("token");
  const loginBtn = document.querySelector(".nav-icons .btn-primary");

  if (!loginBtn) return;

  if (!token) {
    loginBtn.textContent = "INICIAR SESIÓN";
    loginBtn.onclick = () => window.location.href = "index.html";
  } else {
    loginBtn.textContent = "CERRAR SESIÓN";
    loginBtn.onclick = abrirModalLogout;
  }
}
function actualizarContadores() {
    // 1. Obtener datos de localStorage
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    const favoritos = JSON.parse(localStorage.getItem("favoritos")) || [];

    // 2. Calcular cantidades totales
    // Para el carrito sumamos las cantidades individuales de cada producto
    const totalCarrito = carrito.reduce((acc, p) => acc + (p.cantidad || 1), 0);
    const totalFavoritos = favoritos.length;

    // 3. Pintar en el HTML
    const spanCart = document.getElementById("count-cart");
    const spanFav = document.getElementById("count-fav");

    if (spanCart) spanCart.textContent = totalCarrito;
    if (spanFav) spanFav.textContent = totalFavoritos;
}

// Ejecutar al cargar la página por primera vez
document.addEventListener("DOMContentLoaded", actualizarContadores);
// --- ETIQUETAS FRUTAS VERDURAS Y COMBO  DE  (COMPARTIDAS) ---
const API_PRODUCTOS_PUBLIC = "http://localhost:3000/api/productos/public";

function getToken() {
  return localStorage.getItem("token");
}

async function cargarProductosPorCategoria(categoria, contenedorId, imagenDefault) {
  const contenedor = document.getElementById(contenedorId);
  const token = getToken();

  if (!contenedor)  return;
  

  try {
    const response = await fetch(API_PRODUCTOS_PUBLIC, {
      method: "GET",
      headers: {
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json"
      }
    });

    const data = await response.json();

    if (!response.ok) {
      contenedor.innerHTML = `<p style="text-align:center;">No tienes permisos para ver productos.</p>`;
      return;
    }
          localStorage.setItem("productos", JSON.stringify(data));

    const productos = data.filter(p => p.categoria?.toLowerCase() === categoria);

    contenedor.innerHTML = "";

    if (productos.length === 0) {
      contenedor.innerHTML = `<p>No hay ${categoria}s disponibles.</p>`;
      return;
    }

    productos.forEach(producto => {
      const card = document.createElement("div");
      card.className = "product-card";

      card.innerHTML = `
        <img src="${producto.imagen_url || imagenDefault}" alt="${producto.nombre}">
        <h3>${producto.nombre.toUpperCase()}</h3>
        <p>${producto.descripcion || 'Producto fresco local'}</p>
        <div class="precio-tag">${producto.precio} €</div>
        <div class="card-buttons">
          <button class="btn-large heart" onclick="agregarFavorito(${producto.id_producto})">
            <i class="fa-regular fa-heart"></i> Me gusta
          </button>
          <button class="btn-large cart" onclick="agregarAlCarrito(${producto.id_producto})">
            <i class="fa-solid fa-cart-shopping"></i> Comprar
          </button>
        </div>
      `;

      contenedor.appendChild(card);
    });

  } catch (error) {
    console.error("Error cargando productos:", error);
    contenedor.innerHTML = `<p style="text-align:center;color:red;">Error al cargar productos.</p>`;
  }
}
// Fin etiquetas fruteria
 // Gestion Favoritos y Carrito
function cargarFavoritos() {
    const contenedor = document.getElementById("contenedor-favoritos");
    if (!contenedor) return;

    const favoritos = JSON.parse(localStorage.getItem("favoritos")) || [];
    contenedor.innerHTML = ""; // Limpiamos el contenedor

    if (favoritos.length === 0) {
        contenedor.innerHTML = `
            <div style="grid-column: 1/-1; text-align: center; padding: 50px;">
                <i class="fa-regular fa-heart" style="font-size: 3rem; color: #ccc;"></i>
                <p style="margin-top: 15px; font-size: 1.2rem; color: #666;">Aún no has guardado ningún favorito.</p>
                <a href="frutas.html" class="btn-primary" style="display: inline-block; margin-top: 20px; text-decoration: none;">Ver productos</a>
            </div>`;
        return;
    }
    favoritos.forEach(p => {
        const card = document.createElement("div");
        card.className = "product-card";
        card.innerHTML = `
            <img src="${p.imagen_url || '../Imagenes/fresa.jpg'}" alt="${p.nombre}">
            <h3>${p.nombre}</h3>
            <p>${p.descripcion || 'Producto de calidad'}</p>
            <div class="precio-tag" style="font-weight: bold; color: #2e7d32; margin-bottom: 10px;">
                ${p.precio} €
            </div>
            <div class="card-buttons">
                <button class="btn-large cart" onclick="agregarAlCarrito(${p.id_producto})" title="Comprar">
                    <i class="fa-solid fa-cart-shopping"></i> Comprar
                </button>
                <button class="btn-large heart" onclick="eliminarFavorito(${p.id_producto})" style="background-color: #ffeded; color: #e74c3c; border-color: #ffcdd2;">
                    <i class="fa-solid fa-trash"></i> Quitar
                </button>
            </div>
        `;
        contenedor.appendChild(card);
    });
}
function eliminarFavorito(id) {
    let favoritos = JSON.parse(localStorage.getItem("favoritos")) || [];
    favoritos = favoritos.filter(p => p.id_producto !== id);
    localStorage.setItem("favoritos", JSON.stringify(favoritos));
    cargarFavoritos();
    if (typeof actualizarContadores === "function") actualizarContadores();
    mostrarAvisoFrutweb("Producto eliminado de favoritos ❌");
}
function cargarCarrito() {
    const contenedor = document.getElementById("contenedor-carrito");
    const totalElemento = document.getElementById("total");
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    if (!contenedor) return;

    contenedor.innerHTML = "";
    let totalAcumulado = 0;

    if (carrito.length === 0) {
        contenedor.innerHTML = `<p style='grid-column:1/-1;text-align:center; padding: 50px;'>Tu carrito está vacío.</p>`;
        if (totalElemento) totalElemento.textContent = "0,00 €";
        return;
    }

    carrito.forEach(p => {
        const subtotal = p.precio * p.cantidad;
        totalAcumulado += subtotal;

        const item = document.createElement("div");
        item.className = "carrito-item"; // Nueva clase para diseño de lista
        item.innerHTML = `
            <div class="carrito-info">
                <img src="${p.imagen_url || '../Imagenes/fresa.jpg'}" alt="${p.nombre}">
                <div class="carrito-detalles">
                    <h3>${p.nombre.toUpperCase()}</h3>
                    <div class="carrito-acciones-secundarias">
                        <span onclick="eliminarDelCarrito(${p.id_producto})" class="link-accion">Eliminar</span>
                        <span onclick="agregarFavorito(${p.id_producto})" class="link-accion">Guardar para más tarde</span>
                    </div>
                </div>
            </div>
            
            <div class="carrito-controles">
                <div class="selector-cantidad">
                    <button onclick="cambiarCantidad(${p.id_producto}, 'menos')">-</button>
                    <input type="number" value="${p.cantidad}" readonly>
                    <button onclick="cambiarCantidad(${p.id_producto}, 'mas')">+</button>
                </div>
                <div class="carrito-precio-subtotal">
                    ${subtotal.toFixed(2)} €
                </div>
            </div>
        `;
        contenedor.appendChild(item);
    });

    if (totalElemento) totalElemento.textContent = totalAcumulado.toFixed(2) + " €";
}

function eliminarDelCarrito(id) {
    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    carrito = carrito.filter(p => p.id_producto !== id);
    localStorage.setItem("carrito", JSON.stringify(carrito));
    cargarCarrito();
    mostrarAvisoFrutweb("Producto quitado del carrito");
}
const API_URL = "http://localhost:3000/api/productos";

/*   CARGA DE PRODUCTOS GENÉRICA */
async function cargarProductos(categoria, contenedorId) {
    const contenedor = document.getElementById(contenedorId);
    const token = localStorage.getItem("token");
    if (!contenedor) return;
    try {
        const res = await fetch(API_URL, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        const data = await res.json();
        if (!res.ok) {
            contenedor.innerHTML = "<p style='grid-column:1/-1;text-align:center;'>Debes iniciar sesión.</p>";
            return;
        }
        localStorage.setItem("productos", JSON.stringify(data));
        const filtrados = data.filter(p => p.categoria?.toLowerCase() === categoria);
        contenedor.innerHTML = "";
        if (filtrados.length === 0) {
            contenedor.innerHTML = "<p style='grid-column:1/-1;text-align:center;'>No hay productos.</p>";
            return;
        }

        filtrados.forEach(p => {
            const card = document.createElement("div");
            card.className = "product-card";
            card.innerHTML = `
                <img src="${p.imagen_url || '../Imagenes/fresa.jpg'}">
                <h3>${p.nombre.toUpperCase()}</h3>
                <p>${p.descripcion || 'Producto fresco local'}</p>
                <div class="precio-tag">${p.precio} €</div>
                <div class="card-buttons">
                    <button class="btn-large heart" onclick="agregarFavorito(${p.id_producto})">
                        ❤️ Me gusta
                    </button>
                    <button class="btn-large cart" onclick="agregarAlCarrito(${p.id_producto})">
                        🛒 Comprar
                    </button>
                </div>
            `;
            contenedor.appendChild(card);
        });

    } catch (e) {
        contenedor.innerHTML = "<p>Error al conectar con el servidor.</p>";
       
    }
}
function agregarFavorito(id) {
    const productosRaw = localStorage.getItem("productos");
    const favoritos = JSON.parse(localStorage.getItem("favoritos")) || [];
    
    if (!productosRaw) return;   

    const productos = JSON.parse(productosRaw);
    const prod = productos.find(p => p.id_producto == id);
    
    if (!prod) {
        console.error("No se encontró el producto con ID:", id);
        return;
    }
    // Comprobamos si ya está en favoritos
    const yaExiste = favoritos.some(p => p.id_producto == id);
    if (!yaExiste) {
        favoritos.push(prod);
        localStorage.setItem("favoritos", JSON.stringify(favoritos));
        actualizarContadores(); 
        mostrarAvisoFrutweb("¡Añadido a favoritos! ❤️");
    } else {
        mostrarAvisoFrutweb("Ya está en tu lista de favoritos");
    }
}
function agregarAlCarrito(id) {
    const productos = JSON.parse(localStorage.getItem("productos")) || [];
    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    const prod = productos.find(p => p.id_producto == id);
    if (!prod) return;

    const existe = carrito.find(p => p.id_producto == id);
    if (existe) {
        existe.cantidad++;
    } else {
        carrito.push({ ...prod, cantidad: 1 });
    }
    localStorage.setItem("carrito", JSON.stringify(carrito));
    actualizarContadores(); 
    mostrarAvisoFrutweb("¡Producto añadido al carrito!");
}
/* Muestra de avisos para no tener alert*/ 
function mostrarAvisoFrutweb(mensaje) {
    const toast = document.getElementById("notificacion-frutweb");
    const msgElement = document.getElementById("toast-mensaje");
    
    if (toast && msgElement) {
        msgElement.textContent = mensaje;
        toast.style.display = "block";

        // Desaparece a los 2 segundos (2000ms)
        setTimeout(() => {
            toast.style.display = "none";
        }, 2000);
    }
}
function cambiarCantidad(id, operacion) {
    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    const producto = carrito.find(p => p.id_producto === id);

    if (producto) {
        if (operacion === 'mas') {
            producto.cantidad++;
        } else if (operacion === 'menos' && producto.cantidad > 1) {
            producto.cantidad--;
        }
        
        localStorage.setItem("carrito", JSON.stringify(carrito));
        cargarCarrito(); // Recargamos la vista
    }
}
function abrirCheckout() {
    document.getElementById("checkoutModal").style.display = "flex";
}

function cerrarCheckout() {
    document.getElementById("checkoutModal").style.display = "none";
}

function confirmarPedido() {
    const telefono = document.getElementById("telefono").value.trim();
    const calle = document.getElementById("calle").value.trim();
    const numero = document.getElementById("numero").value.trim();
    const piso = document.getElementById("piso").value.trim();
    const cp = document.getElementById("cp").value.trim();
    const poblacion = document.getElementById("poblacion").value.trim();

    // Validar que todos los campos estén completos
    if (!telefono || !calle || !numero || !piso || !cp || !poblacion) {
        mostrarToast("Debes completar todos los campos de envío");
        return;
    }

    // Validación de teléfono
    if (!/^[0-9]{9}$/.test(telefono)) {
        mostrarToast("Teléfono no válido");
        return;
    }

    const direccion = `${calle}, ${numero}, ${piso}, ${cp}, ${poblacion}`;

    localStorage.setItem("telefono", telefono);
    localStorage.setItem("direccion", direccion);

    cerrarCheckout();

    // Enviar al backend con la dirección ya concatenada
    enviarPedidoAlBackend(telefono, direccion);
}

async function enviarPedidoAlBackend(telefono, direccion) {
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    const token = localStorage.getItem("token");

     if (!telefono || !direccion) {return mostrarAvisoFrutweb("Faltan datos de envío", "aviso"); }

    if (!/^[0-9]{9}$/.test(telefono)) { return mostrarAvisoFrutweb("Teléfono no válido", "aviso");}
    if (carrito.length === 0) return mostrarAvisoFrutweb("El carrito está vacío");
    if (!token) {
        mostrarAvisoFrutweb("Inicia sesión para comprar", "aviso");
        setTimeout(() => window.location.href = "/index.html", 5000);
        return;
    }

    const total = carrito.reduce((acc, p) => acc + Number(p.precio) * p.cantidad, 0);
    const datosPedido = { carrito, total, telefono,direccion};

    try {
        const response = await fetch("http://localhost:3000/api/pedidos/finalizar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`
            },
            body: JSON.stringify(datosPedido)
        });

        let data;
        try {
            data = await response.json();
        } catch (e) {
            console.error("❌ Respuesta del servidor NO es JSON:", await response.text());
            mostrarAvisoFrutweb("Error de respuesta del servidor", "eliminar");
            return;
        }

        if (response.ok && data.success) {
            // vaciar carrito
            localStorage.removeItem("carrito");
            const contenedor = document.getElementById("contenedor-carrito");
            if (contenedor) contenedor.innerHTML = "<p style='text-align:center;'>Procesando...</p>";
            const totalEl = document.getElementById("total");
            if (totalEl) totalEl.innerText = "0 €";
            const countEl = document.getElementById("count-cart");
            if (countEl) countEl.innerText = "0";

            mostrarAvisoFrutweb("¡Compra realizada con éxito! 🎉");
            setTimeout(() => window.location.href = "/pages/shop/venta.html", 4500);
        } else {
            mostrarAvisoFrutweb("Error: " + (data.error || data.mensaje || "No se pudo procesar"), "eliminar");
        }

    } catch (error) {
        console.error("Error de red:", error);
        mostrarAvisoFrutweb("Error de conexión con el servidor", "eliminar");
    }
}
function requiereLogin() {
    const token = localStorage.getItem("token");
    if (!token) {
        alert("Debes iniciar sesión");
        window.location.href = "/index.html";
    }
}
function abrirInfoLegal(tipo) {
    const modal = document.getElementById("modalLegal");
    const titulo = document.getElementById("legalTitulo");
    const texto = document.getElementById("legalTexto");
    const logoHtml = '<img src="/Imagenes/Frutweb logo.png" style="width: 100px; display: block; margin: 0 auto 20px auto;">';

    const contenidos = {
        'compania': {
            titulo: "Nuestra Compañía",
            html: logoHtml +"<p>Frutweb nació en Gran Canaria con el objetivo de llevar el producto local directamente del agricultor a tu casa.</p><p>Creemos en el comercio justo y en la calidad de nuestra tierra.</p>"
        },
        'privacidad': {
            titulo: "Política de Privacidad",
            html: logoHtml +"<p>En FRUTWEB protegemos tus datos. Según el RGPD, te informamos que tus datos solo se usarán para gestionar tus pedidos y, si lo aceptas, enviarte ofertas exclusivas.</p>"
        },
        'terminos': {
            titulo: "Términos y Condiciones",
            html: logoHtml +"<ul><li>Los pedidos se entregan en 24/48h.</li><li>Envío gratuito a partir de 30€.</li><li>Si el producto no llega fresco, te devolvemos el dinero.</li></ul>"
        },
        'avisolegal': {
            titulo: "Aviso Legal",
            html: logoHtml + "<p>Todo el contenido de este sitio web es propiedad de FRUTWEB y está protegido por la normativa vigente.</p><p>Queda prohibida la reproducción total o parcial sin autorización.</p>"
        }
    };

    if (contenidos[tipo]) {
        titulo.innerText = contenidos[tipo].titulo;
        texto.innerHTML = contenidos[tipo].html;
        modal.style.display = "flex";
    }
}

function cerrarInfoLegal() {
    document.getElementById("modalLegal").style.display = "none";
}

// Cerrar si se hace clic fuera del contenido blanco
window.onclick = function(event) {
    const modal = document.getElementById("modalLegal");
    if (event.target == modal) {
        modal.style.display = "none";
    }
}