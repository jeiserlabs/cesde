# 📚 GUÍA MAESTRA DE ESTUDIO Y EXÁMENES — PLATZI & CESDE
> **Estudiante:** Jeiser Abraham Gutiérrez Torres (`jgutirrez`)  
> **Institución:** CESDE — Técnico en Desarrollo de Software (Nivel 1)  
> **Propósito:** Apuntes estructurados, conceptos clave, diferencias mecánicas y bancos de preguntas frecuentes para presentar y aprobar con 100% los exámenes de certificación.

---

## 📑 ÍNDICE DE CURSOS
1. [Gestión de Bases de Datos con SQL Server](#1-curso-de-gestión-de-bases-de-datos-con-sql-server)
2. [Fundamentos de Bases de Datos 2019](#2-curso-de-fundamentos-de-bases-de-datos-2019)
3. [Curso de PostgreSQL](#3-curso-de-postgresql)
4. [Curso Práctico de SQL](#4-curso-práctico-de-sql)
5. [Fundamentos de Bases de Datos y SQL](#5-curso-de-fundamentos-de-bases-de-datos-y-sql)
6. [Curso de Pensamiento Lógico: Algoritmos y Diagramas](#6-curso-de-pensamiento-lógico-algoritmos-y-diagramas)
7. [Responsive Design: Maquetación Mobile First](#7-curso-de-responsive-design-maquetación-mobile-first)
8. [Pensamiento Crítico para usar Inteligencia Artificial](#8-curso-de-pensamiento-crítico-para-usar-inteligencia-artificial)
9. [Curso de Introducción a la Inteligencia Artificial](#9-curso-de-introducción-a-la-inteligencia-artificial)

---

## 🗄️ 1. CURSO DE GESTIÓN DE BASES DE DATOS CON SQL SERVER
* **ID Platzi:** 12869 | **Motor:** Microsoft SQL Server (T-SQL) / SSMS

### 🧠 Conceptos Esenciales de Examen:
* **Índices Clustered vs Non-Clustered:**
  * `Clustered Index`: Define el ordenamiento físico real en el que se guardan los datos en disco. **Solo puede existir 1 por tabla** (creado automáticamente al definir una `PRIMARY KEY`).
  * `Non-Clustered Index`: Estructura lógica en árbol B separada de los datos, que contiene punteros hacia las filas físicas. Puede haber múltiples por tabla.
* **Stored Procedures (Procedimientos Almacenados):**
  * Bloques de código T-SQL guardados en el servidor. Reducen el tráfico de red y pre-compilan planes de ejecución.
  * Sintaxis: `CREATE PROCEDURE sp_Nombre @parametro INT AS BEGIN ... END;`
  * Modificación: Se utiliza `ALTER PROCEDURE` (no requiere borrar y recrear).
* **Transacciones y Manejo de Errores:**
  * Sintaxis obligatoria:
    ```sql
    BEGIN TRY
        BEGIN TRANSACTION;
        -- Operaciones SQL
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SELECT ERROR_MESSAGE(), ERROR_NUMBER();
    END CATCH;
    ```
  * **Propiedades ACID:** Atomicidad (todo o nada), Consistencia (estado válido), Aislamiento (aislado de otras transacciones), Durabilidad (persiste tras caídas del sistema).
* **Triggers (Disparadores):**
  * Eventos automáticos (`INSERT`, `UPDATE`, `DELETE`).
  * Tablas virtuales residentes en memoria temporal:
    * `inserted`: Contiene las filas nuevas insertadas o el nuevo estado de una fila actualizada.
    * `deleted`: Contiene las filas eliminadas o el estado previo anterior a la actualización.
* **Vistas Indexadas (Indexed Views):**
  * Para crear un índice sobre una vista, la vista DEBE haberse creado con la cláusula `WITH SCHEMABINDING`.
* **Window Functions (Funciones de Ventana):**
  * `ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY precio DESC)`.
  * Realizan cálculos analíticos particionando los datos **sin colapsar ni reducir filas** a diferencia de `GROUP BY`.

---

## 🗄️ 2. CURSO DE FUNDAMENTOS DE BASES DE DATOS 2019
* **ID Platzi:** 1566 | **Tema Central:** Arquitectura Relacional y Formas Normales

### 🧠 Conceptos Esenciales de Examen:
* **Fases del Diseño de Bases de Datos:**
  1. *Conceptual:* Modelo Entidad-Relación (MER - Chen). Rectángulos = Entidades, Óvalos = Atributos, Rombos = Relaciones.
  2. *Lógico:* Modelo Relacional (Tablas, columnas, tipos de datos, PK y FK).
  3. *Físico:* Implementación en el motor (DDL, scripts `.sql`, índices y almacenamiento).
* **Las Tres Formas Normales de Edgar Codd (1FN, 2FN, 3FN):**
  * **1FN (Primera Forma Normal - Atomicidad):**
    * Cada celda debe tener un valor único e indivisible.
    * No deben existir arreglos ni grupos repetitivos de columnas (ej. `telefono1`, `telefono2` está prohibido; se extrae a tabla hija).
  * **2FN (Segunda Forma Normal - Dependencia Completa):**
    * Debe estar en 1FN.
    * Aplica principalmente a tablas con Claves Primarias Compuestas. Todo atributo no clave debe depender de la totalidad de la PK, no de una parte de ella.
  * **3FN (Tercera Forma Normal - Cero Dependencias Transitivas):**
    * Debe estar en 2FN.
    * Ningún atributo no clave debe depender de otro atributo no clave (ej. el nombre del departamento depende del código de departamento, no directamente del ID de usuario; se debe crear la tabla `Departamentos`).
* **Relaciones Muchos a Muchos ($N:M$):**
  * En una base de datos relacional es imposible modelar $N:M$ directamente entre 2 tablas sin crear anomalías.
  * **Regla obligatoria:** Se debe crear una **tabla intermedia (pivote/asociativa)** con al menos dos llaves foráneas (`FK`), las cuales juntas componen usualmente una PK compuesta.
* **Integridad Referencial:**
  * `ON DELETE CASCADE`: Si se borra el registro padre, se eliminan automáticamente todos sus registros hijos asociados.
  * `ON DELETE RESTRICT` / `NO ACTION`: Impide eliminar el registro padre si existen registros vinculados en la tabla hija.

---

## 🗄️ 3. CURSO DE POSTGRESQL
* **ID Platzi:** 12074 | **Motor:** PostgreSQL (ORDBMS Open Source)

### 🧠 Conceptos Esenciales de Examen:
* **Manejo de Valores Nulos:**
  * `COALESCE(val1, val2, ..., 'Por Defecto')`: Retorna el primer valor no nulo de la lista.
  * `NULLIF(a, b)`: Retorna `NULL` si $a = b$; de lo contrario devuelve $a$. (Se usa para evitar errores de división por cero: `total / NULLIF(cantidad, 0)`).
* **Manejo de Fechas y Tiempo:**
  * Obtener tiempo actual: `CURRENT_TIMESTAMP` o `NOW()`.
  * Extraer partes de fecha: `EXTRACT(YEAR FROM fecha_registro)`.
  * `EPOCH`: `EXTRACT(EPOCH FROM (fecha_fin - fecha_inicio))` devuelve la diferencia en segundos numéricos.
* **Tipos de Datos Avanzados de PostgreSQL:**
  * `JSON` vs `JSONB`:
    * `JSON`: Almacena el texto crudo tal como se envía. Lento de consultar.
    * `JSONB`: Almacena en formato binario estructurado y optimizado. Permite crear índices GIN y realizar consultas directas con operadores de contención `@>` o existencia `?`.
  * `UUID`: Identificadores únicos generados con `gen_random_uuid()`.
  * Arreglos nativos: Tipos como `INTEGER[]` o `TEXT[]`.
* **Comando COPY:**
  * Para importar archivos masivos CSV a una tabla de Postgres:
    `COPY empleados FROM '/ruta/empleados.csv' WITH (FORMAT csv, HEADER);`

---

## 🗄️ 4. CURSO PRÁCTICO DE SQL
* **ID Platzi:** 2059 | **Tema Central:** Sintaxis de Consultas, Joins y Filtros

### 🧠 Conceptos Esenciales de Examen:
* **Orden Lógico de Ejecución de SQL:**
  * El motor **no** ejecuta el código en el orden en que se escribe (`SELECT` no es el primero):
  1. `FROM` y `JOIN` (se determina el universo de tablas)
  2. `WHERE` (filtra filas individuales)
  3. `GROUP BY` (agrupa registros)
  4. `HAVING` (filtra grupos agrupados; se aplican condiciones con `SUM`, `COUNT`, `AVG`)
  5. `SELECT` (proyecta columnas)
  6. `DISTINCT` (elimina duplicados)
  7. `ORDER BY` (ordena el resultado)
  8. `LIMIT` / `OFFSET` (paginación)
* **WHERE vs HAVING:**
  * `WHERE` filtra registros fila a fila ANTES de que ocurra la agregación. No acepta funciones de agregación (`WHERE COUNT(*) > 5` es un error de sintaxis).
  * `HAVING` filtra sobre los grupos resultantes DESPUÉS de la agregación (`HAVING COUNT(*) > 5` es correcto).
* **Diferencias de JOINs:**
  * `INNER JOIN`: Solo registros que tienen coincidencia en ambas tablas.
  * `LEFT JOIN`: Todos los registros de la tabla de la izquierda, y los coincidentes de la derecha (o `NULL` si no coinciden).
  * `RIGHT JOIN`: Todos los registros de la tabla derecha.
  * `FULL OUTER JOIN`: Todos los registros de ambas tablas, rellenando con `NULL` los huecos.
  * `CROSS JOIN`: Producto cartesiano ($M \times N$ filas).
* **Patrones con LIKE:**
  * `%`: Representa cero, uno o múltiples caracteres (`'J%'` = empieza con J).
  * `_`: Representa exactamente un único carácter (`'_a%'` = segunda letra es 'a').

---

## 🗄️ 5. CURSO DE FUNDAMENTOS DE BASES DE DATOS Y SQL
* **ID Platzi:** 13017 | **Tema Central:** Sublenguajes DDL, DML, DQL y Restricciones

### 🧠 Conceptos Esenciales de Examen:
* **Clasificación de Sentencias SQL:**
  * **DDL (Data Definition Language):** Modifica la estructura del esquema. Comandos: `CREATE`, `ALTER`, `DROP`, `TRUNCATE`.
  * **DML (Data Manipulation Language):** Modifica los datos/filas. Comandos: `INSERT`, `UPDATE`, `DELETE`.
  * **DQL (Data Query Language):** Consulta datos. Comando: `SELECT`.
  * **DCL (Data Control Language):** Permisos y privilegios. Comandos: `GRANT`, `REVOKE`.
  * **TCL (Transaction Control Language):** Control de transacciones. Comandos: `COMMIT`, `ROLLBACK`, `SAVEPOINT`.
* **TRUNCATE vs DELETE:**
  * `DELETE`: Sentencia DML. Elimina fila por fila registrando cada una en el log de transacciones. Permite usar cláusula `WHERE`. Activa triggers `DELETE`.
  * `TRUNCATE`: Sentencia DDL. Libera las páginas de asignación completas de la tabla. No admite `WHERE`. Resetea contadores auto-incrementales (`IDENTITY`). Es exponencialmente más rápido. No activa triggers de borrado.
* **Restricciones de Integridad (CONSTRAINTS):**
  * `PRIMARY KEY`: Combinación de `UNIQUE` y `NOT NULL`.
  * `FOREIGN KEY`: Asegura que el valor exista en la tabla referenciada.
  * `UNIQUE`: Garantiza que no haya valores repetidos en la columna (permite un único `NULL` en SQL Server).
  * `CHECK`: Expresión lógica booleana que valida los datos entrantes (ej. `CHECK (edad >= 18)`).
  * `DEFAULT`: Asigna un valor predeterminado si no se especifica en el `INSERT`.

---

## 🧠 6. CURSO DE PENSAMIENTO LÓGICO: ALGORITMOS Y DIAGRAMAS
* **ID Platzi:** 12116 | **Docente Platzi:** Yesi Days | **19/19 Examen Verde**

### 🧠 Conceptos Esenciales de Examen:
* **Simbología Universal de Diagramas de Flujo:**
  * **Círculo / Óvalo:** Representa exclusivamente el **Inicio** y el **Fin** del algoritmo.
  * **Rectángulo:** Representa una **Instrucción**, asignación o proceso interno.
  * **Rombo:** Representa una **Decisión** / Condicional (`¿Cumple condición? Sí / No`).
  * **Paralelogramo:** Representa **Entrada / Salida** de datos (Lectura de usuario o impresión en pantalla).
* **El Acertijo del Puente con Linterna (Estrategia Óptima - 15 minutos):**
  * Cuatro personas con tiempos: Tú (1 min), Pedro (2 min), Juana (5 min), Carla (8 min).
  * Capacidad del puente: Máximo 2 personas a la vez; linterna obligatoria para cruzar.
  * *Estrategia óptima:*
    1. Tú y Pedro cruzan (tardan el del más lento: 2 min). Acumulado: 2 min.
    2. Tú regresas solo con la linterna (1 min). Acumulado: 3 min.
    3. Juana y Carla cruzan juntas (tardan 8 min). Acumulado: 11 min.
    4. Pedro regresa con la linterna (2 min). Acumulado: 13 min.
    5. Tú y Pedro cruzan de nuevo (2 min). Acumulado final: **15 minutos**.
* **Operador Módulo / Residuo (`%`):**
  * Devuelve el residuo de una división entera.
  * Pregunta típica de examen Platzi: `13 % 5 = 3`. (Porque $13 = 5 \times 2 + 3$).
  * Se utiliza para comprobar si un número es par: `numero % 2 == 0`.
* **Variables vs Constantes:**
  * **Variable:** Espacio de memoria cuyo contenido puede variar durante la ejecución del programa.
  * **Constante:** Identificador de valor inmutable asignado al inicio (ej. $\pi = 3.14159$).
* **Matrices (Arreglos Bidimensionales):**
  * Se definen por filas y columnas: `Dimension matriz[filas, columnas]`. Para acceder a una posición específica se indican ambas coordenadas `matriz[i, j]`.

---

## 🎨 7. RESPONSIVE DESIGN: MAQUETACIÓN MOBILE FIRST
* **ID Platzi:** 12345 | **Tema Central:** CSS3, Media Queries y Responsive Layouts

### 🧠 Conceptos Esenciales de Examen:
* **Filosofía Mobile First:**
  * Se maquetan los estilos base pensando primero en la pantalla móvil más pequeña.
  * Luego, se escala progresivamente hacia pantallas más grandes utilizando **Media Queries con `min-width`** (de menor a mayor resolución).
  * Ventaja: Código más liviano y carga más rápida en smartphones con conexiones limitadas.
* **Etiqueta Meta Viewport (Obligatoria):**
  ```html
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  ```
  * `width=device-width`: Iguala el ancho del canvas al ancho físico del dispositivo.
  * `initial-scale=1.0`: Establece el zoom inicial al 100%.
* **Unidades de Medida Responsivas:**
  * `rem` (*root em*): Relativo al tamaño de fuente del elemento raíz `<html>` (por defecto $1\text{rem} = 16\text{px}$). Proporciona consistencia en toda la web.
  * `em`: Relativo al tamaño de fuente de su elemento padre directo.
  * `vw` / `vh`: Porcentaje del ancho/alto visible del navegador ($100\text{vw} = 100\%$ del ancho de la pantalla).
* **Flexbox vs CSS Grid:**
  * `Flexbox` ($1\text{D}$): Diseñado para alinear elementos en una sola dimensión (fila o columna).
  * `CSS Grid` ($2\text{D}$): Diseñado para maquetaciones completas en dos dimensiones simultáneas (filas y columnas).

---

## 🤖 8. PENSAMIENTO CRÍTICO PARA USAR INTELIGENCIA ARTIFICIAL
* **ID Platzi:** 13070 | **Tema Central:** Ética, Verificación y Sesgos en LLMs

### 🧠 Conceptos Esenciales de Examen:
* **Alucinaciones en Modelos de Lenguaje (LLMs):**
  * Fenómeno donde un modelo genera información fáctica completamente falsa, inexistente o inventada, pero redactada con tono convincente y gramaticalmente impecable.
  * *Cómo mitigarlas:* Anclaje de contexto (*Grounding*), técnica RAG (proporcionar documentos de referencia) y validación cruzada con fuentes oficiales.
* **Sesgos Algorítmicos (Bias):**
  * Los modelos heredan prejuicios, estereotipos y omisiones presentes en los datos de entrenamiento con los que fueron alimentados.
* **Privacidad y PII (Personally Identifiable Information):**
  * Regla de oro en prompts: **Nunca ingresar credenciales, claves de API, cédulas, números de tarjeta ni datos bancarios de clientes** en interfaces públicas de IA generativa.
* **Verificación Cruzada (Cross-Checking):**
  * La IA debe tratarse como un colaborador novato: todo código generado, query SQL o referencia legal debe ser probado y auditado por un humano antes de pasar a producción (*Human-in-the-Loop*).

---

## 🤖 9. CURSO GRATIS DE INTRODUCCIÓN A LA INTELIGENCIA ARTIFICIAL
* **ID Platzi:** 13690 | **Tema Central:** Fundamentos de IA, Machine Learning y Deep Learning

### 🧠 Conceptos Esenciales de Examen:
* **Jerarquía de Conceptos:**
  * **Inteligencia Artificial (IA):** Ciencia e ingeniería orientada a crear máquinas capaces de imitar funciones cognitivas humanas.
  * **Machine Learning (ML - Aprendizaje Automático):** Subcampo de la IA donde los algoritmos aprenden patrones a partir de datos sin ser programados paso a paso mediante reglas fijas.
  * **Deep Learning (DL - Aprendizaje Profundo):** Subcampo del ML basado en redes neuronales artificiales profundas con múltiples capas intermedias (ocultas).
  * **IA Generativa:** Modelos entrenados para producir nuevo contenido (texto, imágenes, audio, código) basado en patrones aprendidos.
* **Los 3 Paradigmas de Aprendizaje en Machine Learning:**
  1. **Supervisado:** El algoritmo aprende de datos etiquetados (pares entrada-salida). Ejemplos: detección de spam (correo = spam / no spam), regresión de precios de viviendas.
  2. **No Supervisado:** El algoritmo descubre patrones, relaciones y agrupamientos ocultos en datos no etiquetados. Ejemplo: Segmentación de perfiles de clientes (*Clustering*).
  3. **Por Refuerzo (Reinforcement Learning):** Un agente aprende a tomar decisiones dentro de un entorno recibiendo recompensas o castigos. Ejemplo: Agentes que aprenden a jugar videojuegos o conducir vehículos autónomos.
* **Tokens y Parámetros en LLMs:**
  * **Token:** La unidad mínima de texto que procesa un modelo (suele ser aproximadamente 4 caracteres o tres cuartas partes de una palabra).
  * **Parámetros:** Los "pesos" o conexiones internas ajustadas durante el entrenamiento que determinan el conocimiento y comportamiento de la red neuronal.
