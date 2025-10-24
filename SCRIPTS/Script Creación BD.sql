-- Crear base de datos
CREATE DATABASE IF NOT EXISTS PlataformaAgricola;
USE PlataformaAgricola;

-- ==========================================
-- Tabla: Usuarios
-- ==========================================
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    correo VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(50) NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado BOOLEAN DEFAULT TRUE
);

-- ==========================================
-- Tabla: Productos
-- ==========================================
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_agricultor INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    unidad_medida VARCHAR(50),
    imagen_url VARCHAR(255),
    fecha_publicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_agricultor) REFERENCES Usuarios(id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ==========================================
-- Tabla: Pagos
-- ==========================================
CREATE TABLE Pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_comprador INT NOT NULL,
    id_producto INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    estado_pago VARCHAR(50) DEFAULT 'Pendiente',
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_comprador) REFERENCES Usuarios(id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ==========================================
-- Tabla: Transferencias
-- ==========================================
CREATE TABLE Transferencias (
    id_transferencia INT AUTO_INCREMENT PRIMARY KEY,
    id_pago INT NOT NULL UNIQUE,
    codigo_referencia VARCHAR(100),
    entidad_bancaria VARCHAR(100),
    comprobante_url VARCHAR(255),
    fecha_transferencia DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50) DEFAULT 'Procesando',
    FOREIGN KEY (id_pago) REFERENCES Pagos(id_pago)
        ON DELETE CASCADE ON UPDATE CASCADE
);
