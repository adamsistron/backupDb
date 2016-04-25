-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `inventario`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `inventario` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `inventario`;

--
-- Table structure for table `c001t_inventario`
--

DROP TABLE IF EXISTS `c001t_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c001t_inventario` (
  `co_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `co_tienda` int(11) DEFAULT NULL,
  `co_empleado` int(11) DEFAULT NULL,
  `co_turno` int(11) DEFAULT NULL,
  `bo_activo` tinyint(1) DEFAULT '1',
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tx_inventario` varchar(45) DEFAULT NULL,
  `co_inventario_anterior` int(11) DEFAULT NULL,
  PRIMARY KEY (`co_inventario`),
  KEY `fk_c001t_inventario_tienda_idx` (`co_tienda`),
  KEY `fk_c001t_inventario_empleado_idx` (`co_empleado`),
  KEY `fk_c001t_inventario_turno_idx` (`co_turno`),
  CONSTRAINT `fk_c001t_inventario_empleado` FOREIGN KEY (`co_empleado`) REFERENCES `m005t_empleados` (`co_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_c001t_inventario_tienda` FOREIGN KEY (`co_tienda`) REFERENCES `m006t_tiendas` (`co_tienda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_c001t_inventario_turno` FOREIGN KEY (`co_turno`) REFERENCES `m008t_turnos` (`co_turno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c001t_inventario`
--

LOCK TABLES `c001t_inventario` WRITE;
/*!40000 ALTER TABLE `c001t_inventario` DISABLE KEYS */;
INSERT INTO `c001t_inventario` VALUES (4,3,1,1,0,'2015-12-12 02:10:06','20151211-311',NULL),(5,3,1,2,0,'2015-12-12 02:20:09','20151211-312',4),(6,3,1,2,1,'2015-12-12 03:03:03','20151211-312',5);
/*!40000 ALTER TABLE `c001t_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c002t_inventario_detalle`
--

DROP TABLE IF EXISTS `c002t_inventario_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c002t_inventario_detalle` (
  `co_inventario_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `co_inventario` int(11) NOT NULL,
  `co_producto` int(11) NOT NULL,
  `nu_valor_producto` int(11) NOT NULL,
  `nu_anterior` int(11) NOT NULL,
  `nu_entrada` int(11) NOT NULL,
  `nu_saldo` int(11) NOT NULL,
  `nu_salida` int(11) NOT NULL,
  `nu_subtotal` int(11) NOT NULL,
  `nu_efectivo_recibido` int(11) NOT NULL,
  `nu_total` int(11) NOT NULL,
  `nu_diferencia` int(11) NOT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`co_inventario_detalle`),
  KEY `fk_c001t_inventario_producto_idx` (`co_producto`),
  KEY `fk_c002t_inventario_detalle_inventario_idx` (`co_inventario`),
  CONSTRAINT `fk_c001t_inventario_producto` FOREIGN KEY (`co_producto`) REFERENCES `m003t_productos` (`co_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c002t_inventario_detalle`
--

LOCK TABLES `c002t_inventario_detalle` WRITE;
/*!40000 ALTER TABLE `c002t_inventario_detalle` DISABLE KEYS */;
INSERT INTO `c002t_inventario_detalle` VALUES (1,4,12,600,600,600,1111,600,53400,11111,110738,-99627,'2015-12-11 13:42:00'),(2,4,8,100,100,100,111,100,8900,11111,110738,-99627,'2015-12-11 13:42:00'),(3,4,7,150,150,150,111,150,28350,11111,110738,-99627,'2015-12-11 13:42:00'),(4,4,6,120,120,120,111,120,15480,11111,110738,-99627,'2015-12-11 13:42:00'),(5,4,10,12,12,12,11,12,156,11111,110738,-99627,'2015-12-11 13:42:00'),(6,4,2,1,1,1,1,1,1,11111,110738,-99627,'2015-12-11 13:42:00'),(7,4,13,1,1,1,1,1,1,11111,110738,-99627,'2015-12-11 13:42:00'),(8,4,11,50,50,50,11,50,4450,11111,110738,-99627,'2015-12-11 13:42:00'),(9,5,12,600,600,600,1,600,719400,1111111,818058,293053,'2015-12-11 13:42:00'),(10,5,8,100,100,100,1,100,19900,1111111,818058,293053,'2015-12-11 13:42:00'),(11,5,7,150,150,150,1,150,44850,1111111,818058,293053,'2015-12-11 13:42:00'),(12,5,6,120,120,120,1,120,28680,1111111,818058,293053,'2015-12-11 13:42:00'),(13,5,10,12,12,12,1,12,276,1111111,818058,293053,'2015-12-11 13:42:00'),(14,5,2,1,1,1,1,1,1,1111111,818058,293053,'2015-12-11 13:42:00'),(15,5,13,1,1,1,1,1,1,1111111,818058,293053,'2015-12-11 13:42:00'),(16,5,11,50,50,50,1,50,4950,1111111,818058,293053,'2015-12-11 13:42:00');
/*!40000 ALTER TABLE `c002t_inventario_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c003t_entradas`
--

DROP TABLE IF EXISTS `c003t_entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c003t_entradas` (
  `co_entrada` int(11) NOT NULL AUTO_INCREMENT,
  `co_producto` int(11) NOT NULL,
  `co_inventario` int(11) NOT NULL,
  `nu_cantidad` int(11) NOT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`co_entrada`),
  KEY `fk_coo3t_entradas_producto_idx` (`co_producto`),
  KEY `fk_coo3t_entradas_inventario_idx` (`co_inventario`),
  CONSTRAINT `fk_coo3t_entradas_producto` FOREIGN KEY (`co_producto`) REFERENCES `m003t_productos` (`co_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c003t_entradas`
--

LOCK TABLES `c003t_entradas` WRITE;
/*!40000 ALTER TABLE `c003t_entradas` DISABLE KEYS */;
INSERT INTO `c003t_entradas` VALUES (3,7,6,120,'2015-12-11 14:42:00'),(4,7,6,300,'2015-12-11 15:42:00');
/*!40000 ALTER TABLE `c003t_entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c004t_efectivo_recibido`
--

DROP TABLE IF EXISTS `c004t_efectivo_recibido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c004t_efectivo_recibido` (
  `co_efectivo_recibido` int(11) NOT NULL AUTO_INCREMENT,
  `co_inventario` int(11) NOT NULL,
  `tx_efectivo_recibido` varchar(45) NOT NULL,
  `nu_monto` int(11) NOT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`co_efectivo_recibido`),
  KEY `fk_c004_efectivo_recibido_inventario_idx` (`co_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c004t_efectivo_recibido`
--

LOCK TABLES `c004t_efectivo_recibido` WRITE;
/*!40000 ALTER TABLE `c004t_efectivo_recibido` DISABLE KEYS */;
INSERT INTO `c004t_efectivo_recibido` VALUES (3,5,'QQQQ',1111111,'2015-12-12 01:42:00');
/*!40000 ALTER TABLE `c004t_efectivo_recibido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('e2231802603636e100049d5fad61e582','127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0',1449971188,''),('feff6f6931a5ed9707acf98a98a6d65c','127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:42.0) Gecko/20100101 Firefox/42.0',1449940823,'a:4:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:1:\"2\";s:8:\"username\";s:4:\"adam\";s:6:\"status\";s:1:\"1\";}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m001t_empresas`
--

DROP TABLE IF EXISTS `m001t_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m001t_empresas` (
  `co_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `tx_empresa` varchar(45) NOT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`co_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m001t_empresas`
--

LOCK TABLES `m001t_empresas` WRITE;
/*!40000 ALTER TABLE `m001t_empresas` DISABLE KEYS */;
INSERT INTO `m001t_empresas` VALUES (10,'MOVISTAR','2015-12-04 02:40:17'),(11,'MOVILNET','2015-12-06 00:14:02'),(12,'DIGITEL','2015-12-06 00:14:07'),(16,'DIRECTV','2015-12-04 02:11:58'),(20,'BIGOTT','2015-12-05 15:42:00'),(21,'ISME','2015-12-11 10:42:00');
/*!40000 ALTER TABLE `m001t_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m002t_proveedores`
--

DROP TABLE IF EXISTS `m002t_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m002t_proveedores` (
  `co_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `tx_proveedor` varchar(45) NOT NULL,
  `fe_created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`co_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m002t_proveedores`
--

LOCK TABLES `m002t_proveedores` WRITE;
/*!40000 ALTER TABLE `m002t_proveedores` DISABLE KEYS */;
INSERT INTO `m002t_proveedores` VALUES (2,'MOVILCARD','2015-11-22 13:41:00'),(3,'POLAR','2015-11-22 08:41:00'),(4,'CARESTE','2015-12-05 15:42:00'),(5,'PEPITO','2015-12-05 15:42:00');
/*!40000 ALTER TABLE `m002t_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m003t_productos`
--

DROP TABLE IF EXISTS `m003t_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m003t_productos` (
  `co_producto` int(11) NOT NULL AUTO_INCREMENT,
  `tx_producto` varchar(45) NOT NULL,
  `co_empresa` int(11) NOT NULL,
  `co_proveedor` int(11) NOT NULL,
  `nu_valor_producto` int(11) NOT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bo_activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`co_producto`),
  KEY `fk_m003t_productos_1_idx` (`co_empresa`),
  KEY `fk_m003t_productos_proveedor_idx` (`co_proveedor`),
  CONSTRAINT `fk_m003t_productos_empresa` FOREIGN KEY (`co_empresa`) REFERENCES `m001t_empresas` (`co_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_m003t_productos_proveedor` FOREIGN KEY (`co_proveedor`) REFERENCES `m002t_proveedores` (`co_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m003t_productos`
--

LOCK TABLES `m003t_productos` WRITE;
/*!40000 ALTER TABLE `m003t_productos` DISABLE KEYS */;
INSERT INTO `m003t_productos` VALUES (2,'RECARGA',10,2,1,'2015-12-11 22:19:16',1),(6,'UNICA',11,2,120,'2015-12-11 22:19:07',1),(7,'UNICA',11,2,150,'2015-12-11 22:19:02',1),(8,'XCRIBE',12,2,100,'2015-12-11 22:18:58',1),(10,'ACEITE',10,3,12,'2015-12-11 20:14:16',1),(11,'TELPAGO',10,4,50,'2015-12-11 22:19:21',1),(12,'BELMONT GRANDE',20,2,600,'2015-12-11 21:02:59',1),(13,'RECARGA MOVISTAR',10,2,1,'2015-12-11 20:33:30',1);
/*!40000 ALTER TABLE `m003t_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m004t_cuentas_bancarias`
--

DROP TABLE IF EXISTS `m004t_cuentas_bancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m004t_cuentas_bancarias` (
  `co_cuenta_bancaria` int(11) NOT NULL,
  `tx_tipo_cuenta_bancaria` varchar(45) NOT NULL,
  `tx_banco` varchar(45) NOT NULL,
  `nu_numero_cuenta_bancaria` varchar(20) NOT NULL,
  `co_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`co_cuenta_bancaria`),
  KEY `fk_m004t_cuentas_bancarias_proveedor_idx` (`co_proveedor`),
  CONSTRAINT `fk_m004t_cuentas_bancarias_proveedor` FOREIGN KEY (`co_proveedor`) REFERENCES `m002t_proveedores` (`co_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m004t_cuentas_bancarias`
--

LOCK TABLES `m004t_cuentas_bancarias` WRITE;
/*!40000 ALTER TABLE `m004t_cuentas_bancarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `m004t_cuentas_bancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m005t_empleados`
--

DROP TABLE IF EXISTS `m005t_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m005t_empleados` (
  `co_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `tx_empleado` varchar(45) NOT NULL,
  `nu_cedula` varchar(45) NOT NULL,
  `tx_telefono` varchar(45) DEFAULT NULL,
  `tx_direccion` varchar(45) DEFAULT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bo_activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`co_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m005t_empleados`
--

LOCK TABLES `m005t_empleados` WRITE;
/*!40000 ALTER TABLE `m005t_empleados` DISABLE KEYS */;
INSERT INTO `m005t_empleados` VALUES (1,'ADAM','18269328','04242687847','CHARALLAVE','2015-11-22 16:00:37',NULL),(3,'GLORIA','12300139','04142700815','SANTA TERESA DEL TUY','2015-11-22 15:41:00',NULL),(4,'ANGIE','13432456','04141112233','LOZADA','2015-12-11 17:36:48',NULL),(5,'YOLBER','1234568','02124320062','LOZADA','2015-12-11 17:36:26',NULL);
/*!40000 ALTER TABLE `m005t_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m006t_tiendas`
--

DROP TABLE IF EXISTS `m006t_tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m006t_tiendas` (
  `co_tienda` int(11) NOT NULL AUTO_INCREMENT,
  `tx_tienda` varchar(45) NOT NULL,
  `bo_activo` tinyint(1) NOT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`co_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m006t_tiendas`
--

LOCK TABLES `m006t_tiendas` WRITE;
/*!40000 ALTER TABLE `m006t_tiendas` DISABLE KEYS */;
INSERT INTO `m006t_tiendas` VALUES (1,'MINI LUNCH - TERMINAL',0,'2015-11-22 09:41:00'),(2,'CASA - LOZADA',0,'2015-11-22 22:05:04'),(3,'PRINCIPAL',0,'2015-11-22 09:41:00'),(4,'PUEBLO',0,'2015-12-05 15:42:00');
/*!40000 ALTER TABLE `m006t_tiendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m007t_usuarios`
--

DROP TABLE IF EXISTS `m007t_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m007t_usuarios` (
  `co_usuario` varchar(45) NOT NULL,
  `nb_usuario` varchar(16) NOT NULL,
  `tx_email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co_empleado` int(11) NOT NULL,
  `bo_activo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`co_usuario`),
  KEY `fk_m007t_usuarios_empleado_idx` (`co_empleado`),
  CONSTRAINT `fk_m007t_usuarios_empleado` FOREIGN KEY (`co_empleado`) REFERENCES `m005t_empleados` (`co_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m007t_usuarios`
--

LOCK TABLES `m007t_usuarios` WRITE;
/*!40000 ALTER TABLE `m007t_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `m007t_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m008t_turnos`
--

DROP TABLE IF EXISTS `m008t_turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m008t_turnos` (
  `co_turno` int(11) NOT NULL AUTO_INCREMENT,
  `tx_turno` varchar(45) NOT NULL,
  `bo_activo` tinyint(1) NOT NULL,
  `fe_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`co_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m008t_turnos`
--

LOCK TABLES `m008t_turnos` WRITE;
/*!40000 ALTER TABLE `m008t_turnos` DISABLE KEYS */;
INSERT INTO `m008t_turnos` VALUES (1,'MAÑANA',0,'2015-11-22 15:40:14'),(2,'TARDE',0,'2015-11-22 15:41:00'),(3,'NOCHE',0,'2015-11-22 15:41:00');
/*!40000 ALTER TABLE `m008t_turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_autologin`
--

DROP TABLE IF EXISTS `user_autologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_autologin`
--

LOCK TABLES `user_autologin` WRITE;
/*!40000 ALTER TABLE `user_autologin` DISABLE KEYS */;
INSERT INTO `user_autologin` VALUES ('8d475325dae942c9bd9f523fee751d1e',1,'Mozilla/5.0 (Linux; Android 4.4.2; GT-I9190 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.76 Mobile Safari/537.36','192.168.0.101','2015-12-06 00:20:37');
/*!40000 ALTER TABLE `user_autologin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL);
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adamsistron','$2a$08$pHrQhDWeURBRh1ywlwsACutCQmsftMDJ77tD16UrOP.Jm.u02rgua','adamsistron@gmail.com',1,0,NULL,NULL,NULL,NULL,NULL,'127.0.0.1','2015-12-05 20:09:49','2015-11-05 14:41:25','2015-12-06 00:39:49'),(2,'adam','$2a$08$pVhfCogDU19lEwrWjczb9OYjX3RNGGUadNOJ2qubQuJ9lO03uN5Ay','adamcarrillocortes@gmail.com',1,0,NULL,NULL,NULL,NULL,NULL,'127.0.0.1','2015-12-12 12:50:28','2015-12-05 20:31:44','2015-12-12 17:20:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-24 20:24:55
