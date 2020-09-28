-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: acb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `participant_info`
--

DROP TABLE IF EXISTS `participant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant_info` (
  `index` bigint NOT NULL,
  `game id` bigint DEFAULT NULL,
  `team id` bigint DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `first name` text,
  `number` double DEFAULT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `display_name_UNIQUE` (`display_name`),
  KEY `ix_acb_participant_info_index` (`index`),
  KEY `fk_participant_team` (`team id`),
  CONSTRAINT `fk_participant_team` FOREIGN KEY (`team id`) REFERENCES `team_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_info`
--

LOCK TABLES `participant_info` WRITE;
/*!40000 ALTER TABLE `participant_info` DISABLE KEYS */;
INSERT INTO `participant_info` VALUES (1,1,1,'McCalebb,Bo','Bo',7),(2,1,1,'Casimiro,Luis','Luis',NULL),(3,1,1,'Kuric,Kyle','Kyle',24),(4,1,1,'Paulí,Oriol','Oriol',21),(5,1,1,'Pasecniks,Anzejs','Anzejs',14),(6,1,1,'O\'Neale,Royce','Royce',15),(7,1,1,'Hendrix,Richard','Richard',2),(8,1,1,'Báez,Eulis','Eulis',13),(9,1,1,'Oliver,Albert','Albert',4),(10,1,1,'Rabaseda,Xavi','Xavi',22),(11,1,1,'Planinic,Darko','Darko',6),(12,1,1,'Aguilar,Pablo','Pablo',34),(13,1,1,'Salin,Sasu','Sasu',9),(14,1,11,'Bogris,Georgios','Georgios',31),(15,1,11,'White,Davin','Davin',34),(16,1,11,'Abromaitis,Tim','Tim',21),(17,1,11,'Bassas,Ferran','Ferran',10),(18,1,11,'Vidorreta,Txus','Txus',NULL),(19,1,11,'Richotti,Nicolás','Nicolás',5),(20,1,11,'Doornekamp,A.','A.',42),(21,1,11,'Grigonis,Marius','Marius',13),(22,1,11,'Vázquez,Fran','Fran',17),(23,1,11,'Niang,Mamadou','Mamadou',7),(24,1,11,'SanMiguel,R.','R.',0),(25,1,11,'Beirán,Javier','Javier',33),(26,1,11,'Hanley,Will','Will',11),(27,2,2,'Wilson,Jamar','Jamar',31),(28,2,2,'Traoré,Ali','Ali',24),(29,2,2,'Fernández,Jaime','Jaime',7),(30,2,2,'Cook,Omar','Omar',10),(31,2,2,'Brizuela,Darío','Darío',25),(32,2,2,'Suton,Goran','Goran',12),(33,2,2,'Page,Dylan','Dylan',15),(34,2,2,'Maldonado,S.','S.',NULL),(35,2,2,'Savané,Sitapha','Sitapha',17),(36,2,2,'Grimau,Jordi','Jordi',22),(37,2,2,'Jackson,Edwin','Edwin',1),(38,2,2,'Vanaclocha,Bernat','Bernat',18),(39,2,2,'Vicedo,Edgar','Edgar',9),(40,2,6,'Tabak,Zan','Zan',NULL),(41,2,6,'Lockett,Trent','Trent',24),(42,2,6,'Chery,Kenny','Kenny',23),(43,2,6,'Cate,Emanuel','Emanuel',15),(44,2,6,'Triguero,J.','J.',8),(45,2,6,'Sánchez,A.','A.',5),(46,2,6,'Lorbek,Domen','Domen',13),(47,2,6,'Radicevic,Nikola','Nikola',4),(48,2,6,'Nachbar,Bostjan','Bostjan',7),(49,2,6,'Rigo,Tomeu','Tomeu',10),(50,2,6,'Stojanovski,V.','V.',19),(51,2,6,'Milosevic,S.','S.',18),(52,2,6,'Zoric,Luka','Luka',11),(53,3,10,'Laso,Pablo','Pablo',NULL),(54,3,10,'Randolph,A.','A.',3),(55,3,10,'Hunter,Othello','Othello',21),(56,3,10,'Ayón,Gustavo','Gustavo',14),(57,3,10,'Llull,Sergio','Sergio',23),(58,3,10,'Maciulis,Jonas','Jonas',8),(59,3,10,'Fernández,Rudy','Rudy',5),(60,3,10,'Draper,Dontaye','Dontaye',4),(61,3,10,'Doncic,Luka','Luka',7),(62,3,10,'Nocioni,Andrés','Andrés',6),(63,3,10,'Taylor,Jeffery','Jeffery',44),(64,3,10,'Carroll,Jaycee','Jaycee',20),(65,3,10,'Reyes,Felipe','Felipe',9),(66,3,7,'Plaza,Joan','Joan',NULL),(67,3,7,'Brooks,Jeff','Jeff',23),(68,3,7,'Nedovic,Nemanja','Nemanja',16),(69,3,7,'García,JuanJosé','Juan José',14),(70,3,7,'Smith,Jamar','Jamar',15),(71,3,7,'Fogg,Kyle','Kyle',8),(72,3,7,'Okouo,Viny','Viny',2),(73,3,7,'Waczynski,Adam','Adam',21),(74,3,7,'Díez,Daniel','Daniel',11),(75,3,7,'Musli,Dejan','Dejan',44),(76,3,7,'Lafayette,Oliver','Oliver',20),(77,3,7,'Suárez,Carlos','Carlos',43),(78,3,7,'Díaz,Alberto1','Alberto',9),(79,4,8,'Navarro,Ibon','Ibon',NULL),(80,4,8,'Belemene,Romaric','Romaric',25),(81,4,8,'Jou,Guillem','Guillem',16),(82,4,8,'Andric,Luksa','Luksa',12),(83,4,8,'Montañez,Román','Román',8),(84,4,8,'Aranitovic,Petar','Petar',5),(85,4,8,'Costa,Lluís','Lluís',28),(86,4,8,'Suggs,Scott','Scott',2),(87,4,8,'Cvetkovic,A.','A.',4),(88,4,8,'Cakarun,Marjan','Marjan',6),(89,4,8,'Auda,Patrik','Patrik',1),(90,4,8,'Tomàs,Pere','Pere',19),(91,4,8,'Trapani,Joe','Joe',17),(92,4,5,'Oleson,Brad','Brad',24),(93,4,5,'Diagné,Atoumane','Atoumane',29),(94,4,5,'Peno,Stefan','Stefan',16),(95,4,5,'Vezenkov,A.','A.',14),(96,4,5,'Esteban,Màxim','Màxim',27),(97,4,5,'Doellman,Justin','Justin',5),(98,4,5,'Figueras,Pol','Pol',18),(99,4,5,'Dorsey,Joey','Joey',6),(100,4,5,'Claver,Víctor','Víctor',10),(101,4,5,'Tomic,Ante','Ante',44),(102,4,5,'Eriksson,Marcus','Marcus',20),(103,4,5,'Perperoglou,S.','S.',33),(104,4,5,'Bartzokas,G.','G.',NULL),(105,5,12,'Fernández,Moncho','Moncho',NULL),(106,5,12,'Cárdenas,Fran','Fran',24),(107,5,12,'Whittington,S.','S.',21),(108,5,12,'Allen,Rosco','Rosco',25),(109,5,12,'Yusta,Santiago','Santiago',16),(110,5,12,'McConnell,Mickey','Mickey',32),(111,5,12,'Matulionis,O.','O.',8),(112,5,12,'Pustovyi,Artem','Artem',13),(113,5,12,'Bendzius,Eimantas','Eimantas',22),(114,5,12,'Díaz,Alberto','Alberto',6),(115,5,12,'Pozas,Pepe','Pepe',44),(116,5,12,'Corbacho,A.','A.',33),(117,5,12,'Pechacek,Adam','Adam',23),(118,5,3,'Alonso,Sito','Sito',NULL),(119,5,3,'Shengelia,T.','T.',23),(120,5,3,'Tillie,Kim','Kim',14),(121,5,3,'Diop,Ilimane','Ilimane',12),(122,5,3,'Hanga,Adam','Adam',8),(123,5,3,'Cooney,Trevor','Trevor',5),(124,5,3,'Luz,Rafa','Rafa',55),(125,5,3,'Voigtmann,J.','J.',7),(126,5,3,'Larkin,Shane','Shane',0),(127,5,3,'Bargnani,Andrea','Andrea',1),(128,5,3,'Sedekerskis,Tadas','Tadas',9),(129,5,3,'Blazic,Jaka','Jaka',11),(130,6,9,'Paunic,Ivan','Ivan',31),(131,6,9,'Cuspinera,Jota','Jota',NULL),(132,6,9,'Wear,David','David',12),(133,6,9,'González,JoséM.','José M.',15),(134,6,9,'Llorca,Álex','Álex',8),(135,6,9,'Popovic,Marko','Marko',2),(136,6,9,'Smits,Rolands','Rolands',13),(137,6,9,'O\'Leary,Ian','Ian',4),(138,6,9,'Diagné,Moussa','Moussa',21),(139,6,9,'Hakanson,Ludde','Ludde',6),(140,6,9,'Sekulic,Blagota','Blagota',9),(141,6,9,'Cabezas,Carlos','Carlos',10),(142,6,9,'Cruz,Francisco','Francisco',11),(143,6,13,'Tabu,Jonathan','Jonathan',9),(144,6,13,'Duran,Carles','Carles',NULL),(145,6,13,'Nikolic,Danilo','Danilo',34),(146,6,13,'Buva,Ivan','Ivan',25),(147,6,13,'Salgado,Javier','Javier',14),(148,6,13,'Mumbrú,Álex','Álex',15),(149,6,13,'Borg,Tobias','Tobias',8),(150,6,13,'Eric,Micheal','Micheal',50);
/*!40000 ALTER TABLE `participant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_info`
--

DROP TABLE IF EXISTS `player_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_info` (
  `index` bigint DEFAULT NULL,
  `acbid` varchar(100) NOT NULL,
  `full name` text,
  `display_name` varchar(100) DEFAULT NULL,
  `nationality` text,
  `twitter` text,
  PRIMARY KEY (`acbid`),
  KEY `ix_acb_player_info_index` (`index`),
  KEY `fk_player_participant` (`display_name`),
  CONSTRAINT `fk_player_participant` FOREIGN KEY (`display_name`) REFERENCES `participant_info` (`display_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_info`
--

LOCK TABLES `player_info` WRITE;
/*!40000 ALTER TABLE `player_info` DISABLE KEYS */;
INSERT INTO `player_info` VALUES (119,'105','Tornike Shengelia','Shengelia,T.','GEO','TokoShengelia23'),(26,'10C','William Joseph Hanley','Hanley,Will','IRL','WillHanley11'),(56,'113','Gustavo Alfonso Ayón Aguirre','Ayón,Gustavo','MEX','AyonGustavo'),(29,'117','Jaime Fernández Bernabé','Fernández,Jaime','ESP','jaimefb44'),(102,'118','Marcus Per Eriksson','Eriksson,Marcus','SWE','marcuseri'),(122,'125','Adam Hanga','Hanga,Adam','HUN','HangaAdamOnline'),(52,'126','Luka Zoric','Zoric,Luka','HRV',NULL),(99,'167','Richard Elmer Dorsey','Dorsey,Joey','USA',NULL),(138,'17T','Cheikh Moussa Diagne','Diagné,Moussa','SEN',NULL),(130,'17U','Ivan Paunic','Paunic,Ivan','SRB','paun3131'),(81,'1AF','Guillem Jou Coll','Jou,Guillem','ESP','GjouC'),(128,'1BG','Tadas Sedekerskis','Sedekerskis,Tadas','LTU','Sedekerskis_11'),(94,'1C1','Stefan Peno','Peno,Stefan','SRB','MaLebronJeKeva'),(43,'1DZ','Emanuel Ion Cate','Cate,Emanuel','ROU',NULL),(109,'1E4','Santiago Yusta García','Yusta,Santiago','ESP','santiagoyusta'),(72,'1ES','Viny Pierrot Marcel Okouo','Okouo,Viny','COG','okouoviny'),(73,'1KW','Adam Szczepan Waczynski','Waczynski,Adam','POL','awaczynski'),(58,'1L9','Jonas Maciulis','Maciulis,Jonas','LTU','JonasMaciulis8'),(14,'1LC','Georgios Bogris','Bogris,Georgios','GRC','bogrinho'),(21,'1LK','Marius Grigonis','Grigonis,Marius','LTU',NULL),(32,'1LM','Goran Suton','Suton,Goran','HRV','SpartanG14'),(149,'1LW','Tobias Carl Peter Borg','Borg,Tobias','SWE','borgtobias'),(120,'227','Kim Tillie','Tillie,Kim','FRA','ktillie'),(3,'241','Kyle Matthew Kuric','Kuric,Kyle','SVQ','KingKK_14'),(60,'243','Dontaye Dominic Draper','Draper,Dontaye','HRV','Draper11'),(137,'258','Ian Joseph O\'Leary','O\'Leary,Ian','IRL','OLearyianj'),(47,'263','Nikola Radicevic','Radicevic,Nikola','SRB','nikoradicevic'),(55,'267','Tegba Othello Hunter','Hunter,Othello','LBR',NULL),(15,'2B8','Davin Edward White','White,Davin','USA',NULL),(93,'2CG','Atoumane Diagné','Diagné,Atoumane','SEN','AtouDiagne'),(96,'2CH','Màxim Esteban Calvo','Esteban,Màxim','ESP','maximesteban'),(68,'2FY','Nemanja Nedovic','Nedovic,Nemanja','SRB','nedovic1624'),(37,'2IN','Edwin Pierre Jackson','Jackson,Edwin','FRA','edjacks'),(50,'2IP','Vojdan Stojanovski','Stojanovski,V.','MKD',NULL),(13,'2IR','Sasu Antreas Salin','Salin,Sasu','FIN','sasusalin10'),(69,'2IU','Juan José García Rodríguez','García,JuanJosé','ESP','juanwer3'),(61,'460','Luka Doncic','Doncic,Luka','SVN','luka7doncic'),(98,'478','Pol Figueras López','Figueras,Pol','ESP','PolFiguerasL'),(125,'500','Johannes Voigtmann','Voigtmann,J.','DEU',NULL),(20,'501','Aaron Doornekamp','Doornekamp,A.','NLD',NULL),(71,'504','Kyle Fogg','Fogg,Kyle','USA','KFogg21'),(67,'505','Jeffrey Brooks','Brooks,Jeff','ITA','Free_Brooks21'),(54,'507','Anthony Erwin Randolph','Randolph,A.','USA',NULL),(145,'508','Danilo Nikolic','Nikolic,Danilo','MNE','DNick34'),(110,'509','Richard Barton McConnell','McConnell,Mickey','USA','mickeymcconnell'),(84,'50B','Petar Aranitovic','Aranitovic,Petar','SRB','AranitovicPetar'),(6,'50E','Royce Khalil O\'Neale','O\'Neale,Royce','USA','BucketsONeale00'),(87,'50G','Aleksandar Cvetkovic','Cvetkovic,A.','SRB',NULL),(127,'50H','Andrea Bargnani','Bargnani,Andrea','ITA','AndreaBargnani'),(108,'50I','Rosco Allen','Allen,Rosco','HUN',NULL),(27,'50J','Jamar Wilson','Wilson,Jamar','FIN','JayDubbs5'),(117,'50L','Adam Pechacek','Pechacek,Adam','CZE',NULL),(28,'50O','Ali Traoré','Traoré,Ali','FRA','bomaye12'),(146,'50P','Ivan Buva','Buva,Ivan','HRV',NULL),(82,'50R','Luksa Andric','Andric,Luksa','HRV',NULL),(86,'50T','Scott Suggs','Suggs,Scott','USA','scottro15'),(150,'50U','Micheal Oluwaseun Eric','Eric,Micheal','NGA','MEasy_50'),(91,'50V','Joseph Charles Trapani','Trapani,Joe','ITA','JoeTrapani1'),(107,'50W','Shayne Mitchell Whittington','Whittington,S.','USA','Whittington21'),(41,'50Z','Trent Lockett','Lockett,Trent','USA','t_lockett24'),(126,'511','DeShane Larkin','Larkin,Shane','USA','shanelarkin_3'),(88,'514','Marjan Cakarun','Cakarun,Marjan','HRV',NULL),(51,'515','Strahinja Milosevic','Milosevic,S.','SRB','bracojlo'),(142,'516','Francisco Cruz','Cruz,Francisco','MEX','pakocruz9'),(1,'519','Lester McCalebb','McCalebb,Bo','MKD',NULL),(42,'51A','Kenny Fred Chery','Chery,Kenny','CAN','KChery1'),(123,'51E','Trevor Donald Cooney','Cooney,Trevor','USA','TCooney10'),(111,'51M','Osvaldas Matulionis','Matulionis,O.','LTU','osvamat'),(104,'550','Georgios Bartzokas','Bartzokas,G.','GRC',NULL),(17,'714','Ferran Bassas Navarra','Bassas,Ferran','ESP','FerranBassas'),(124,'745','Rafael Freire Luz','Luz,Rafa','ESP','rafaluz55'),(115,'750','José Pozas Checa','Pozas,Pepe','ESP','pepepozas4'),(133,'764','José María González Calvo','González,JoséM.','ESP','chemagonzalez91'),(121,'800','Ilimane Diop Gaye','Diop,Ilimane','ESP','eliimane'),(31,'81E','Darío Brizuela Arrieta','Brizuela,Darío','ESP','basquemamba'),(136,'862','Rolands Smits','Smits,Rolands','LVA','Rolands_Smits'),(79,'A09','Ibon Navarro Pérez de Albéniz','Navarro,Ibon','ESP',NULL),(65,'A1M','Felipe Reyes Cabanas','Reyes,Felipe','ESP','9FelipeReyes'),(141,'A3K','Carlos Eduardo Cabezas Jurado','Cabezas,Carlos','ESP',NULL),(148,'A46','Álex Mumbrú Murcia','Mumbrú,Álex','ESP','Alexmumbru15'),(62,'A4C','Andrés Marcelo Nocioni','Nocioni,Andrés','ITA','soyElChapu'),(9,'A56','Albert Oliver Campos','Oliver,Albert','ESP','albertoliver11'),(83,'A78','Román Montañez Martín','Montañez,Román','ESP','r_montanez8'),(36,'A9K','Jordi Grimau Gragera','Grimau,Jordi','ESP',NULL),(22,'A9S','Francisco Vázquez González','Vázquez,Fran','ESP',NULL),(34,'AC7','Salvador Maldonado Ruiz','Maldonado,S.','ESP',NULL),(118,'ADD','Alfonso Alonso Blasco','Alonso,Sito','ESP',NULL),(2,'ADO','Luis Casimiro Palomo Cárdenas','Casimiro,Luis','ESP',NULL),(105,'AE9','Ramón Fernández Vidal','Fernández,Moncho','ESP',NULL),(66,'AED','Joan Plaza Durán','Plaza,Joan','ESP',NULL),(18,'AEX','Jesús Vidorreta Gómez','Vidorreta,Txus','ESP',NULL),(53,'AEY','Pablo Laso Biurrún','Laso,Pablo','ESP',NULL),(131,'AYS','José Ramón Cuspinera Diéguez','Cuspinera,Jota','ESP',NULL),(144,'AZ2','Carles Duran Ortega','Duran,Carles','ESP',NULL),(40,'AZG','Zan Tabak','Tabak,Zan','HRV',NULL),(59,'B0X','Rodolfo Fernández Farrés','Fernández,Rudy','ESP','rudy5fernandez'),(147,'B1R','Javier Salgado Martín','Salgado,Javier','ESP','JaviSalgado4'),(35,'B3M','Sitapha Alfred Savané Sagna','Savané,Sitapha','ESP','SitaphaSavane'),(45,'B44','Alfonso Sánchez Delgado','Sánchez,A.','ESP','23ASanchez'),(135,'B4P','Marko Popovic','Popovic,Marko','HRV','markopop006'),(116,'B5E','Alberto Corbacho De la Cruz','Corbacho,A.','ESP','AlbertoCorby33'),(77,'B79','Carlos Suárez García-Osorio','Suárez,Carlos','ESP','CarlosSuarezWeb'),(57,'B7G','Sergio Llull Meliá','Llull,Sergio','ESP','23Llull'),(24,'B86','Rodrigo San Miguel de la Iglesia','SanMiguel,R.','ESP','rodsanmi00'),(100,'BAZ','Víctor Claver Arocas','Claver,Víctor','ESP','Victor_Claver'),(25,'BB2','Javier Beirán Amigo','Beirán,Javier','ESP','Jbeiran33'),(44,'BCC','Juan José Triguero Estruch','Triguero,J.','ESP',NULL),(140,'BD8','Blagota Sekulic','Sekulic,Blagota','MNE',NULL),(46,'BEC','Domen Lorbek','Lorbek,Domen','SVN',NULL),(33,'BEF','Dylan Page','Page,Dylan','USA',NULL),(30,'BFP','Omar Sharif Cook','Cook,Omar','MNE',NULL),(134,'BFV','Alejandro Llorca Castillo','Llorca,Álex','ESP','Alexllorca1'),(92,'BGO','Bradley Scott Oleson Lashinski','Oleson,Brad','ESP','BradOleson24'),(64,'BGZ','Jaycee Don Carroll','Carroll,Jaycee','AZE','JayceeCarroll'),(7,'BHL','Venard Richard Hendrix','Hendrix,Richard','MKD','rhendrix35'),(8,'BIH','Eulis Rafael Báez Benjamín','Báez,Eulis','ESP','ecbaez13'),(101,'BIY','Ante Tomic','Tomic,Ante','HRV',NULL),(97,'BJX','Justin Joseph Doellman','Doellman,Justin','USA','J_Doellman'),(75,'BKB','Dejan Musli','Musli,Dejan','SRB','DejanMusli'),(74,'BLO','Daniel Díez de la Faya','Díez,Daniel','ESP','danidiez11'),(89,'D14','Patrik Auda','Auda,Patrik','CZE','Czechmeeout'),(113,'FO0','Eimantas Bendzius','Bendzius,Eimantas','LTU','Bendzius22'),(112,'FO1','Artem Pustovyi','Pustovyi,Artem','UKR',NULL),(70,'FO7','Jamar Desean Smith','Smith,Jamar','USA','Jamar_Smith309'),(49,'FOB','Tomeu Rigo Gual','Rigo,Tomeu','ESP','TomeuRigo'),(16,'FOI','Timothy James Abromaitis','Abromaitis,Tim','USA','timabro21'),(103,'FON','Stratos Perperoglou','Perperoglou,S.','GRC',NULL),(95,'FOS','Aleksandar Vezenkov','Vezenkov,A.','BGR',NULL),(132,'FOZ','David Earl Wear Jr','Wear,David','USA',NULL),(63,'FQ3','Jeffery Taylor','Taylor,Jeffery','SWE',NULL),(11,'FQ9','Darko Planinic','Planinic,Darko','HRV','darkoplaninic'),(129,'FQF','Jaka Blazic','Blazic,Jaka','SVN','JakaBlazic'),(5,'FQH','Anzejs Pasecniks','Pasecniks,Anzejs','LVA','anzejsp'),(114,'FSL','Alberto Díaz Ferreira','Díaz,Alberto','ESP','albertodiaz_98'),(38,'FXF','Bernat Vanaclocha Sánchez','Vanaclocha,Bernat','ESP','bernatvs12'),(76,'H07','Oliver Lafayette','Lafayette,Oliver','HRV',NULL),(143,'H09','Jonathan Beye Tabu Eboma','Tabu,Jonathan','BEL','Jontabs9'),(48,'H12','Bostjan Nachbar','Nachbar,Bostjan','SVN','BokiNachbar'),(4,'SCE','Oriol Paulí Fornells','Paulí,Oriol','ESP','oriolpauli7'),(39,'SDT','Edgar Vicedo Ayala','Vicedo,Edgar','ESP','edgarvicedo'),(78,'SHG','Alberto Díaz Ortiz','Díaz,Alberto1','ESP',NULL),(23,'SHU','Mamadou Ndiaye Niang','Niang,Mamadou','SEN','petitniang94'),(85,'T4X','Lluís Costa Martínez','Costa,Lluís','ESP','lluiscosta8'),(19,'T78','Nicolás Richotti','Richotti,Nicolás','ITA','nico_rchtt'),(139,'UAE','Ludvig Erik Hakanson','Hakanson,Ludde','SWE','ludde12'),(80,'UCV','Judicaël Romaric Belemene Dzabatou','Belemene,Romaric','COG','romaricbelemene'),(10,'Y1F','Xavier Rabaseda Bertrán','Rabaseda,Xavi','ESP','xavirabaseda22'),(90,'Y3V','Pere Tomàs Noguera','Tomàs,Pere','ESP','peretomas19'),(12,'Y49','Pablo Aguilar Bermúdez','Aguilar,Pablo','ESP','pabloaguilar34'),(106,'Y6X','Francisco Javier Cárdenas Maldonado','Cárdenas,Fran','ESP','4Cardenas');
/*!40000 ALTER TABLE `player_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_info`
--

DROP TABLE IF EXISTS `team_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_info` (
  `index` bigint DEFAULT NULL,
  `id` bigint NOT NULL,
  `acbid` text,
  `founded year` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_acb_team_info_index` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_info`
--

LOCK TABLES `team_info` WRITE;
/*!40000 ALTER TABLE `team_info` DISABLE KEYS */;
INSERT INTO `team_info` VALUES (1,1,'CLA',1963),(2,2,'EST',1948),(3,3,'BAS',1959),(4,4,'AND',1970),(5,5,'BAR',1926),(6,6,'SEV',1987),(7,7,'RON',1977),(8,8,'MAN',1931),(9,9,'FUE',1981),(10,10,'MAD',1931),(11,11,'CAN',1939),(12,12,'OBR',1970),(13,13,'BLB',2000),(14,14,'ZZA',2002),(15,15,'JOV',1930),(16,16,'MUR',1985),(17,17,'PAM',1986),(18,18,'GBC',2001),(19,19,'VAL',1976),(20,20,'ALI',1994),(21,21,'GRN',1994),(22,22,'MEN',1900),(23,23,'GIR',1962),(24,24,'LEO',NULL),(25,25,'BRE',1966),(26,26,'TNF',1996),(27,27,'LLE',1997),(28,28,'CAC',1961),(29,29,'GIJ',1982),(30,30,'TOR',1975),(31,31,'ORE',1979),(32,32,'HLV',NULL),(33,33,'SAL',NULL),(34,34,'ZAR',NULL),(35,35,'HUE',NULL);
/*!40000 ALTER TABLE `team_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-25 15:08:27
