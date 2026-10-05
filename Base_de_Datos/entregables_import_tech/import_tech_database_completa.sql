-- ========================================================================
-- CASO DE ESTUDIO: IMPORT TECH S.A.S.
-- BASE DE DATOS COMPLETA: DDL + DML + VISTAS + PROCEDIMIENTOS + TRIGGERS
-- PROGRAMA: CONSTRUCCIÓN DE BASES DE DATOS CON MYSQL (FICHA 3625806)
-- APRENDIZ: JEISER ABRAHAM GUTIÉRREZ TORRES (C.C. 1000000001)
-- INSTRUCTOR: EWIN MAURICIO ORTIZ LÓPEZ
-- REGIONAL: CENTRO DE GESTIÓN AGROEMPRESARIAL DEL ORIENTE / REGIONAL CESAR
-- MOTOR: MySQL 8.0+ / CHARSET: utf8mb4 / COLLATION: utf8mb4_unicode_ci
-- ========================================================================

DROP DATABASE IF EXISTS import_tech_db;
CREATE DATABASE import_tech_db 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci;

USE import_tech_db;

-- ------------------------------------------------------------------------
-- SECCIÓN 1: DDL — CREACIÓN DE TABLAS Y RESTRICCIONES
-- ------------------------------------------------------------------------

-- 1. Tabla Proveedores
CREATE TABLE proveedores (
  id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
  nit VARCHAR(20) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  calle VARCHAR(50) NOT NULL,
  numero VARCHAR(30) NOT NULL,
  comuna VARCHAR(50) NULL,
  ciudad VARCHAR(50) NOT NULL,
  telefono VARCHAR(25) NOT NULL,
  pagina_web VARCHAR(150) NULL
) ENGINE=InnoDB;

-- 2. Tabla Clientes
CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  documento VARCHAR(20) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  calle VARCHAR(50) NOT NULL,
  numero VARCHAR(30) NOT NULL,
  comuna VARCHAR(50) NULL,
  ciudad VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- 3. Tabla Teléfonos de Clientes (Multi-contacto 1:N)
CREATE TABLE cliente_telefonos (
  id_telefono INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  tipo VARCHAR(20) NOT NULL DEFAULT 'Móvil',
  numero VARCHAR(25) NOT NULL,
  CONSTRAINT fk_telefono_cliente 
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 4. Tabla Categorías
CREATE TABLE categorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL UNIQUE,
  descripcion VARCHAR(255) NULL
) ENGINE=InnoDB;

