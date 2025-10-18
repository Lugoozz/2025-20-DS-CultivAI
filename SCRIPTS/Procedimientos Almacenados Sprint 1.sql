USE PlataformaAgricola;
GO

-- ==========================================
-- 1️⃣ Registrar Usuario
-- ==========================================
CREATE PROCEDURE sp_RegistrarUsuario
    @nombre NVARCHAR(100),
    @apellido NVARCHAR(100),
    @correo NVARCHAR(150),
    @contrasena_hash NVARCHAR(255),
    @tipo_usuario NVARCHAR(50),
    @dni CHAR(8),
    @telefono NVARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Usuarios (nombre, apellido, correo, contrasena_hash, tipo_usuario, dni, telefono)
    VALUES (@nombre, @apellido, @correo, @contrasena_hash, @tipo_usuario, @dni, @telefono);
END;
GO

EXEC sp_RegistrarUsuario 
    @nombre = 'Juan',
    @apellido = 'Ramos',
    @correo = 'juanramos@example.com',
    @contrasena_hash = 'hash123456',
    @tipo_usuario = 'Agricultor',
    @dni = '12345678',
    @telefono = '987654321';

SELECT * from Usuarios



-- ==========================================
-- 2️⃣ Registrar Producto
-- ==========================================
CREATE PROCEDURE sp_RegistrarProducto
    @id_agricultor INT,
    @nombre_producto NVARCHAR(100),
    @descripcion NVARCHAR(255),
    @precio DECIMAL(10,2),
    @stock INT,
    @unidad_medida NVARCHAR(50),
    @imagen_url NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Productos (id_agricultor, nombre_producto, descripcion, precio, stock, unidad_medida, imagen_url)
    VALUES (@id_agricultor, @nombre_producto, @descripcion, @precio, @stock, @unidad_medida, @imagen_url);
END;
GO


EXEC sp_RegistrarProducto
    @id_agricultor = 1,
    @nombre_producto = 'Papa Andina',
    @descripcion = 'Papa orgánica cultivada en altura',
    @precio = 3.50,
    @stock = 100,
    @unidad_medida = 'Kg',
    @imagen_url = 'https://miplataforma.com/imagenes/papa.jpg';

	SELECT * from Productos


-- ==========================================
-- 3️⃣ Registrar Pago
-- ==========================================
CREATE PROCEDURE sp_RegistrarPago
    @id_comprador INT,
    @id_producto INT,
    @monto DECIMAL(10,2),
    @metodo_pago NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Pagos (id_comprador, id_producto, monto, metodo_pago)
    VALUES (@id_comprador, @id_producto, @monto, @metodo_pago);
END;
GO


EXEC sp_RegistrarPago
    @id_comprador = 1,
    @id_producto = 1,
    @monto = 70.00,
    @metodo_pago = 'Transferencia Bancaria';

SELECT * from Pagos


-- ==========================================
-- 4️⃣ Registrar Transferencia
-- ==========================================
CREATE PROCEDURE sp_RegistrarTransferencia
    @id_pago INT,
    @codigo_referencia NVARCHAR(100),
    @entidad_bancaria NVARCHAR(100),
    @comprobante_url NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Transferencias (id_pago, codigo_referencia, entidad_bancaria, comprobante_url)
    VALUES (@id_pago, @codigo_referencia, @entidad_bancaria, @comprobante_url);
END;
GO

EXEC sp_RegistrarTransferencia
    @id_pago = 2,
    @codigo_referencia = 'REF-20251018-001',
    @entidad_bancaria = 'Banco de Crédito del Perú',
    @comprobante_url = 'https://miplataforma.com/comprobantes/001.pdf';


SELECT * from Transferencias