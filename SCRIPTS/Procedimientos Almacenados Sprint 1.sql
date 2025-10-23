USE PlataformaAgricola;
GO

-- ==========================================
-- 1️⃣ Registrar Usuario
-- ==========================================
CREATE OR ALTER PROCEDURE sp_RegistrarUsuario
    @nombre NVARCHAR(100),
    @apellidos NVARCHAR(100),
    @dni VARCHAR(20),
    @correo NVARCHAR(150),
    @telefono VARCHAR(20),
    @contrasena NVARCHAR(255),
    @tipo_usuario NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Usuarios (nombre, apellidos, dni, correo, telefono, contrasena, tipo_usuario)
    VALUES (@nombre, @apellidos, @dni, @correo, @telefono, @contrasena, @tipo_usuario);
END;
GO

-- ✅ Ejemplo de prueba
EXEC sp_RegistrarUsuario 
    @nombre = N'Juan',
    @apellidos = N'Ramos',
    @dni = '12345678',
    @correo = N'juanramos@example.com',
    @telefono = '987654321',
    @contrasena = N'hash123456',
    @tipo_usuario = N'Agricultor';

SELECT * FROM Usuarios;
GO



-- ==========================================
-- 2️⃣ Registrar Producto
-- ==========================================
CREATE OR ALTER PROCEDURE sp_RegistrarProducto
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

-- ✅ Ejemplo de prueba
EXEC sp_RegistrarProducto
    @id_agricultor = 1,
    @nombre_producto = N'Papa Andina',
    @descripcion = N'Papa orgánica cultivada en altura',
    @precio = 3.50,
    @stock = 100,
    @unidad_medida = N'Kg',
    @imagen_url = N'https://miplataforma.com/imagenes/papa.jpg';

SELECT * FROM Productos;
GO



-- ==========================================
-- 3️⃣ Registrar Pago
-- ==========================================
CREATE OR ALTER PROCEDURE sp_RegistrarPago
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

-- ✅ Ejemplo de prueba
EXEC sp_RegistrarPago
    @id_comprador = 1,
    @id_producto = 1,
    @monto = 70.00,
    @metodo_pago = N'Transferencia Bancaria';

SELECT * FROM Pagos;
GO



-- ==========================================
-- 4️⃣ Registrar Transferencia
-- ==========================================
CREATE OR ALTER PROCEDURE sp_RegistrarTransferencia
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

-- ✅ Ejemplo de prueba
EXEC sp_RegistrarTransferencia
    @id_pago = 1,
    @codigo_referencia = N'REF-20251018-001',
    @entidad_bancaria = N'Banco de Crédito del Perú',
    @comprobante_url = N'https://miplataforma.com/comprobantes/001.pdf';

SELECT * FROM Transferencias;
GO
