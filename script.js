document.addEventListener('DOMContentLoaded', () => {
    const authBtn = document.getElementById('auth-btn');
    const user = JSON.parse(localStorage.getItem("user"));

    // 1. Detectar estado inicial: ¿Hay usuario en el LocalStorage?
    if (user && authBtn) {
        authBtn.innerText = 'CERRAR SESIÓN';
    }

    if (authBtn) {
        authBtn.addEventListener('click', () => {
            const currentUser = localStorage.getItem("user");
            if (currentUser) {
                // Si hay usuario, queremos salir
                openLogoutModal();
            } else {
                // Si no hay, queremos entrar
                openModal('login');
            }
        });
    }
});

// --- FUNCIONES DE LOGOUT (COMPARTIDAS) ---

function openLogoutModal() {
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
        closeLogoutModal();
        
        // Llamada al servidor
        const res = await fetch("http://localhost:3000/api/auth/logout", {
            method: "POST",
            credentials: "include"
        });

        // Limpiamos siempre el localstorage por seguridad
        localStorage.removeItem("user");

        // Mostramos el modal de despedida que tienes en el HTML
        const despedida = document.getElementById("despedidaModal");
        if (despedida) {
            despedida.style.display = "flex";
            setTimeout(() => {
                // Redirigimos a la raíz (ajusta la ruta según si estás en shop/ o no)
                window.location.href = "/home.html"; 
            }, 3000);
        } else {
            window.location.href = "/home.html";
        }
        
    } catch (error) {
        console.error("Error al cerrar sesión:", error);
        localStorage.removeItem("user");
        window.location.href = "/home.html";
    }
}