# 🛒 FamilyCart — Guía de instalación

App de lista de la compra familiar, en tiempo real, offline-first, 100% gratis.

---

## ⚡ Puesta en marcha en 15 minutos

### PASO 1 — Crear proyecto en Supabase (5 min)

1. Ve a **https://supabase.com** → "Start your project" → regístrate gratis
2. "New Project" → elige nombre (ej: familycart) → crea contraseña → "Create new project"
3. Espera ~2 min a que se cree

### PASO 2 — Crear las tablas (2 min)

1. En Supabase, ve a **SQL Editor** (icono de base de datos en el sidebar)
2. Copia todo el contenido de `supabase-setup.sql`
3. Pégalo en el editor → botón **"Run"**
4. Verás "Success" ✅

### PASO 3 — Copiar tus credenciales (1 min)

1. En Supabase → **Settings** → **API**
2. Copia:
   - **Project URL** → algo como `https://xxxx.supabase.co`
   - **anon public key** → clave larga que empieza por `eyJ...`

3. Abre `index.html` y busca estas líneas (al final del archivo):

```javascript
const SUPABASE_URL  = 'TU_SUPABASE_URL';   // ← pega aquí tu URL
const SUPABASE_KEY  = 'TU_SUPABASE_ANON_KEY'; // ← pega aquí tu key
```

4. Reemplaza los valores y guarda el archivo

### PASO 4 — Subir a GitHub Pages (5 min)

1. Ve a **https://github.com** → "New repository"
2. Nombre: `familycart` → Public → "Create repository"
3. Sube los archivos:
   - Opción fácil: arrastra `index.html` directamente al repo en el navegador
4. Ve a **Settings** → **Pages** → Source: "Deploy from branch" → branch: `main` → **Save**
5. En ~1 min tu app estará en: `https://TU_USUARIO.github.io/familycart`

---

## 📱 Instalar en el móvil (como app nativa)

### iPhone / Safari:
1. Abre la URL en Safari
2. Botón compartir (cuadrado con flecha) → "Añadir a pantalla de inicio"
3. ¡Listo! Aparece como app con icono propio

### Android / Chrome:
1. Abre la URL en Chrome
2. Menú (3 puntos) → "Añadir a pantalla de inicio"
3. O espera el banner automático que aparece

---

## 👨‍👩‍👧 Cómo añadir a tu pareja/familia

1. Tú creas la cuenta y la familia → recibes un **código de 6 letras**
2. Ve al icono 👤+ en la app → "Invitar" → copia el código
3. Tu pareja entra a la misma URL → "Registro" → "Unirme a familia existente"
4. Introduce el código → ¡ya están conectados!

---

## ✅ Funcionalidades del Sprint 1

- [x] Login / Registro de usuario
- [x] Crear familia con código de invitación
- [x] Añadir / eliminar productos
- [x] Marcar productos como comprados
- [x] **Sincronización en tiempo real** (tu mujer añade algo → te aparece al instante)
- [x] **Modo Compra** (interfaz optimizada para el súper, tap para tachar)
- [x] **Funciona offline** (sin wifi en el súper, sincroniza al salir)
- [x] **Sugerencias inteligentes** (aprende de tu historial de compras)
- [x] Historial de listas anteriores
- [x] Repetir lista de una compra anterior
- [x] Instalable como app en móvil (PWA)
- [x] Diseño tipo Apple — oscuro, limpio, táctil

---

## 🆓 Coste total: 0€

| Servicio | Plan | Coste |
|----------|------|-------|
| GitHub Pages | Free | 0€ |
| Supabase | Free tier | 0€ |
| **Total** | | **0€/mes** |

El free tier de Supabase aguanta perfectamente uso familiar para siempre.

---

## 🚀 Próximos sprints (cuando quieras)

- **Sprint 2**: Modo offline mejorado con sync de conflictos
- **Sprint 3**: IA de sugerencias más inteligente con historial largo
- **Sprint 4**: Categorías de productos (frutas, lácteos, limpieza...)
- **Sprint 5**: Notificaciones push ("Tu pareja actualizó la lista")
