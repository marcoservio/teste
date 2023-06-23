-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: catalogo-carros
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `carros`
--

DROP TABLE IF EXISTS `carros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carros` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Marca` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Modelo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Ano` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Cor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `TipoCorpo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Motor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Transmissao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Quilometragem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Preco` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `NumeroPortas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CapacidadePassageiros` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Descricao` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carros`
--

LOCK TABLES `carros` WRITE;
/*!40000 ALTER TABLE `carros` DISABLE KEYS */;
INSERT INTO `carros` VALUES (1,'Toyota','Corolla','2022','Prata','Sedã','2.0L','Automática','5000','35000','4','5','Carro confortável e econômico'),(2,'Honda','Civic','2021','Branco','Sedã','1.5L','Automática','10000','40000','4','5','Excelente desempenho e tecnologia'),(3,'Ford','Focus','2020','Azul','Hatchback','1.6L','Manual','8000','25000','4','5','Carro esportivo e ágil'),(4,'Volkswagen','Golf','2019','Vermelho','Hatchback','1.4L','Automática','12000','30000','4','5','Design moderno e bom consumo de combustível'),(5,'Chevrolet','Cruze','2018','Preto','Sedã','1.8L','Automática','15000','28000','4','5','Carro espaçoso e confortável'),(6,'Nissan','Sentra','2017','Prata','Sedã','1.6L','Automática','18000','22000','4','5','Seguro e confiável'),(7,'Hyundai','Elantra','2016','Branco','Sedã','2.0L','Automática','20000','20000','4','5','Tecnologia avançada e bom desempenho'),(8,'BMW','Série 3','2022','Preto','Sedã','2.0L','Automática','5000','60000','4','5','Luxuoso e esportivo'),(9,'Mercedes-Benz','Classe C','2021','Prata','Sedã','2.0L','Automática','10000','65000','4','5','Elegância e sofisticação'),(10,'Audi','A4','2020','Cinza','Sedã','2.0L','Automática','15000','70000','4','5','Conforto e tecnologia de ponta'),(11,'Kia','Optima','2019','Branco','Sedã','2.0L','Automática','18000','40000','4','5','Carro espaçoso e seguro'),(12,'Mazda','Mazda3','2018','Azul','Sedã','2.0L','Automática','20000','35000','4','5','Design elegante e desempenho esportivo'),(13,'Subaru','Impreza','2017','Vermelho','Hatchback','2.0L','Manual','22000','30000','4','5','Tração nas quatro rodas e segurança'),(14,'Volvo','S60','2016','Preto','Sedã','2.0L','Automática','25000','40000','4','5','Carro seguro e confortável'),(15,'Tesla','Model 3','2022','Prata','Sedã','Elétrico','Automática','5000','60000','4','5','Tecnologia avançada e zero emissões'),(16,'Lexus','IS','2021','Branco','Sedã','2.0L','Automática','10000','65000','4','5','Luxo e desempenho'),(17,'Infiniti','Q50','2020','Preto','Sedã','3.0L','Automática','15000','70000','4','5','Design elegante e conforto'),(18,'Jaguar','XE','2019','Cinza','Sedã','2.0L','Automática','18000','40000','4','5','Esportividade e sofisticação'),(19,'Land Rover','Range Rover Evoque','2018','Branco','SUV','2.0L','Automática','20000','35000','4','5','Luxo e versatilidade'),(20,'Porsche','Panamera','2017','Vermelho','Sedã','3.0L','Automática','22000','30000','4','5','Esportividade e exclusividade');
/*!40000 ALTER TABLE `carros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-22 19:08:13
