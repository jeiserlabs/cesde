# Respaldo y purga del Escritorio — 31-oct-2026

## Resultado

| Métrica | Resultado |
|---|---|
| Archivos de estudio respaldados | **43** |
| Tamaño total | **32.17 MB** |
| Verificación MD5 contra Drive | **43/43** |
| Carpetas de origen auditadas | 7 |
| Carpetas de origen con material de estudio | 3 (`Logica`, `TALLER_BD_INNER_JOIN_2026-10-30`, `Nueva carpeta`) |
| Destino de binarios | [Respaldo_Escritorio_20261031](https://drive.google.com/drive/folders/1estUxESRK0N2hQfE76lCxnBiNbhBv2f9) en Drive |
| Destino de texto/código | Repo `jeiserlabs/cesde` |
| Originales locales | Cuarentena reversible: `C:\PROYECTOS\_archive_2026-10\estudio_desktop_20261031` |

## Qué se respaldó

| Grupo | Archivos | Contenido |
|---|---:|---|
| `01_Logica_Curso_24220` | 29 | 21 recursos Moodle, 4 PDF/DOCX complementarios, `proyecto.zip`, estado y manifiestos del curso. |
| `02_Taller_BD_INNER_JOIN` | 1 | Taller de INNER JOIN y GROUP BY (8 páginas, 10 consultas T-SQL). |
| `03_Logica_Momento2` | 1 | Auditoría y desglose del Momento 2 de Lógica. |
| `04_Semana8_Ejercicios` | 12 | PDF del taller, Java/PSeInt/E-P-S, `.class`, ZIP de entregables y variante para Sebastián. |

Los 43 archivos están en el manifiesto `05_Manifiestos/MANIFIESTO_SHA256.csv` de Drive, con MD5 y SHA-256. El repo guarda la versión de texto: código, índices, transcripción del taller y resúmenes.

## Qué se dejó intacto (no era estudio)

| Carpeta / archivo | Motivo |
|---|---|
| `Desktop\Descargas` | Juego PS4 (`Wukong`); no es material académico. |
| `Desktop\INSTALADOR DE JUEGOS` | Pipeline PS5; pertenece a CONECTOR, no a CESDE. |
| `Desktop\Juegos` | Juego de prueba y watchdog; no es estudio. |
| `Desktop\Nueva carpeta\brave_resolver_profile` | Perfil de navegador usado por automatizaciones. |
| `Desktop\Nueva carpeta\hdv jeiser` | Hojas de vida; son material de carrera, no de CESDE. |
| `Desktop\Nueva carpeta\ACFrOg...pdf` | Lista de precios de café/boards; no es estudio. |
| `Desktop\DESCARGAS TELEGRAM` | Carpeta vacía. |

## Seguridad

- El PDF del taller contiene la cédula; se subió a Drive **privado** y no se publicó en GitHub.
- La transcripción `Base_de_Datos/Talleres/Taller_INNER_JOIN_2026-10-30.md` enmascara ese dato.
- No se subieron credenciales ni archivos de configuración.
- Los originales no se borraron: se movieron a cuarentena. Se pueden restaurar desde allí si falta algo.

## Verificación

1. `MANIFIESTO_SHA256.csv` de Drive contiene 43 filas con `md5` y `sha256`.
2. La subida se verificó con `verificarSubida` (tamaño + `md5Checksum` de Google Drive).
3. Los archivos locales se movieron después de la verificación, no antes.
4. El repo conserva los textos y la transcripción; Drive conserva los binarios.
