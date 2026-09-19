# 🛠️ Utilidades de Limpieza de Laboratorio (CESDE)

Este directorio contiene los 3 scripts diseñados para restablecer tu entorno de trabajo a estado original antes de salir del laboratorio o al cambiar de equipo.

---

## 📋 Lista de Scripts

| Script | Propósito | Qué elimina |
|---|---|---|
| [`restablecer_chrome.bat`](restablecer_chrome.bat) | Restablecer Google Chrome | Cuentas sincronizadas, cookies, contraseñas guardadas, historial y perfiles (`User Data` y Registro). Al abrirlo de nuevo, inicia con la pantalla de bienvenida de fábrica. |
| [`restablecer_vscode.bat`](restablecer_vscode.bat) | Restablecer Visual Studio Code | Extensiones instaladas (`.vscode/extensions`), perfiles de usuario (`AppData/Code`), historial reciente, cuentas de GitHub vinculadas y credenciales de Git en Windows. |
| [`limpiar_bases_datos_practica.bat`](limpiar_bases_datos_practica.bat) | Limpiar Bases de Datos de Clase | Elimina de SQL Server y MySQL las bases de datos de prueba (`PROGANADO`, `PROGANADO2`, `TIENDA`, `HOTEL`, etc.) preservando intactas las bases de datos maestras del sistema. |

---

## 🚀 Uso Rápido
1. Haz doble clic en el script correspondiente según lo que necesites limpiar.
2. Cada script solicita confirmación y reporta el estado en pantalla.