-- 5. Tabla Productos
CREATE TABLE productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  precio_actual DECIMAL(12,2) NOT NULL,
  stock INT NOT NULL DEFAULT 0,
  id_categoria INT NOT NULL,
  id_proveedor INT NOT NULL,
  CONSTRAINT chk_precio_positivo CHECK (precio_actual > 0),
  CONSTRAINT chk_stock_positivo CHECK (stock >= 0),
  CONSTRAINT fk_producto_categoria 
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_producto_proveedor 
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 6. Tabla Ventas (Facturas)
CREATE TABLE ventas (
  numero_factura VARCHAR(30) NOT NULL PRIMARY KEY,
  fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_cliente INT NOT NULL,
  descuento DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  monto_final DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  CONSTRAINT fk_venta_cliente 
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 7. Tabla Detalle de Ventas (Entidad Asociativa N:M)
CREATE TABLE detalle_ventas (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  numero_factura VARCHAR(30) NOT NULL,
  id_producto INT NOT NULL,
  precio_unitario DECIMAL(12,2) NOT NULL,
  cantidad INT NOT NULL,
  subtotal DECIMAL(12,2) NOT NULL,
  CONSTRAINT chk_cantidad_positiva CHECK (cantidad > 0),
  CONSTRAINT fk_detalle_venta 
    FOREIGN KEY (numero_factura) REFERENCES ventas(numero_factura)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_detalle_producto 
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Índices adicionales para rendimiento
ALTER TABLE productos ADD INDEX idx_producto_categoria (id_categoria);
ALTER TABLE ventas ADD INDEX idx_venta_fecha (fecha);

-- ------------------------------------------------------------------------
-- SECCIÓN 2: DML — INSERCIÓN DE DATOS DE PRUEBA REALISTAS
-- ------------------------------------------------------------------------

-- Inserción de Proveedores
INSERT INTO proveedores (nit, nombre, calle, numero, comuna, ciudad, telefono, pagina_web) VALUES
('900123456-1', 'Mayorista Tecnológico S.A.S.', 'Carrera 43A', '# 14-25', 'El Poblado', 'Medellín', '6044445566', 'https://mayortec.com.co'),
('901987654-2', 'Componentes del Caribe Ltda.', 'Calle 72', '# 54-108', 'Norte', 'Barranquilla', '6053332211', 'https://compocaribe.com'),
('890555444-3', 'Distribuciones Bogotá Tech', 'Avenida El Dorado', '# 68C-61', 'Fontibón', 'Bogotá', '6017778899', 'https://bogotatech.com.co');

-- Inserción de Clientes
INSERT INTO clientes (documento, nombre, calle, numero, comuna, ciudad) VALUES
('1000000001', 'Carlos Mendoza Silva', 'Calle 10', '# 70A Sur - 35', 'La Triana', 'La Estrella'),
('1000000002', 'Johana Gutiérrez Torres', 'Calle 50', '# 45-20', 'Centro', 'Medellín'),
('1000000003', 'Sofía Ramírez Restrepo', 'Circular 4', '# 73-12', 'Laureles', 'Medellín');

-- Inserción de Teléfonos de Clientes
INSERT INTO cliente_telefonos (id_cliente, tipo, numero) VALUES
(1, 'Móvil', '3000000001'),
(1, 'Oficina', '6040000001'),
(2, 'Móvil', '3000000002'),
(3, 'Móvil', '3000000003');

-- Inserción de Categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Portátiles y Laptops', 'Equipos portátiles para oficina, educación y alto rendimiento gaming'),
('Unidades de Almacenamiento', 'Discos de estado sólido SSD NVMe, SATA y discos mecánicos externos'),
('Memorias RAM', 'Módulos de memoria DDR4 y DDR5 para estaciones y portátiles'),
('Periféricos y Accesorios', 'Teclados mecánicos, ratones ópticos, diademas y monitores');

-- Inserción de Productos
INSERT INTO productos (nombre, precio_actual, stock, id_categoria, id_proveedor) VALUES
('Portátil ASUS Vivobook 15 Core i5 16GB SSD 512GB', 2850000.00, 18, 1, 1),
('Portátil Lenovo ThinkPad E14 Ryzen 7 16GB SSD 1TB', 3950000.00, 10, 1, 3),
('SSD Kingston NV2 1TB PCIe 4.0 NVMe M.2', 320000.00, 45, 2, 2),
('SSD Crucial P3 Plus 2TB PCIe 4.0 NVMe', 580000.00, 22, 2, 2),
('Memoria RAM Corsair Vengeance 16GB DDR4 3200MHz', 195000.00, 35, 3, 1),
('Memoria RAM Kingston Fury Beast 32GB DDR5 5600MHz', 460000.00, 15, 3, 1),
('Monitor Gamer LG UltraGear 24" IPS 144Hz', 780000.00, 12, 4, 3);

-- ------------------------------------------------------------------------
-- SECCIÓN 3: OBJETOS PROGRAMABLES (VISTAS, PROCEDIMIENTOS Y TRIGGERS)
-- ------------------------------------------------------------------------

-- 1. Trigger de actualización automática de inventario
DELIMITER //
CREATE TRIGGER trg_descontar_stock_venta
AFTER INSERT ON detalle_ventas
FOR EACH ROW
BEGIN
  UPDATE productos
  SET stock = stock - NEW.cantidad
  WHERE id_producto = NEW.id_producto;
END //
DELIMITER ;

-- 2. Inserción de Ventas (dispara el trigger automáticamente)
INSERT INTO ventas (numero_factura, fecha, id_cliente, descuento, monto_final) VALUES
('FACT-2026-001', '2026-10-01 10:15:00', 1, 50000.00, 3120000.00),
('FACT-2026-002', '2026-10-01 15:30:00', 2, 0.00, 390000.00);

INSERT INTO detalle_ventas (numero_factura, id_producto, precio_unitario, cantidad, subtotal) VALUES
('FACT-2026-001', 1, 2850000.00, 1, 2850000.00),
('FACT-2026-001', 3, 320000.00, 1, 320000.00),
('FACT-2026-002', 5, 195000.00, 2, 390000.00);

-- 3. Vista de Reporte de Ventas Detalladas
CREATE OR REPLACE VIEW v_resumen_ventas_productos AS
SELECT 
  v.numero_factura,
  v.fecha,
  c.documento AS doc_cliente,
  c.nombre AS cliente,
  p.nombre AS producto,
  cat.nombre AS categoria,
  d.cantidad,
  d.precio_unitario,
  d.subtotal
FROM detalle_ventas d
INNER JOIN ventas v ON d.numero_factura = v.numero_factura
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON d.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria;

-- 4. Procedimiento Almacenado Transaccional
DELIMITER //
CREATE PROCEDURE sp_registrar_factura(
  IN p_factura VARCHAR(30),
  IN p_cliente INT,
  IN p_descuento DECIMAL(10,2),
  IN p_total DECIMAL(12,2)
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;
    INSERT INTO ventas (numero_factura, fecha, id_cliente, descuento, monto_final)
    VALUES (p_factura, NOW(), p_cliente, p_descuento, p_total);
  COMMIT;
END //
DELIMITER ;
