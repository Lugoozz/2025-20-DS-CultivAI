USE PlataformaAgricola;

select * from productos;
select * from usuarios;
select * from pagos;
select * from transferencias;
ALTER TABLE productos
DROP COLUMN slot_producto;




-- ==========================================
-- 1️⃣ Registrar Usuario
-- ==========================================
DROP PROCEDURE IF EXISTS sp_RegistrarUsuario;
DELIMITER //
CREATE PROCEDURE sp_RegistrarUsuario(
    IN p_nombre VARCHAR(100),
    IN p_apellidos VARCHAR(100),
    IN p_dni VARCHAR(20),
    IN p_correo VARCHAR(150),
    IN p_telefono VARCHAR(20),
    IN p_contrasena VARCHAR(255),
    IN p_tipo_usuario VARCHAR(50)
)
BEGIN
    INSERT INTO Usuarios (nombre, apellidos, dni, correo, telefono, contrasena, tipo_usuario)
    VALUES (p_nombre, p_apellidos, p_dni, p_correo, p_telefono, p_contrasena, p_tipo_usuario);
END //
DELIMITER ;


SELECT * FROM Usuarios;


-- ==========================================
-- 2️⃣ Registrar Producto
-- ==========================================


DROP PROCEDURE IF EXISTS sp_RegistrarProducto;
DELIMITER //
CREATE PROCEDURE sp_RegistrarProducto(
    IN p_id_agricultor INT,
    IN p_nombre_producto VARCHAR(100),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_unidad_medida VARCHAR(50)
)
BEGIN
    INSERT INTO Productos (id_agricultor, nombre_producto, precio, stock, unidad_medida)
    VALUES (p_id_agricultor, p_nombre_producto, p_precio, p_stock, p_unidad_medida);
END //
DELIMITER ;



DELETE FROM Productos;

SELECT * FROM usuarios;
SELECT * FROM Productos;

-- Filtar producto por usuario
DELIMITER //

CREATE PROCEDURE sp_ListarProductosPorUsuario(
    IN p_id_agricultor INT
)
BEGIN
    SELECT nombre_producto, precio, stock, unidad_medida
    FROM Productos
    WHERE id_agricultor = p_id_agricultor;
END //

DELIMITER ;

-- Obtener Perfil de usuario

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







-- 5 Verificar usuario

DELIMITER $$

CREATE PROCEDURE sp_VerificarUsuario (
    IN p_correo NVARCHAR(150),
    IN p_contrasena NVARCHAR(255)
)
BEGIN
    SELECT 
        id_usuario,
        nombre,
        tipo_usuario
    FROM Usuarios
    WHERE correo = p_correo 
      AND contrasena = p_contrasena
      AND estado = 1;
END$$

DELIMITER ;

-- BuscarProducto


DROP PROCEDURE IF EXISTS sp_BuscarProducto;
DELIMITER //
CREATE PROCEDURE sp_BuscarProducto(IN p_nombre VARCHAR(100))
BEGIN
    SELECT id_producto, nombre_producto, precio, stock, unidad_medida
    FROM productos
    WHERE nombre_producto LIKE CONCAT('%', p_nombre, '%');
END //
DELIMITER ;

select * from productos;

-- Agregar al carrito

DROP PROCEDURE IF EXISTS sp_AgregarCarrito;
DELIMITER //
CREATE PROCEDURE sp_AgregarCarrito(
    IN p_id_usuario INT,
    IN p_id_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE precio DECIMAL(10,2);
    
    SELECT p.precio INTO precio
    FROM productos p
    WHERE p.id_producto = p_id_producto;
    
    INSERT INTO carrito(id_usuario, id_producto, cantidad, subtotal)
    VALUES (p_id_usuario, p_id_producto, p_cantidad, (precio * p_cantidad));
END //
DELIMITER ;

select * from usuarios;

SHOW GRANTS FOR CURRENT_USER();

-- Quitar del carrito

DROP PROCEDURE IF EXISTS sp_QuitarDelCarrito;
DELIMITER //
CREATE PROCEDURE sp_QuitarDelCarrito(
    IN p_id_usuario INT,
    IN p_id_producto INT
)
BEGIN
    DELETE FROM carrito 
    WHERE id_usuario = p_id_usuario AND id_producto = p_id_producto;
END 
DELIMITER ;

use plataformaagricola;


-- Finalizar COmpra
DROP PROCEDURE IF EXISTS sp_FinalizarCompra;

DELIMITER //
CREATE PROCEDURE sp_FinalizarCompra(IN p_id_usuario INT)
BEGIN
    DECLARE v_total DECIMAL(10,2);

    -- Calcular total
    SELECT SUM(subtotal) INTO v_total
    FROM Carrito WHERE id_usuario = p_id_usuario;

    -- Insertar venta
    INSERT INTO Ventas (id_comprador, total)
    VALUES (p_id_usuario, v_total);

    -- Obtener id de venta recién generado
    SET @last_venta_id = LAST_INSERT_ID();

    -- Insertar detalle
    INSERT INTO DetalleVentas (id_venta, id_producto, cantidad, subtotal)
    SELECT @last_venta_id, id_producto, cantidad, subtotal
    FROM Carrito WHERE id_usuario = p_id_usuario;

    -- Descontar stock
    UPDATE Productos p
    JOIN Carrito c ON p.id_producto = c.id_producto
    SET p.stock = p.stock - c.cantidad
    WHERE c.id_usuario = p_id_usuario;

    -- Vaciar carrito
    DELETE FROM Carrito WHERE id_usuario = p_id_usuario;

    -- Devolver id de la venta
    SELECT @last_venta_id AS id_venta;
END //
DELIMITER ;


select * from usuarios;



