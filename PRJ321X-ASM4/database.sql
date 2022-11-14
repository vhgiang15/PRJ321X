-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingdb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `user_mail` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `account_role` int NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('duongdt@fpt.com.vn','123',1,'Đinh Tùng Dương','Đại học FPT','0765870407'),('quytd@fpt.com.vn','123',1,'Thái Duy Quý','Đại học Đà Lạt','1234567'),('vhgiang15@gmail.com','123456',2,'vo hoang giang','can tho','0983365465');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `nameCustomer` varchar(50) DEFAULT NULL,
  `user_mail` varchar(100) DEFAULT NULL,
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_status` int DEFAULT NULL,
  `order_discount_code` varchar(8) DEFAULT NULL,
  `order_address` varchar(255) NOT NULL,
  `order_phone` varchar(10) DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('vo hoang giang','vhgiang15@gmail.com',79,NULL,NULL,'vinh long','0983365465','2022-10-14 22:52:51'),('ha cam van','vanhc12@gmail.com',80,NULL,NULL,'Can Tho','0983365465','2022-10-15 21:09:50'),('vo hoang giang','vhgiang15@gmail.com',81,NULL,NULL,'Cần Thơ','0983365465','2022-10-15 21:14:21'),('ha cam van','vanhc12@gmail.com',82,NULL,NULL,'Cần Thơ','0983365465','2022-10-15 21:20:23'),('van','vhgiang15@gmail.com',83,NULL,NULL,'can tho','0983365465','2022-10-17 16:11:36'),('VO HOANG GIANG','vhgiang15@gmail.com',84,NULL,NULL,'can tho','0983365465','2022-10-17 19:34:37'),('vo hoan giang','vhgiang15@gmail.com',85,NULL,NULL,'can tho','0983365465','2022-10-17 19:45:06'),('van','vhgiang15@gmail.com',86,NULL,NULL,'0983365465','0983365465','2022-10-19 23:27:58'),('van','vhgiang15@gmail.com',87,NULL,NULL,'0983365465','0983365465','2022-10-20 14:22:03'),('vo hoang giang','vhgiang15@gmail.com',88,NULL,NULL,'can tho','0983365465','2022-10-20 15:03:14'),('vo hoang giang','vhgiang15@gmail.com',89,NULL,NULL,'Cần Thơ','0983365465','2022-11-14 16:51:32');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount_product` int DEFAULT NULL,
  `price_product` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES (79,2,2,37.99),(79,6,1,17.99),(80,11,3,1320),(80,6,1,17.99),(80,1,1,43.99),(81,1,2,43.99),(81,18,1,750),(82,13,2,1340),(82,4,1,27.99),(83,1,1,43.99),(84,1,1,43.99),(84,4,1,27.99),(85,1,1,43.99),(85,10,1,10.49),(86,24,1,1000),(87,2,1,37.99),(88,3,2,32.99),(88,4,1,27.99),(89,4,1,27.99),(89,6,2,17.99);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_des` varchar(255) DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_img_source` varchar(255) DEFAULT NULL,
  `product_type` varchar(100) DEFAULT NULL,
  `product_brand` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 11 Pro Max 512GB','Màn hình: 6.5\", Super Retina XDR\nHĐH: iOS 13\nCPU: Apple A13 Bionic 6 nhân\nRAM: 4 GB, ROM: 512 GB\nCamera: 3 camera 12 MP, Selfie: 12 MP',43.99,'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg','cellphone','apple'),(2,'iPhone 11 Pro Max 256GB','Màn hình: 6.5\", Super Retina XDR\nHĐH: iOS 13\nCPU: Apple A13 Bionic 6 nhân\nRAM: 4 GB, ROM: 512 GB\nCamera: 3 camera 12 MP, Selfie: 12 MP',37.99,'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg','cellphone','apple'),(3,'iPhone Xs Max 256GB','Màn hình: 6.5\", Super Retina\nHĐH: iOS 12\nCPU: Apple A12 Bionic 6 nhân\nRAM: 4 GB, ROM: 256 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',32.99,'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg','cellphone','apple'),(4,'iPhone X 256GB','Màn hình: 5.8\", Super Retina\nHĐH: iOS 12\nCPU: Apple A11 Bionic 6 nhân\nRAM: 3 GB, ROM: 256 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',27.99,'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg','cellphone','apple'),(5,'iPhone Xs 64GB','Màn hình: 5.8\", Super Retina\nHĐH: iOS 12\nCPU: Apple A12 Bionic 6 nhân\nRAM: 4 GB, ROM: 64 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',24.99,'https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg','cellphone','apple'),(6,'iPhone Xr 128GB','Màn hình: 6.1\", Liquid Retina\nHĐH: iOS 12\nCPU: Apple A12 Bionic 6 nhân\nRAM: 3 GB, ROM: 128 GB\nCamera: 12 MP, Selfie: 7 MP',17.99,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone','apple'),(7,'iPhone Xr 128GB','Màn hình: 6.1\", Liquid Retina\nHĐH: iOS 12\nCPU: Apple A12 Bionic 6 nhân\nRAM: 3 GB, ROM: 128 GB\nCamera: 12 MP, Selfie: 7 MP',17.99,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone','apple'),(8,'iPhone 8 Plus 64GB','Màn hình: 5.5\", Retina HD\nHĐH: iOS 12\nCPU: Apple A11 Bionic 6 nhân\nRAM: 3 GB, ROM: 64 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',16.59,'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600.jpg','cellphone','apple'),(9,'iPhone 7 Plus 32GB','Màn hình: 5.5\", Retina HD\nHĐH: iOS 12\nCPU: Apple A10 Fusion 4 nhân 64-bit\nRAM: 3 GB, ROM: 32 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',12.49,'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600.jpg','cellphone','apple'),(10,'iPhone 7 32GB','Màn hình: 4.7\", Retina HD\nHĐH: iOS 12\nCPU: Apple A10 Fusion 4 nhân 64-bit\nRAM: 2 GB, ROM: 32 GB\nCamera: 12 MP, Selfie: 7 MP',10.49,'https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600.jpg','cellphone','apple'),(11,'iPhone 14 Pro Max 128GB','MÀN HÌNH: OLED, 6.7 inch, Super Retina XDR, 120 Hz \nHĐH: IOS 16 CPU: Apple A16 Bionic 6 nhân RAM:  6 GB, \nROM: 512 GB CAMERA:Chính 48 MP & Phụ 12 MP, 12 MP, SELFIE: 12 MP',1320,'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-tim-thumb-600x600.jpg','cellphone','apple'),(12,'iPhone 14 Pro 256GB','MÀN HÌNH: OLED, 6.1 inch, Super Retina XDR, 120 Hz HĐH: IOS 16 CPU: Apple A16 Bionic 6 nhân RAM:  6 GB, ROM: 256 GB CAMERA:Chính 48 MP & Phụ 12 MP, 12 MP, SELFIE: 12 MP',1350,'https://cdn.tgdd.vn/Products/Images/42/289691/iphone-14-pro-bac-thumb-600x600.jpg','cellphone','apple'),(13,'iPhone 14 Plus 512GB','MÀN HÌNH: OLED, 6.7 inch, Super Retina XDR, 120 Hz HĐH: IOS 16 CPU: Apple A15 Bionic 6 nhân RAM:  6 GB, ROM: 512 GB CAMERA:Chính 48 MP & Phụ 12 MP, 12 MP, SELFIE: 12 MP',1340,'https://cdn.tgdd.vn/Products/Images/42/289712/iPhone-14-thumb-trang-600x600.jpg','cellphone','apple'),(14,'iPhone 13 Pro 128GB','MÀN HÌNH: OLED, 6.1 inch, Super Retina XDR HĐH: IOS 15 CPU: Apple A15 Bionic 6 nhân RAM:  6 GB, ROM: 128 GB CAMERA:Chính 48 MP & Phụ 12 MP, 12 MP, SELFIE: 12 MP',1000,'https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-graphite-600x600.jpg','cellphone','apple'),(15,'Samsung Galaxy Z Fold4 256GB\n','MÀN HÌNH: Dynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"Quad HD+ (2K+) HĐH: Android 12 CPU: Snapdragon 8+ Gen 1 RAM:  12GB, ROM: 256 GB CAMERA:Chính 50 MP & Phụ 12 MP, 10 MP, SELFIE: 10 MP & 4 MP',1480,'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold4-kem-256gb-600x600.jpg','cellphone','samsung'),(16,'Samsung Galaxy Z Fold3 5G 256GB\n','MÀN HÌNH: Dynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"Full HD+ HĐH: Android 11 CPU: Snapdragon 888  RAM:  12GB, ROM: 256 GB CAMERA:3 camera 12 MP, SELFIE: 10 MP & 4 MP',1200,'https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-silver-1-600x600.jpg','cellphone','samsung'),(17,'Samsung Galaxy S22+ 5G 128GB\n','MÀN HÌNH: Dynamic AMOLED 2X6.6\"Full HD+  HĐH: Android 12 CPU: Snapdragon 8 Gen 1  RAM:  8GB, ROM: 128 GB CAMERA:Chính 50 MP & Phụ 12 MP, 10 MP, SELFIE: 10 MP',800,'https://cdn.tgdd.vn/Products/Images/42/242439/Galaxy-S22-Plus-White-600x600.jpg','cellphone','samsung'),(18,'Samsung Galaxy S22 5G 128GB\n','MÀN HÌNH: Dynamic AMOLED 2X6.1\"Full HD+  HĐH: Android 12 CPU: Snapdragon 8 Gen 1  RAM:  8GB, ROM: 128 GB CAMERA:Chính 50 MP & Phụ 12 MP, 10 MP, SELFIE: 10 MP',750,'https://cdn.tgdd.vn/Products/Images/42/231110/Galaxy-S22-Black-600x600.jpg','cellphone','samsung'),(19,'MacBook Pro M2 2022\n','CPU: Apple M2100GB/s RAM: 8 GB Ổ cứng: 256 GB SSD Màn hình: 13.3\"Retina (2560 x 1600) Card màn hình: Card tích hợp10 nhân GPU Cổng kết nối: 2 x Thunderbolt 3Jack tai nghe 3.5 mm',1300,'https://cdn.tgdd.vn/Products/Images/44/282828/apple-macbook-pro-13-inch-m2-2022-xam-600x600.jpg','laptop','apple'),(20,'MacBook Pro 16 M1 Max 2021\n','CPU: Apple M1 Max400GB/s RAM: 32 GB Ổ cứng: 1 TB SSD Màn hình: 16.2\"Liquid Retina XDR display (3456 x 2234)120Hz Card màn hình: Card tích hợp32 nhân GPU Cổng kết nối: 3 x Thunderbolt 4 USB-CHDMIJack tai nghe 3.5 mm',5000,'https://cdn.tgdd.vn/Products/Images/44/253582/apple-macbook-pro-16-m1-max-2021-600x600.jpg','laptop','apple'),(21,'MacBook Pro 14 M1 Max 2021\n','CPU: Apple M1 Max400GB/s RAM: 32 GB Ổ cứng: 1 TB SSD Màn hình: 14.2\"Liquid Retina XDR display (3456 x 2234)120Hz Card màn hình: Card tích hợp32 nhân GPU Cổng kết nối: 3 x Thunderbolt 4 USB-CHDMIJack tai nghe 3.5 mm',4000,'https://cdn.tgdd.vn/Products/Images/44/253582/apple-macbook-pro-16-m1-max-2021-600x600.jpg','laptop','apple'),(22,'Dell Vostro 5620 i5\n','CPU: i51240P1.7GHz RAM: 8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz Ổ cứng: 256 GB SSD NVMe PCIe Màn hình: 16\"Full HD+ (1920 x 1200) Card màn hình: Card tích hợpIntel UHD Cổng kết nối: LAN (RJ45)',1000,'https://cdn.tgdd.vn/Products/Images/44/292397/dell-vostro-5620-i5-v6i5001w1-thumb-1-600x600.jpg\n','laptop','dell'),(23,'Dell Latitude 3520 i5\n','CPU: i51135G72.4GHz RAM: 8 GBDDR4 2 khe (1 khe 8 GB + 1 khe rời)3200 MHz Ổ cứng: Hỗ trợ thêm 1 khe cắm HDD SATA (nâng cấp tối đa 1TB)256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB) Màn hình: 15.6\"Full HD (1920 x 1080)',1000,'https://cdn.tgdd.vn/Products/Images/44/249190/dell-latitude-3520-i5-70251593-091221-020948-600x600.jpg\n','laptop','dell'),(26,'Asus TUF Gaming FX517ZC i5\n','CPU: i512450H2GHz RAM: 8 GBDDR5 2 khe (1 khe 8 GB + 1 khe trống)4800 MHz Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB) Màn hình: 15.6\"Full HD (1920 x 1080) 144Hz',1000,'https://cdn.tgdd.vn/Products/Images/44/279259/TimerThumb/asus-tuf-gaming-fx506lhb-i5-hn188w-(14).jpg\n','laptop','asus'),(27,'Asus ZenBook UX325EA\n','CPU: i51135G72.4GHz RAM: 8 GBLPDDR4X (Onboard)4267 MHz Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB) Màn hình: 13.3\"Full HD (1920 x 1080) OLED Card màn hình: Card tích hợpIntel Iris Xe',800,'https://cdn.tgdd.vn/Products/Images/44/267786/asus-zenbook-ux325ea-i5-1135g7-8gb-512gb-600x600.jpg\n','laptop','asus');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-14 23:13:30
