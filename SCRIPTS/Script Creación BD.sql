CREATE DATABASE IF NOT EXISTS plataformaagricola;
USE plataformaagricola;

-- ===========================
-- Tabla: usuarios
-- ===========================
DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  dni VARCHAR(20) NOT NULL UNIQUE,
  correo VARCHAR(150) NOT NULL UNIQUE,
  telefono VARCHAR(20) NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  tipo_usuario VARCHAR(50) NOT NULL,
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
  estado TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO usuarios VALUES
(1,'Alex Lugo','Ayala','12345678','alex@gmail.com','999999999','root123','admin','2025-10-23 21:49:24',1),
(3,'Diana','Bonilla','70010314','bonilla@gmail.com','999919999','123','Agricultor','2025-10-23 21:53:12',1),
(6,'Juan','Perez Lopez','12345699','agricultor@gmail.com','987654321','12345','Agricultor','2025-10-23 22:03:16',1),
(7,'Maria','Gomez Torres','87654111','comprador@gmail.com','912345678','54321','Comprador','2025-10-23 22:03:16',1),
(8,'James','Lugo Ayala','60010415','a12@gmail.com','935196040','perra','Agricultor','2025-10-23 23:08:01',1),
(9,'Jose','Rojas Quispe','11111111','c@gmail.com','999999999','123','Comprador','2025-10-26 00:43:29',1),
(10,'SS','SS','99900012','prueba','999999999','123','Agricultor','2025-10-30 01:01:58',1),
(11,'Jennifer','Luz Rojas','12121222','j','999999111','123','Agricultor','2025-10-30 21:06:28',1),
(12,'Marta','Rojas','10101011','marta','999999991','123','Agricultor','2025-10-31 01:42:19',1),
(13,'Mauricio','Segura','90909011','mau','999919999','123','Comprador','2025-10-31 01:42:53',1);

-- ===========================
-- Tabla: productos
-- ===========================
DROP TABLE IF EXISTS productos;
CREATE TABLE productos (
  id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_agricultor INT NOT NULL,
  nombre_producto VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT DEFAULT 0,
  unidad_medida VARCHAR(50),
  fecha_publicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_agricultor) REFERENCES usuarios(id_usuario)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO productos VALUES
(1,1,'Papa Andina',3.50,70,'Kg','2025-10-23 21:54:03'),
(2,8,'Oca',12.30,100,'kg','2025-10-25 00:48:59'),
(3,8,'papaa',3.50,100,'kg','2025-10-25 01:50:39'),
(4,8,'arroz',5.20,70,'kg','2025-10-25 12:20:11'),
(5,8,'zanahoria',2.50,90,'kg','2025-10-25 13:30:41'),
(6,6,'Camote',4.00,80,'kg','2025-10-25 13:32:56'),
(7,8,'Mote',7.20,60,'kg','2025-10-25 15:26:47'),
(8,8,'Alberja',3.00,100,'kg','2025-10-30 21:17:33'),
(9,12,'leche',5.00,90,'Lt','2025-10-31 01:43:30'),
(10,12,'frijoles',7.20,90,'kg','2025-10-31 01:43:48'),
(11,8,'soya',10.00,90,'kg','2025-11-01 22:34:00');

-- ===========================
-- Tabla: carrito
-- ===========================
DROP TABLE IF EXISTS carrito;
CREATE TABLE carrito (
  id_carrito INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================
-- Tabla: ventas
-- ===========================
DROP TABLE IF EXISTS ventas;
CREATE TABLE ventas (
  id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_comprador INT NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
  estado VARCHAR(50) DEFAULT 'Procesando',
  FOREIGN KEY (id_comprador) REFERENCES usuarios(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO ventas VALUES
(1,9,65.00,'2025-10-29 01:03:08','Procesando'),
(2,9,35.00,'2025-10-30 00:07:24','Procesando'),
(3,9,72.00,'2025-10-30 20:53:03','Procesando'),
(4,9,52.00,'2025-10-30 22:31:21','Procesando'),
(5,7,52.00,'2025-10-30 22:32:42','Procesando'),
(6,13,122.00,'2025-10-31 01:45:09','Procesando'),
(7,13,100.00,'2025-11-01 22:34:32','Procesando'),
(8,13,52.00,'2025-11-05 23:29:11','Procesando');

-- ===========================
-- Tabla: detalleventas
-- ===========================
DROP TABLE IF EXISTS detalleventas;
CREATE TABLE detalleventas (
  id_detalle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO detalleventas VALUES
(1,1,6,10,40.00),(2,1,5,10,25.00),(3,2,1,10,35.00),
(4,3,7,10,72.00),(5,4,4,10,52.00),(6,5,4,10,52.00),
(7,6,9,10,50.00),(8,6,10,10,72.00),(9,7,11,10,100.00),(10,8,4,10,52.00);
