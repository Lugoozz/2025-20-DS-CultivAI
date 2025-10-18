-- =============================
-- CREACIÓN DE LA BASE DE DATOS (SQL Server)
-- =============================
use master

CREATE DATABASE PlataformaAgricola;
USE PlataformaAgricola;



-- ======================
-- Tabla: Usuarios
-- ======================
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL,
    correo NVARCHAR(150) NOT NULL UNIQUE,
    contrasena_hash NVARCHAR(255) NOT NULL,
    tipo_usuario NVARCHAR(50) NOT NULL, -- Agricultor o Comprador
    dni CHAR(8),
    telefono NVARCHAR(15),
    fecha_registro DATETIME DEFAULT GETDATE(),
    estado BIT DEFAULT 1
);

-- ======================
-- Tabla: Productos
-- ======================
CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    id_agricultor INT NOT NULL,
    nombre_producto NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    unidad_medida NVARCHAR(50),
    imagen_url NVARCHAR(255),
    fecha_publicacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_agricultor) REFERENCES Usuarios(id_usuario)
);

-- ======================
-- Tabla: Pagos
-- ======================
CREATE TABLE Pagos (
    id_pago INT IDENTITY(1,1) PRIMARY KEY,
    id_comprador INT NOT NULL,
    id_producto INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    metodo_pago NVARCHAR(50) NOT NULL,
    estado_pago NVARCHAR(50) DEFAULT 'Pendiente',
    fecha_pago DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_comprador) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- ======================
-- Tabla: Transferencias
-- ======================
CREATE TABLE Transferencias (
    id_transferencia INT IDENTITY(1,1) PRIMARY KEY,
    id_pago INT NOT NULL,
    codigo_referencia NVARCHAR(100),
    entidad_bancaria NVARCHAR(100),
    comprobante_url NVARCHAR(255),
    fecha_transferencia DATETIME DEFAULT GETDATE(),
    estado NVARCHAR(50) DEFAULT 'Procesando',
    FOREIGN KEY (id_pago) REFERENCES Pagos(id_pago)
);


