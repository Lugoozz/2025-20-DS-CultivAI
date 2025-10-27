-- =============================
-- CREACIÓN DE LA BASE DE DATOS (MySQL)
-- =============================
use master
use plataformaagricola
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
    tipo_usuario NVARCHAR(50) sp_FinalizarCompraNOT NULL, -- Agricultor o Comprador
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
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    unidad_medida NVARCHAR(50),
    fecha_publicacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_agricultor) REFERENCES Usuarios(id_usuario)
);




CREATE TABLE carrito (
    id_carrito INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_comprador INT NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado NVARCHAR(50) DEFAULT 'Procesando',
    FOREIGN KEY (id_comprador) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE DetalleVentas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Obtener datos del usuario



DROP PROCEDURE IF EXISTS sp_ObtenerPerfilUsuario;
DELIMITER //
CREATE PROCEDURE sp_ObtenerPerfilUsuario(IN p_id_usuario INT)
BEGIN
    SELECT 
        nombre,
        apellidos,
        dni,
        correo,
        telefono,
        contrasena
    FROM usuarios
    WHERE id_usuario = p_id_usuario;
END //
DELIMITER ;



select * from ventas;
select * from detalleventas;
select * from pagos;
select * from usuarios;




