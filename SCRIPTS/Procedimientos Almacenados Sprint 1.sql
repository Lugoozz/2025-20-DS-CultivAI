-- ========================================
-- 1. Actualizar perfil de usuario
-- ========================================
DROP PROCEDURE IF EXISTS sp_ActualizarPerfil;
DELIMITER //
CREATE PROCEDURE sp_ActualizarPerfil(
    IN p_id_usuario INT,
    IN p_nombre NVARCHAR(100),
    IN p_apellidos NVARCHAR(100),
    IN p_dni CHAR(8),
    IN p_correo NVARCHAR(150),
    IN p_telefono NVARCHAR(15),
    IN p_contrasena NVARCHAR(255)
)
BEGIN
    UPDATE usuarios
    SET nombre = p_nombre,
        apellidos = p_apellidos,
        dni = p_dni,
        correo = p_correo,
        telefono = p_telefono,
        contrasena = p_contrasena
    WHERE id_usuario = p_id_usuario;
END //
DELIMITER ;

-- ========================================
-- 2. Agregar producto al carrito
-- ========================================
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

-- ========================================
-- 3. Buscar pagos por fecha
-- ========================================
DROP PROCEDURE IF EXISTS sp_BuscarPagosPorFecha;
DELIMITER //
CREATE PROCEDURE sp_BuscarPagosPorFecha(
    IN p_id_comprador INT,
    IN p_fecha DATE
)
BEGIN
    SELECT 
        v.id_venta,
        p.nombre_producto,
        d.cantidad,
        p.precio AS precio,
        d.subtotal,
        v.fecha_venta
    FROM ventas v
    INNER JOIN detalleventas d ON v.id_venta = d.id_venta
    INNER JOIN productos p ON d.id_producto = p.id_producto
    WHERE v.id_comprador = p_id_comprador
      AND DATE(v.fecha_venta) = p_fecha
    ORDER BY v.fecha_venta DESC;
END //
DELIMITER ;

-- ========================================
-- 4. Buscar producto por nombre
-- ========================================
DROP PROCEDURE IF EXISTS sp_BuscarProducto;
DELIMITER //
CREATE PROCEDURE sp_BuscarProducto(IN p_nombre VARCHAR(100))
BEGIN
    SELECT id_producto, nombre_producto, precio, stock, unidad_medida
    FROM productos
    WHERE nombre_producto LIKE CONCAT('%', p_nombre, '%');
END //
DELIMITER ;

-- ========================================
-- 5. Buscar ventas por fecha exacta
-- ========================================
DROP PROCEDURE IF EXISTS sp_BuscarVentasPorFechaExacta;
DELIMITER //
CREATE PROCEDURE sp_BuscarVentasPorFechaExacta(
    IN p_id_agricultor INT,
    IN p_fecha DATE
)
BEGIN
    SELECT 
        p.nombre_producto,
        dv.cantidad,
        p.precio,
        dv.subtotal,
        v.fecha_venta
    FROM detalleventas dv
    JOIN ventas v ON dv.id_venta = v.id_venta
    JOIN productos p ON dv.id_producto = p.id_producto
    WHERE p.id_agricultor = p_id_agricultor
      AND DATE(v.fecha_venta) = p_fecha;
END //
DELIMITER ;

-- ========================================
-- 6. Finalizar compra
-- ========================================
DROP PROCEDURE IF EXISTS sp_FinalizarCompra;
DELIMITER //
CREATE PROCEDURE sp_FinalizarCompra(IN p_id_usuario INT)
BEGIN
    DECLARE v_total DECIMAL(10,2);

    SELECT SUM(subtotal) INTO v_total
    FROM Carrito WHERE id_usuario = p_id_usuario;

    INSERT INTO Ventas (id_comprador, total)
    VALUES (p_id_usuario, v_total);

    SET @last_venta_id = LAST_INSERT_ID();

    INSERT INTO DetalleVentas (id_venta, id_producto, cantidad, subtotal)
    SELECT @last_venta_id, id_producto, cantidad, subtotal
    FROM Carrito WHERE id_usuario = p_id_usuario;

    UPDATE Productos p
    JOIN Carrito c ON p.id_producto = c.id_producto
    SET p.stock = p.stock - c.cantidad
    WHERE c.id_usuario = p_id_usuario;

    DELETE FROM Carrito WHERE id_usuario = p_id_usuario;

    SELECT @last_venta_id AS id_venta;
END //
DELIMITER ;

-- ========================================
-- 7. Listar pagos por comprador
-- ========================================
DROP PROCEDURE IF EXISTS sp_ListarPagosPorComprador;
DELIMITER //
CREATE PROCEDURE sp_ListarPagosPorComprador(IN p_id_comprador INT)
BEGIN
    SELECT 
        v.id_venta,
        p.nombre_producto,
        d.cantidad,
        p.precio AS precio,
        d.subtotal,
        v.fecha_venta
    FROM ventas v
    INNER JOIN detalleventas d ON v.id_venta = d.id_venta
    INNER JOIN productos p ON d.id_producto = p.id_producto
    WHERE v.id_comprador = p_id_comprador
    ORDER BY v.fecha_venta DESC;
END //
DELIMITER ;

-- ========================================
-- 8. Listar productos por usuario (agricultor)
-- ========================================
DROP PROCEDURE IF EXISTS sp_ListarProductosPorUsuario;
DELIMITER //
CREATE PROCEDURE sp_ListarProductosPorUsuario(IN p_id_agricultor INT)
BEGIN
    SELECT nombre_producto, precio, stock, unidad_medida
    FROM Productos
    WHERE id_agricultor = p_id_agricultor;
END //
DELIMITER ;

-- ========================================
-- 9. Listar ventas del agricultor
-- ========================================
DROP PROCEDURE IF EXISTS sp_ListarVentasAgricultor;
DELIMITER //
CREATE PROCEDURE sp_ListarVentasAgricultor(IN p_id_agricultor INT)
BEGIN
    SELECT 
        p.nombre_producto AS producto,
        dv.cantidad,
        p.precio AS precio_unitario,
        dv.subtotal,
        v.fecha_venta
    FROM detalleventas dv
    INNER JOIN productos p ON dv.id_producto = p.id_producto
    INNER JOIN ventas v ON dv.id_venta = v.id_venta
    WHERE p.id_agricultor = p_id_agricultor
    ORDER BY v.fecha_venta DESC;
END //
DELIMITER ;

-- ========================================
-- 10. Obtener perfil de usuario
-- ========================================
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

-- ========================================
-- 11. Quitar producto del carrito
-- ========================================
DROP PROCEDURE IF EXISTS sp_QuitarDelCarrito;
DELIMITER //
CREATE PROCEDURE sp_QuitarDelCarrito(
    IN p_id_usuario INT,
    IN p_id_producto INT
)
BEGIN
    DELETE FROM carrito
    WHERE id_usuario = p_id_usuario
      AND id_producto = p_id_producto
    LIMIT 1;
END //
DELIMITER ;

-- ========================================
-- 12. Registrar nuevo producto
-- ========================================
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

-- ========================================
-- 13. Registrar nuevo usuario
-- ========================================
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

-- ========================================
-- 14. Verificar credenciales del usuario
-- ========================================
DROP PROCEDURE IF EXISTS sp_VerificarUsuario;
DELIMITER //
CREATE PROCEDURE sp_VerificarUsuario(
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
END //
DELIMITER ;
