CREATE DATABASE  IF NOT EXISTS `plataformaagricola` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plataformaagricola`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: plataformaagricola
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'b361b5a5-b074-11f0-9e6c-025061684b79:1-270';

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventas`
--

DROP TABLE IF EXISTS `detalleventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventas` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalleventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `detalleventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventas`
--

LOCK TABLES `detalleventas` WRITE;
/*!40000 ALTER TABLE `detalleventas` DISABLE KEYS */;
INSERT INTO `detalleventas` VALUES (1,1,6,10,40.00),(2,1,5,10,25.00),(3,2,1,10,35.00),(4,3,7,10,72.00),(5,4,4,10,52.00),(6,5,4,10,52.00),(7,6,9,10,50.00),(8,6,10,10,72.00),(9,7,11,10,100.00),(10,8,4,10,52.00),(11,9,12,10,50.00),(12,9,1,15,52.50),(13,10,1,20,70.00),(14,11,1,18,63.00),(15,12,1,22,77.00),(16,13,1,25,87.50),(17,14,1,20,70.00),(18,15,1,30,105.00),(19,16,1,18,63.00),(20,17,5,20,50.00),(21,18,5,15,37.50),(22,19,5,25,62.50),(23,20,5,30,75.00),(24,21,5,20,50.00),(25,22,5,22,55.00),(26,23,5,28,70.00),(27,24,5,18,45.00),(28,25,4,25,130.00),(29,26,4,20,104.00),(30,27,4,30,156.00),(31,28,4,22,114.40),(32,29,4,18,93.60),(33,30,4,28,145.60),(34,31,4,26,135.20),(35,32,4,20,104.00),(36,33,2,10,123.00),(37,34,2,8,98.40),(38,35,2,12,147.60),(39,36,6,10,40.00),(40,37,6,15,60.00),(41,38,6,12,48.00),(42,39,10,10,72.00),(43,40,10,8,57.60),(44,41,10,12,86.40),(45,42,8,5,15.00),(46,43,8,4,12.00),(47,44,7,5,36.00),(48,45,7,6,43.20);
/*!40000 ALTER TABLE `detalleventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_agricultor` int NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `unidad_medida` varchar(50) DEFAULT NULL,
  `fecha_publicacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producto`),
  KEY `id_agricultor` (`id_agricultor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_agricultor`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'Papa Andina',3.50,70,'Kg','2025-10-23 21:54:03'),(2,8,'Oca',12.30,100,'kg','2025-10-25 00:48:59'),(3,8,'papaa',3.50,100,'kg','2025-10-25 01:50:39'),(4,8,'arroz',5.20,70,'kg','2025-10-25 12:20:11'),(5,8,'zanahoria',2.50,90,'kg','2025-10-25 13:30:41'),(6,6,'Camote',4.00,80,'kg','2025-10-25 13:32:56'),(7,8,'Mote',7.20,60,'kg','2025-10-25 15:26:47'),(8,8,'Alberja',3.00,100,'kg','2025-10-30 21:17:33'),(9,12,'leche',5.00,90,'Lt','2025-10-31 01:43:30'),(10,12,'frijoles',7.20,90,'kg','2025-10-31 01:43:48'),(11,8,'soya',10.00,90,'kg','2025-11-01 22:34:00'),(12,14,'maiz molido',5.00,90,'Kg','2025-11-13 00:29:29');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `tipo_usuario` varchar(50) NOT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Alex Lugo','Ayala','12345678','alex@gmail.com','999999999','root123','admin','2025-10-23 21:49:24',1),(3,'Diana','Bonilla','70010314','bonilla@gmail.com','999919999','123','Agricultor','2025-10-23 21:53:12',1),(6,'Juan','Perez Lopez','12345699','agricultor@gmail.com','987654321','12345','Agricultor','2025-10-23 22:03:16',1),(7,'Maria','Gomez Torres','87654111','comprador@gmail.com','912345678','54321','Comprador','2025-10-23 22:03:16',1),(8,'James','Lugo Ayala','60010415','a12@gmail.com','935196040','perra','Agricultor','2025-10-23 23:08:01',1),(9,'Jose','Rojas Quispe','11111111','c@gmail.com','999999999','123','Comprador','2025-10-26 00:43:29',1),(10,'SS','SS','99900012','prueba','999999999','123','Agricultor','2025-10-30 01:01:58',1),(11,'Jennifer','Luz Rojas','12121222','j','999999111','123','Agricultor','2025-10-30 21:06:28',1),(12,'Marta','Rojas','10101011','marta','999999991','123','Agricultor','2025-10-31 01:42:19',1),(13,'Mauricio','Segura','90909011','mau','999919999','123','Comprador','2025-10-31 01:42:53',1),(14,'prueba 1','aa','9090901','a@gmail.com','999999111','123','Agricultor','2025-11-13 00:28:40',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_comprador` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_venta` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'Procesando',
  PRIMARY KEY (`id_venta`),
  KEY `id_comprador` (`id_comprador`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_comprador`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,9,65.00,'2025-10-29 01:03:08','Procesando'),(2,9,35.00,'2025-10-30 00:07:24','Procesando'),(3,9,72.00,'2025-10-30 20:53:03','Procesando'),(4,9,52.00,'2025-10-30 22:31:21','Procesando'),(5,7,52.00,'2025-10-30 22:32:42','Procesando'),(6,13,122.00,'2025-10-31 01:45:09','Procesando'),(7,13,100.00,'2025-11-01 22:34:32','Procesando'),(8,13,52.00,'2025-11-05 23:29:11','Procesando'),(9,9,50.00,'2025-11-13 00:30:08','Procesando'),(10,9,80.00,'2025-01-10 10:30:00','Procesando'),(11,9,120.00,'2025-01-15 11:10:00','Procesando'),(12,7,45.00,'2025-01-20 12:00:00','Procesando'),(13,13,95.00,'2025-02-01 14:20:00','Procesando'),(14,9,110.00,'2025-02-10 16:40:00','Procesando'),(15,7,65.00,'2025-02-15 17:10:00','Procesando'),(16,13,150.00,'2025-02-20 18:50:00','Procesando'),(17,9,130.00,'2025-03-01 09:30:00','Procesando'),(18,9,95.00,'2025-03-05 10:55:00','Procesando'),(19,7,60.00,'2025-03-10 11:05:00','Procesando'),(20,13,180.00,'2025-04-02 08:20:00','Procesando'),(21,13,175.00,'2025-04-10 09:50:00','Procesando'),(22,9,100.00,'2025-04-15 13:40:00','Procesando'),(23,7,55.00,'2025-04-18 14:20:00','Procesando'),(24,9,140.00,'2025-04-22 15:50:00','Procesando'),(25,7,70.00,'2025-04-25 17:30:00','Procesando'),(26,13,160.00,'2025-04-28 18:10:00','Procesando'),(27,9,150.00,'2025-05-04 10:15:00','Procesando'),(28,7,55.00,'2025-05-06 11:40:00','Procesando'),(29,13,170.00,'2025-05-08 12:55:00','Procesando'),(30,9,130.00,'2025-05-10 14:10:00','Procesando'),(31,7,62.00,'2025-05-12 15:25:00','Procesando'),(32,13,200.00,'2025-05-16 17:00:00','Procesando'),(33,9,120.00,'2025-05-20 18:10:00','Procesando'),(34,7,50.00,'2025-05-22 19:30:00','Procesando'),(35,13,210.00,'2025-05-25 20:45:00','Procesando'),(36,9,95.00,'2025-05-28 09:00:00','Procesando'),(37,7,65.00,'2025-05-30 10:30:00','Procesando'),(38,13,185.00,'2025-06-02 12:10:00','Procesando'),(39,9,140.00,'2025-06-05 13:20:00','Procesando'),(40,7,58.00,'2025-06-07 15:00:00','Procesando'),(41,13,190.00,'2025-06-10 16:30:00','Procesando'),(42,9,150.00,'2025-06-12 17:40:00','Procesando'),(43,7,75.00,'2025-06-15 18:20:00','Procesando'),(44,13,210.00,'2025-06-18 19:50:00','Procesando'),(45,9,120.00,'2025-06-20 20:30:00','Procesando'),(46,7,50.00,'2025-06-22 21:10:00','Procesando'),(47,13,195.00,'2025-06-25 22:00:00','Procesando'),(48,9,135.00,'2025-06-27 23:10:00','Procesando'),(49,7,68.00,'2025-06-29 23:50:00','Procesando');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'plataformaagricola'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_ActualizarPerfil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ActualizarPerfil`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AgregarCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AgregarCarrito`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BuscarPagosPorFecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BuscarPagosPorFecha`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BuscarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BuscarProducto`(IN p_nombre VARCHAR(100))
BEGIN
    SELECT id_producto, nombre_producto, precio, stock, unidad_medida
    FROM productos
    WHERE nombre_producto LIKE CONCAT('%', p_nombre, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BuscarVentasPorFechaExacta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BuscarVentasPorFechaExacta`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_FinalizarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FinalizarCompra`(IN p_id_usuario INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarPagosPorComprador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarPagosPorComprador`(IN p_id_comprador INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarProductosPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarProductosPorUsuario`(
    IN p_id_agricultor INT
)
BEGIN
    SELECT nombre_producto, precio, stock, unidad_medida
    FROM Productos
    WHERE id_agricultor = p_id_agricultor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarVentasAgricultor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarVentasAgricultor`(IN p_id_agricultor INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ObtenerPerfilUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ObtenerPerfilUsuario`(IN p_id_usuario INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ObtenerTodosProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ObtenerTodosProductos`()
BEGIN
    SELECT nombre_producto FROM productos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ObtenerVentasProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ObtenerVentasProducto`(
    IN p_nombre VARCHAR(100)
)
BEGIN
    SELECT 
        IFNULL(SUM(dv.cantidad), 0) AS ventas
    FROM detalleventas dv
    INNER JOIN productos p ON dv.id_producto = p.id_producto
    WHERE p.nombre_producto = p_nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_QuitarDelCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_QuitarDelCarrito`(
    IN p_id_usuario INT,
    IN p_id_producto INT
)
BEGIN
    DELETE FROM carrito
    WHERE id_usuario = p_id_usuario
      AND id_producto = p_id_producto
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegistrarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegistrarProducto`(
    IN p_id_agricultor INT,
    IN p_nombre_producto VARCHAR(100),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT,
    IN p_unidad_medida VARCHAR(50)
)
BEGIN
    INSERT INTO Productos (id_agricultor, nombre_producto, precio, stock, unidad_medida)
    VALUES (p_id_agricultor, p_nombre_producto, p_precio, p_stock, p_unidad_medida);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegistrarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegistrarUsuario`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_VerificarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_VerificarUsuario`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-19 20:43:26
