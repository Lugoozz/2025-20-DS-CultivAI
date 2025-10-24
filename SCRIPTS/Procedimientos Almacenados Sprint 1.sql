USE PlataformaAgricola;

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

-- ✅ Ejemplo de prueba
CALL sp_RegistrarUsuario(
    'Juan',
    'Ramos',
    '123456789',
    'juanramos@example.com',
    '987654321',
    'hash123456',
    'Agricultor'
);

SELECT * FROM Usuarios;


-- ==========================================
-- 2️⃣ Registrar Producto
-- ==========================================
DROP PROCEDURE IF EXISTS sp_RegistrarProducto;
DELIMITER //
CREATE PROCEDURE sp_RegistrarProducto(
    IN p_id_agricultor INT,
    IN p_nombre_producto VARCHAR(100),
    IN p_descripcion VARCHAR(255),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_unidad_medida VARCHAR(50),
    IN p_imagen_url VARCHAR(255)
)
BEGIN
    INSERT INTO Productos (id_agricultor, nombre_producto, descripcion, precio, stock, unidad_medida, imagen_url)
    VALUES (p_id_agricultor, p_nombre_producto, p_descripcion, p_precio, p_stock, p_unidad_medida, p_imagen_url);
END //
DELIMITER ;

-- ✅ Ejemplo de prueba
CALL sp_RegistrarProducto(
    1,
    'Papa Andina',
    'Papa orgánica cultivada en altura',
    3.50,
    100,
    'Kg',
    'https://miplataforma.com/imagenes/papa.jpg'
);

SELECT * FROM Productos;


-- ==========================================
-- 3️⃣ Registrar Pago
-- ==========================================
DROP PROCEDURE IF EXISTS sp_RegistrarPago;
DELIMITER //
CREATE PROCEDURE sp_RegistrarPago(
    IN p_id_comprador INT,
    IN p_id_producto INT,
    IN p_monto DECIMAL(10,2),
    IN p_metodo_pago VARCHAR(50)
)
BEGIN
    INSERT INTO Pagos (id_comprador, id_producto, monto, metodo_pago)
    VALUES (p_id_comprador, p_id_producto, p_monto, p_metodo_pago);
END //
DELIMITER ;

-- ✅ Ejemplo de prueba
CALL sp_RegistrarPago(
    1,
    1,
    70.00,
    'Transferencia Bancaria'
);

SELECT * FROM Pagos;


-- ==========================================
-- 4️⃣ Registrar Transferencia
-- ==========================================
DROP PROCEDURE IF EXISTS sp_RegistrarTransferencia;
DELIMITER //
CREATE PROCEDURE sp_RegistrarTransferencia(
    IN p_id_pago INT,
    IN p_codigo_referencia VARCHAR(100),
    IN p_entidad_bancaria VARCHAR(100),
    IN p_comprobante_url VARCHAR(255)
)
BEGIN
    INSERT INTO Transferencias (id_pago, codigo_referencia, entidad_bancaria, comprobante_url)
    VALUES (p_id_pago, p_codigo_referencia, p_entidad_bancaria, p_comprobante_url);
END //
DELIMITER ;

-- ✅ Ejemplo de prueba
CALL sp_RegistrarTransferencia(
    1,
    'REF-20251018-001',
    'Banco de Crédito del Perú',
    'https://miplataforma.com/comprobantes/001.pdf'
);

SELECT * FROM Transferencias;


-- ==========================================
-- 5️⃣ Verificar Usuario
-- ==========================================
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

