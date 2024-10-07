-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bancotestewk
-- ------------------------------------------------------
-- Server version	5.7.44-log

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

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(250) NOT NULL,
  `Cidade` varchar(150) DEFAULT NULL,
  `UF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'MARCIO','CONTAGEM','MG'),(2,'Carla','Belo horizonte','MG'),(3,'Tania','Sete Lagoas','MG'),(4,'Suzana','Chapeco','SC'),(5,'Vantuir','Belo horizonte','MG'),(6,'Wanderley','Contagem','MG'),(7,'Pedro','Contagem','MG'),(8,'MARIA SOUZA','BELO HORIZONTE','MG'),(9,'Sandra','Belo horizonte','MG'),(10,'Ivone','Itu','SP'),(11,'Silvana','Belo horizonte','MG'),(12,'Sandro','Contagem','MG'),(13,'Luiz','Contagem','MG'),(14,'Wagner','Sete Lagoas','MG'),(15,'Heitor','Belo horizonte','MG'),(16,'Cintia','Contagem','MG'),(17,'Marilda','Contagem','MG'),(18,'Simone','Belo horizonte','MG'),(19,'Manoel','Contagem','MG'),(20,'Luiza','Sete Lagoas','MG');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `NumeroPedido` int(11) NOT NULL,
  `InseridoEm` datetime DEFAULT CURRENT_TIMESTAMP,
  `CodigoCliente` int(11) NOT NULL,
  `ValorTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`NumeroPedido`),
  KEY `fk_Pedidos_CodigoCliente` (`CodigoCliente`),
  CONSTRAINT `fk_Pedidos_CodigoCliente` FOREIGN KEY (`CodigoCliente`) REFERENCES `clientes` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2024-10-06 15:26:18',3,134.30),(3,'2024-10-06 15:59:02',5,153.99),(4,'2024-10-06 16:00:38',8,37.00),(5,'2024-10-06 16:01:01',12,62.00),(6,'2024-10-06 17:11:10',3,78.30);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidositens`
--

DROP TABLE IF EXISTS `pedidositens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidositens` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroPedido` int(11) NOT NULL,
  `CodigoProduto` int(11) NOT NULL,
  `Quantidade` decimal(4,2) DEFAULT NULL,
  `ValorUnitario` decimal(10,2) DEFAULT NULL,
  `ValorTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_PedidosItens_CodigoProduto` (`CodigoProduto`),
  CONSTRAINT `fk_PedidosItens_NumeroPedido` FOREIGN KEY (`NumeroPedido`) REFERENCES `pedidos` (`NumeroPedido`),
  CONSTRAINT `fk_PedidosItens_CodigoProduto` FOREIGN KEY (`CodigoProduto`) REFERENCES `produtos` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidositens`
--

LOCK TABLES `pedidositens` WRITE;
/*!40000 ALTER TABLE `pedidositens` DISABLE KEYS */;
INSERT INTO `pedidositens` VALUES (1,1,10,15.00,8.50,127.50),(2,1,12,2.00,3.40,6.80),(4,3,15,10.00,12.50,125.00),(5,3,4,1.00,28.99,28.99),(6,4,1,1.00,2.50,2.50),(7,4,11,2.00,4.70,9.40),(8,4,17,2.00,12.55,25.10),(11,6,1,15.00,2.50,37.50),(12,6,6,2.00,8.20,16.40),(13,6,7,1.00,7.40,7.40);
/*!40000 ALTER TABLE `pedidositens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(250) NOT NULL,
  `PrecoVenda` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Sabonete',2.50),(2,'Papel toalha',3.10),(3,'Shampoo',24.80),(4,'Arroz',28.99),(5,'Cafe',17.00),(6,'Sabao em po',8.20),(7,'Oleo',7.40),(8,'Leite',3.80),(9,'Pao de forma',11.50),(10,'Farinha de trigo',8.50),(11,'Escova de dente',4.70),(12,'Pano de prato',3.40),(13,'Agua sanitaria',3.90),(14,'Desengordurante',7.99),(15,'Amaciante',12.50),(16,'Manteiga',24.90),(17,'Margarin',12.55),(18,'Biscoito',3.60),(19,'Pao de queiro',12.85),(20,'Vassoura',15.80);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 21:44:40
