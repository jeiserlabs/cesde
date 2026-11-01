# Taller INNER JOIN y GROUP BY — Nike (30-oct-2026)

> **Fuente:** `Taller_INNER_JOIN_GROUP_BY_Jeiser_Gutierrez.pdf` (8 páginas).
> **Original:** [Drive — 02_Taller_BD_INNER_JOIN](https://drive.google.com/drive/folders/1NYRE6IuUXE9QtAir5B2OZ9I9J5rPGiqQ).
> **Nota:** transcripción íntegra del PDF para estudio y búsqueda; la cédula fue enmascarada por privacidad. El PDF conserva el formato y las tablas originales.

---

```text
CENTRO DE ESTUDIOS ESPECIALIZADOS — CESDE

                                   ESCUELA DE TECNOLOGÍAS Y COMUNICACIONES
                                 Técnico Laboral como Asistente en Desarrollo de Software

          INFORME TÉCNICO Y SOLUCIONARIO:
TALLER INNER JOIN Y GROUP BY — BASE DE DATOS

                                   NIKE

     Resolución justificada de consultas relacionales, funciones de agregación y filtrado de grupos
                                                     en Microsoft SQL Server

                                                  Momento 3 — Jornada Sábados (Semana 12)

Estudiante: Jeiser Abraham Gutiérrez Torres                                          Identificación: C.C. [dato privado en el PDF original]
Docente Titular: Ing. Jonathan Felipe Piedrahita Nieto                               Asignatura: Gestión de Bases de Datos
Grupo: Aula 406                                                                      Entregable Oficial: 10 Consultas T-SQL Verificadas

MEDELLÍN, ANTIOQUIA — OCTUBRE DE 2026

1. INTRODUCCIÓN Y MARCO METODOLÓGICO

El presente informe técnico consolida la resolución justificada del taller práctico de INNER JOIN y GROUP BY sobre el modelo relacional Nike en
Microsoft SQL Server. Cada una de las diez consultas fue diseñada atendiendo a las pautas de integridad referencial, estandarización de aliases y
evaluación lógica de consultas (Silberschatz et al., 2020).

   Orden Lógico de Ejecución en SQL Server (T-SQL):
   FROM & INNER JOIN (ensamble relacional) ➔ WHERE (filtro de filas) ➔ GROUP BY (conformación de grupos) ➔ HAVING (filtro de agregados) ➔ SELECT
   (proyección y aliases) ➔ ORDER BY (ordenamiento final).

1.1 Arquitectura de la Base de Datos Nike

Tabla         Filas  Clave Primaria                                                  Descripción y Relación Clave
Clientes      100    ClienteID
                                                                                     Maestro de compradores con ubicación geográfica. Relación 1:N con Ventas.
Productos     100    ProductoID                                                      Catálogo con categoría, marca, precio y costo. Relación 1:N con Detalle e
                                                                                     Inventario.
Inventario    100    InventarioID                                                    Stock por bodega física (Principal / Secundaria) para cada producto.
                                                                                     Cabecera transaccional (fecha, método de pago, estado). ClienteID nullable
Ventas        100    VentaID                                                         (consumidor final).
                                                                                     Líneas de detalle con cantidad, precio unitario y porcentaje de descuento
DetalleVenta  100    DetalleID                                                       pactado.

2. SOLUCIONARIO TÉCNICO DETALLADO (10/10 EJERCICIOS)

EJERCICIO 01 Ventas por ciudad                                                                                                                 Básico

Enunciado: Muestre cuántas ventas se han hecho en cada ciudad, según la ciudad del cliente. Ordene de la ciudad con más ventas a la de menos.
 Tablas: Clientes (c) · Ventas (v) | Comprobación: 7 filas devueltas (Coincidencia 100%)

SELECT c.Ciudad,
           COUNT(v.VentaID) AS CantidadVentas

FROM Clientes AS c
INNER JOIN Ventas AS v

             ON v.ClienteID = c.ClienteID
GROUP BY c.Ciudad
ORDER BY CantidadVentas DESC;

Ciudad                                                                                         Ventas
Medellín                                                                                       28
Bogotá                                                                                         19
Bello                                                                                          13
Envigado                                                                                       12
Cali                                                                                           10
Itagüí                                                                                         8
Barranquilla                                                                                   4

 Criterio Técnico:
    El INNER JOIN descarta automáticamente las ventas a consumidor final (ClienteID NULL).
    COUNT(v.VentaID) cuantifica transacciones efectivas agrupadas bajo la clave c.Ciudad.

EJERCICIO 02 Unidades por categoría                                                                                                            Básico

Enunciado: Muestre cuántas unidades se han vendido de cada categoría de producto (suma de la columna Cantidad).
 Tablas: DetalleVenta (d) · Productos (p) | Comprobación: 5 filas devueltas (Coincidencia 100%)

SELECT p.Categoria,
           SUM(d.Cantidad) AS UnidadesVendidas

FROM DetalleVenta AS d
INNER JOIN Productos AS p

             ON p.ProductoID = d.ProductoID
GROUP BY p.Categoria
ORDER BY UnidadesVendidas DESC;

Categoria                                                                            Unidades
Papelería                                                                            64
Alimentos                                                                            47
Tecnología                                                                           43
Hogar                                                                                39
Deportes                                                                             29

Criterio Técnico:
   El enlace conecta cada renglón de detalle con su maestro de producto mediante ProductoID.
   SUM(d.Cantidad) agrega el volumen físico de unidades vendidas por categoría.

EJERCICIO 03 Clientes por método de pago                                                                                       Básico
                                                                                                                         Intermedio
Enunciado: Para cada método de pago muestre el número de ventas y el número de clientes diferentes que lo han usado.

 Tablas: Ventas (v) · Clientes (c) | Comprobación: 4 filas devueltas (Coincidencia 100%)

  SELECT v.MetodoPago,
             COUNT(v.VentaID) AS NumeroVentas,
             COUNT(DISTINCT v.ClienteID) AS ClientesDiferentes

  FROM Ventas AS v
  INNER JOIN Clientes AS c

               ON c.ClienteID = v.ClienteID
  GROUP BY v.MetodoPago
  ORDER BY NumeroVentas DESC;

MetodoPago                                N° Ventas                                               Clientes Únicos
Efectivo                                  33                                                      28
Tarjeta                                   28                                                      20
Transferencia                             19                                                      18
Nequi                                     14                                                      13

Criterio Técnico:
   COUNT(DISTINCT v.ClienteID) computa clientes únicos evitando duplicaciones por recurrencia.
   Agrupación exhaustiva sobre las cuatro modalidades: Efectivo, Tarjeta, Transferencia y Nequi.

EJERCICIO 04 Stock por categoría en bodega Principal

Enunciado: Muestre el stock total y el stock promedio de cada categoría, teniendo en cuenta solo la bodega 'Principal'.
 Tablas: Inventario (i) · Productos (p) | Comprobación: 5 filas devueltas (Coincidencia 100%)

SELECT p.Categoria,
           SUM(i.Stock) AS StockTotal,
           AVG(CAST(i.Stock AS DECIMAL(10,2))) AS StockPromedio

FROM Inventario AS i
INNER JOIN Productos AS p

             ON p.ProductoID = i.ProductoID
WHERE i.Bodega = 'Principal'
GROUP BY p.Categoria
ORDER BY StockTotal DESC;

Categoria      Stock Total                                                           Stock Promedio
Alimentos      1.007                                                                 62,94
Papelería      955                                                                   59,69
Hogar          936                                                                   58,50
Tecnología     878                                                                   54,88
Deportes       617                                                                   38,56

Criterio Técnico:
   WHERE i.Bodega = 'Principal' aplica filtrado previo a la formación de grupos.
   CAST a DECIMAL(10,2) preserva la precisión decimal en SQL Server impidiendo truncamiento entero.

EJERCICIO 05 Marcas con más ingresos (> 500k COP)                                                                                       Intermedio

Enunciado: Calcule el total vendido (con descuento aplicado) por cada marca y muestre solo las marcas que han vendido más de $500.000.

 Tablas: DetalleVenta (d) · Productos (p) | Comprobación: 9 filas devueltas (Coincidencia 100%)

  SELECT p.Marca,
             SUM(d.Cantidad * d.PrecioUnitario * (1 - d.Descuento / 100.0)) AS TotalVendido

  FROM DetalleVenta AS d
  INNER JOIN Productos AS p

               ON p.ProductoID = d.ProductoID
  GROUP BY p.Marca
  HAVING SUM(d.Cantidad * d.PrecioUnitario * (1 - d.Descuento / 100.0)) > 500000
  ORDER BY TotalVendido DESC;

Marca                                              Total Vendido
Oster                                              $3.525.300
Adidas                                             $2.153.050
Genérica                                           $2.000.750
JBL                                                $1.867.400
Redragon                                           $1.098.400
Casio                                              $836.600
Logitech                                           $729.050
Kingston                                           $666.300
Imusa                                              $573.450

Criterio Técnico:
   Fórmula de descuento: Cantidad × PrecioUnitario × (1 − Descuento/100.0) con divisor flotante.
   HAVING filtra agregados post-cálculo; en T-SQL WHERE no puede evaluar expresiones SUM().

EJERCICIO 06 Clientes frecuentes (≥ 3 compras)                                                                                          Intermedio

Enunciado: Muestre el nombre completo y la ciudad de los clientes que tienen 3 compras o más, junto con su número de compras.

 Tablas: Clientes (c) · Ventas (v) | Comprobación: 9 filas devueltas (Coincidencia 100%)

  SELECT c.Nombres + ' ' + c.Apellidos AS NombreCompleto,
             c.Ciudad,
             COUNT(v.VentaID) AS NumeroCompras

  FROM Clientes AS c
  INNER JOIN Ventas AS v

               ON v.ClienteID = c.ClienteID
  GROUP BY c.ClienteID, c.Nombres, c.Apellidos, c.Ciudad
  HAVING COUNT(v.VentaID) >= 3
  ORDER BY NumeroCompras DESC, NombreCompleto;

Cliente                                                                              Ciudad       Compras
Juliana Martínez Gómez                                                               Bello        4
Valentina Castaño Rodríguez                                                          Envigado     4
Alejandro Giraldo Castaño                                                            Medellín     3
Ana Mejía Álvarez                                                                    Cali         3
David Arango Castaño                                                                 Medellín     3
Miguel García Hernández                                                              Bogotá       3
Miguel Rojas Muñoz                                                                   Bello        3
Natalia Mejía Álvarez                                                                Envigado     3
Sebastián Ramírez Zapata                                                             Itagüí       3

 Criterio Técnico:
    Concatenación estándar T-SQL sobre campos obligatorios (NOT NULL).
    GROUP BY incluye ClienteID garantizando granularidad ante eventuales homónimos.

EJERCICIO 07 Ventas pagadas por mes (Cronológico)                                                                                   Intermedio

Enunciado: Muestre el total vendido en ventas con estado 'Pagada' para cada año y mes, en orden cronológico. Use YEAR() y MONTH().
 Tablas: Ventas (v) · DetalleVenta (d) | Comprobación: 14 filas devueltas (Coincidencia 100%)

SELECT YEAR(v.FechaVenta) AS Anio,
           MONTH(v.FechaVenta) AS Mes,
           SUM(d.Cantidad * d.PrecioUnitario * (1 - d.Descuento / 100.0)) AS TotalVendido

FROM Ventas AS v
INNER JOIN DetalleVenta AS d

             ON d.VentaID = v.VentaID
WHERE v.Estado = 'Pagada'
GROUP BY YEAR(v.FechaVenta), MONTH(v.FechaVenta)
ORDER BY Anio, Mes;

Año         Mes  Total                                 Año                                 Mes      Total
2.025                                                                                               $1.589.450
2.025       7    $1.734.725                            2.026                               2        $904.900
2.025                                                                                               $676.250
2.025       8    $1.590.850                            2.026                               3        $2.626.650
2.025                                                                                               $1.228.100
2.025       9    $53.800                               2.026                               4        $1.111.850
2.026                                                                                               $236.225
            10   $860.650                              2.026                               5

            11   $780.600                              2.026                               6

            12   $1.559.900                            2.026                               8

            1    $610.600                              2.026                               9

Criterio Técnico:
   Filtro de negocio en WHERE (v.Estado = 'Pagada') previo a la agrupación temporal.
   YEAR() y MONTH() estructuran la serie cronológica multi-anual de ventas confirmadas.

EJERCICIO 08 Ganancia por categoría en ventas pagadas                                                                               Avanzado

Enunciado: Calcule la ganancia de cada categoría en ventas pagadas: por cada línea, (precio con descuento − costo del producto) × cantidad. Muestre
también cuántas líneas de venta tiene cada categoría.

 Tablas: Ventas (v) · DetalleVenta (d) · Productos (p) | Comprobación: 5 filas devueltas (Coincidencia 100%)

SELECT p.Categoria,
           SUM((d.PrecioUnitario * (1 - d.Descuento / 100.0) - p.Costo) * d.Cantidad) AS Ganancia,
           COUNT(*) AS LineasVenta

FROM Ventas AS v
INNER JOIN DetalleVenta AS d

             ON d.VentaID = v.VentaID
INNER JOIN Productos AS p

             ON p.ProductoID = d.ProductoID
WHERE v.Estado = 'Pagada'
GROUP BY p.Categoria
ORDER BY Ganancia DESC;

Categoria                    Margen Neto                                                            Líneas
Tecnología                   $1.864.350                                                             22
Hogar                        $1.440.100                                                             18
Deportes                     $1.198.350                                                             13
Papelería                    $602.525                                                               24
Alimentos                    $126.025                                                               17

Criterio Técnico:
   Resta de margen unitario neto multiplicada por volumen por cada línea transaccional.
   COUNT(*) mide la frecuencia transaccional por categoría en operaciones liquidadas.

EJERCICIO 09 Top 3 ciudades con mayor gasto                                                                                     Avanzado

Enunciado: Muestre las 3 ciudades cuyos clientes han gastado más dinero en total, con el valor gastado.

 Tablas: Clientes (c) · Ventas (v) · DetalleVenta (d) | Comprobación: 3 filas devueltas (Coincidencia 100%)

  SELECT TOP 3 c.Ciudad,
             SUM(d.Cantidad * d.PrecioUnitario * (1 - d.Descuento / 100.0)) AS TotalGastado

  FROM Clientes AS c
  INNER JOIN Ventas AS v

               ON v.ClienteID = c.ClienteID
  INNER JOIN DetalleVenta AS d

               ON d.VentaID = v.VentaID
  GROUP BY c.Ciudad
  ORDER BY TotalGastado DESC;

Ciudad                                             Total Gastado
Medellín                                           $4.076.500
Bogotá                                             $2.933.825
Bello                                              $2.353.500

Criterio Técnico:
   Join encadenado tripartito: Clientes ➔ Ventas ➔ DetalleVenta.
   Cláusula TOP 3 limitando el ranking tras ordenamiento descendente por TotalGastado.

EJERCICIO 10 Categorías por ciudad (≥ 5 unidades)                                                                               Avanzado

Enunciado: Uniendo las 4 tablas de ventas, muestre cuántas unidades de cada categoría se han vendido en cada ciudad. Muestre solo las combinaciones
ciudad–categoría con 5 unidades o más.

 Tablas: Clientes · Ventas · DetalleVenta · Productos | Comprobación: 20 filas devueltas (Coincidencia 100%)

SELECT c.Ciudad,
           p.Categoria,
           SUM(d.Cantidad) AS Unidades

FROM Clientes AS c
INNER JOIN Ventas AS v

             ON v.ClienteID = c.ClienteID
INNER JOIN DetalleVenta AS d

             ON d.VentaID = v.VentaID
INNER JOIN Productos AS p

             ON p.ProductoID = d.ProductoID
GROUP BY c.Ciudad, p.Categoria
HAVING SUM(d.Cantidad) >= 5
ORDER BY c.Ciudad, Unidades DESC;

Ciudad        Categoría                            Unid.                             Ciudad                  Categoría   Unid.
Barranquilla  Papelería                            5                                 Envigado                Hogar       10
Bello         Papelería                            20                                Envigado                Alimentos   7
Bello         Alimentos                            11                                Envigado                Tecnología  6
Bello         Tecnología                           9                                 Envigado                Papelería   5
Bogotá        Deportes                             10                                Itagüí                  Alimentos   5
Bogotá        Hogar                                8                                 Medellín                Alimentos   17
Bogotá        Tecnología                           7                                 Medellín                Hogar       14
Bogotá        Alimentos                            5                                 Medellín                Papelería   13
Cali          Papelería                            9                                 Medellín                Deportes    8
Cali          Deportes                             5                                 Medellín                Tecnología  6

Criterio Técnico:
   Travesía relacional completa uniendo las 4 tablas transaccionales y maestras.
   HAVING SUM(d.Cantidad) >= 5 descarta combinaciones de baja rotación en destino.

3. MATRIZ DE VERIFICACIÓN Y CONCLUSIONES TÉCNICAS

La totalidad de las diez consultas fueron ejecutadas y validadas contra la base de datos de prueba suministrada en clase. A continuación se presenta la
tabla de autocomprobación determinista:

#   Ejercicio                                                                        Filas Esperadas  Filas Obtenidas  Estado

01  Ventas por ciudad                                                                7                7                100% OK

02  Unidades por categoría                                                           5                5                100% OK

03  Clientes por método de pago                                                      4                4                100% OK

04  Stock por categoría en bodega Principal                                          5                5                100% OK

05  Marcas con más ingresos (> 500k COP)                                             9                9                100% OK

06  Clientes frecuentes (≥ 3 compras)                                                9                9                100% OK

07  Ventas pagadas por mes (Cronológico)                                             14               14               100% OK

08  Ganancia por categoría en ventas pagadas                                         5                5                100% OK

09  Top 3 ciudades con mayor gasto                                                   3                3                100% OK

10  Categorías por ciudad (≥ 5 unidades)                                             20               20               100% OK

Conclusiones de Ingeniería

 Integridad y descartes en INNER JOIN: Al unir Clientes con Ventas, las transacciones asociadas a consumidor final (donde ClienteID IS
 NULL) se excluyen deterministamente, garantizando que los análisis geográficos reflejen únicamente clientes formalmente censados.
 Cálculo aritmético de descuentos y tipos en T-SQL: La división de la tasa porcentual mediante 100.0 y la conversión explícita CAST(Stock AS
 DECIMAL(10,2)) previenen el truncamiento por división entera inherente al motor de SQL Server.
 Distinción semántica WHERE vs HAVING: El filtrado atómico por fila (bodega y estado de venta) se aplicó en WHERE para reducir el cardinal antes
 de la agregación; el filtrado sobre funciones agregadas (ingresos, frecuencias y umbrales de stock) se delegó a HAVING.

4. REFERENCIAS BIBLIOGRÁFICAS (NORMAS APA 7ª EDICIÓN)

Date, C. J. (2019). SQL and relational theory: How to write accurate SQL code (2nd ed.). O'Reilly Media.
Elmasri, R., & Navathe, S. B. (2016). Fundamentals of database systems (7th ed.). Pearson.
Microsoft. (s. f.). GROUP BY (Transact-SQL). Microsoft Learn. Recuperado el 30 de octubre de 2026, del portal oficial de Microsoft Learn (Sección SQL Server

    Queries).
Microsoft. (s. f.). HAVING (Transact-SQL). Microsoft Learn. Recuperado el 30 de octubre de 2026, del portal oficial de Microsoft Learn (Sección SQL Server

    Queries).
Silberschatz, A., Korth, H. F., & Sudarshan, S. (2020). Database system concepts (7th ed.). McGraw-Hill Education.
```
