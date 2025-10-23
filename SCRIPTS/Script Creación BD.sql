USE master;
GO
CREATE DATABASE PlataformaAgricola;
GO
USE PlataformaAgricola;
GO

-- Tabla: Usuarios
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    correo NVARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(50) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE(),
    estado BIT DEFAULT 1
);

-- Tabla: Productos
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

-- Tabla: Pagos
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

-- Tabla: Transferencias
CREATE TABLE Transferencias (
    id_transferencia INT IDENTITY(1,1) PRIMARY KEY,
    id_pago INT NOT NULL UNIQUE,
    codigo_referencia NVARCHAR(100),
    entidad_bancaria NVARCHAR(100),
    comprobante_url NVARCHAR(255),
    fecha_transferencia DATETIME DEFAULT GETDATE(),
    estado NVARCHAR(50) DEFAULT 'Procesando',
    FOREIGN KEY (id_pago) REFERENCES Pagos(id_pago)
);
