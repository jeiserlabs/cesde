# Ubicaciones canónicas y cronología — CESDE 2026-2

> **Regla de una sola fuente:** las rutas y fechas de este documento son la referencia para no rehacer trabajo. Si cambia una fecha o se mueve una carpeta, se actualiza aquí y en `data/state/contexto_maestro/LINEA_TEMPORAL.json` de LifeOS. No se deduce de la memoria de una sesión.

---

## 1. Dónde vive cada cosa

| Proyecto | Carpeta local canónica | GitHub | Drive |
|---|---|---|---|
| **CESDE (académico)** | `C:\PROYECTOS\Mis_Proyectos\CESDE` | https://github.com/jeiserlabs/cesde | [Cesde](https://drive.google.com/drive/folders/19G27Bupt2EgxVIZVXq1jVUEnvbW_QXkw) |
| **ProGanado (proyecto integrador)** | `C:\PROYECTOS\Mis_Proyectos\ProGanado` | https://github.com/jeiserlabs/proganado | [ProGanado_Sustentacion_Oficial_CESDE](https://drive.google.com/drive/folders/1_Ozo8XA7UjZPFWDf9WtDfhg5XgCmmKns) |
| **Segaso (chorizos)** | `C:\PROYECTOS\Mis_Proyectos\Segaso` | https://github.com/jeiserlabs/segaso-chorizos | [Segaso_Sustentacion_Oficial_CESDE](https://drive.google.com/drive/folders/1X1AMmMNQegvkJc3yDEgMCye039Eogx2Y) |
| **LifeOS (asistente personal)** | `C:\PROYECTOS\Mis_Proyectos\Asistente_Personal` | repo privado/local | no aplica |

**Regla de medios:** GitHub guarda texto y código; Drive guarda PDF, DOCX, XLSX, PPSX, ZIP, imágenes y audio. Un binario no se commitea (Regla 29).

---

## 2. Mapa del repo CESDE

| Ruta | Contenido |
|---|---|
| `Logica/` | Ejercicios y talleres de Lógica de Programación. |
| `Logica/Curso_24220/` | Estado del curso, manifiestos y `INDICE_MATERIAL_MOODLE.md`; los binarios están en Drive. |
| `Logica/Semana8_2026/` | Taller de la Semana 8 (Tienda Virtual y CineExpress) en Java, PSeInt y E-P-S. |
| `Logica/Evaluaciones/` | Resúmenes de evaluaciones (Momento 2 de Lógica). |
| `Base_de_Datos/` | MER, modelo relacional, DDL, DML y talleres. |
| `Base_de_Datos/Talleres/` | Transcripciones de talleres; el PDF original vive en Drive. |
| `Introduccion_Programacion/` | HTML5, CSS, Git y talleres web. |
| `Documentacion_Proyecto/` | Documentos del proyecto integrador. |
| `Anotaciones_Clase/` | Apuntes de clase. |
| `docs/` | Ubicaciones, cronología y respaldos. |

**Respaldo del Escritorio (31-oct-2026):** [Respaldo_Escritorio_20261031](https://drive.google.com/drive/folders/1estUxESRK0N2hQfE76lCxnBiNbhBv2f9). Detalle en `docs/RESPALDO_ESCRITORIO_20261031.md`.

---

## 3. Línea temporal única (fechas duras)

| Fecha | Hito | Estado | Fuente |
|---|---|---|---|
| 2026-08-30 | Entrega Momento 1 (25 %) — ProGanado / bases del semestre | Cerrado | `04_Documentos_Sustentacion/` de ProGanado |
| 2026-10-10 | Segundo Momento (35 %) — BD e Introducción a la Programación | Cerrado | Planeador FTCOCU-129 / Linea Temporal |
| 2026-10-17 | Evaluación Momento 2 de Lógica (35 %) — nota 4.77/5.0 | Cerrado | `Logica/Evaluaciones/MOMENTO2_2026-10-17_RESUMEN.md` |
| 2026-10-30 | Taller INNER JOIN y GROUP BY (Momento 3, BD) | Cerrado | `Base_de_Datos/Talleres/` |
| 2026-10-31 | Semana 15 — framework CSS | Pendiente de asistir | Planeador FTCOCU-129 |
| 2026-11-07 | Semana 16 — proyectos de maquetación (reposición de festivo) | Pendiente | Planeador FTCOCU-129 |
| 2026-11-14 | **Sustentación de Proyectos Integradores** (fecha dura del título) | Pendiente | Planeador FTCOCU-129 / Linea Temporal |
| 2026-11-21 | Tercer Momento (40 %) + digitación de evidencias finales | Pendiente | Planeador FTCOCU-129 / Linea Temporal |

> Las fechas de noviembre son duras: la sustentación del 14-nov-2026 condiciona el título. Cualquier cambio debe confirmarse con coordinación CESDE y registrarse en `LINEA_TEMPORAL.json`.

---

## 4. Flujo de trabajo acordado

1. Se trabaja **local** en `C:\PROYECTOS\Mis_Proyectos\CESDE`.
2. Al terminar una sesión: se commitea y se hace `git push` a `jeiserlabs/cesde`.
3. Los binarios nuevos se suben a la carpeta CESDE de Drive y se verifica su MD5.
4. Se actualiza este documento si cambió una ruta o una fecha.
5. No se duplica material en el Escritorio: el Escritorio es una bandeja de entrada, no un archivo permanente.
