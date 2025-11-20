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

