-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: paket_wisata1
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id_booking` varchar(6) NOT NULL,
  `id_user` varchar(6) NOT NULL,
  `purchase_date` date NOT NULL,
  `date` date NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_booking`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('BKG001','usr001','0000-00-00','2020-07-08','TERKIRIM'),('BKG002','usr001','0000-00-00','2020-07-15','PERLU DIKIRIM'),('BKG003','usr001','0000-00-00','2020-07-30','PERLU DIKIRIM'),('BKG004','usr007','0000-00-00','2020-07-24','PERLU DIKIRIM'),('BKG005','usr001','0000-00-00','2020-07-17','TERKIRIM'),('BKG006','usr001','2020-07-30','2020-07-16','PERLU DIKIRIM');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_booking`
--

DROP TABLE IF EXISTS `detail_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_booking` (
  `id_booking` varchar(6) NOT NULL,
  `id_package` varchar(6) NOT NULL,
  `number_people` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `travel_dates` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id_booking`,`id_package`),
  KEY `id_package` (`id_package`),
  CONSTRAINT `detail_booking_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`),
  CONSTRAINT `detail_booking_ibfk_2` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_booking`
--

LOCK TABLES `detail_booking` WRITE;
/*!40000 ALTER TABLE `detail_booking` DISABLE KEYS */;
INSERT INTO `detail_booking` VALUES ('BKG001','PKT001',1,1111111111,'2020-07-08'),('BKG002','PKT003',1,2342,'2020-07-15'),('BKG003','PKT037',2,468,'2020-07-30'),('BKG004','PKT005',4,9381300,'2020-07-24'),('BKG005','PKT004',2,46904,'2020-07-17'),('BKG006','PKT005',5,11726625,'2020-07-16');
/*!40000 ALTER TABLE `detail_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id_district` varchar(6) NOT NULL,
  `name` varchar(40) NOT NULL,
  `geom` geometry DEFAULT NULL,
  PRIMARY KEY (`id_district`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES ('K01','Kecamatan Lubuk Kilangan',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0Í±¼«Y@€Ÿq\á@ğ¿`vOY@«7Uğ¿_´\ÇY@ú\ÒÛŸ‹ğ¿¦´ş–\0Y@\Şÿ\Ç	ğ¿È·w\rúY@\Şÿ\Ç	ğ¿³_wºóY@Y¿™˜.ğ¿1µ¥òY@m\Æiˆ*üï¿‘ñ(•ğY@i5$\î±ôï¿¯>ú\îY@Ø€q\å\ì\ï¿e¥I)\èY@R\Ò\Ã\Ğ\ê\äï¿²×»?\ŞY@•ºd#\Ù\ï¿è¾œ\ÙY@gd»\Ó\ï¿\ÕY-°\ÇY@\ÎQG\Ç\Õ\Èï¿– # \ÂY@\êŸ\æ\ä\Åï¿¦µil¯Y@|¹O\Äï¿\×\Ø%ªY@E(b\Ãï¿Š\ÍÇµ¡Y@µQd½\ï¿öÑ©+ŸY@„}»ï¿¯\"£’Y@¯?8Ÿº\ï¿Ù¯;\İyY@$G:#¯\ï¿À´¨OrY@A+0du«\ï¿ó\Òo_Y@ŒLÀ¯‘¤\ï¿A·—4FY@ 4\Ô(¤\ï¿\×\È\ì,Y@ªó¨ø¿£\ï¿¢|AY@%!‘¶ñ§\ï¿mş_u\äY@Ş\Û/Ÿ¬\ï¿ıgÍ¿Y@œi\Âö“±ï¿©h¬ıY@Y|E·\ï¿Ò°¨ˆY@ó\çÛ‚¥ºï¿¤7\ÜGnY@)!XU/¿\ï¿bô\ÜBWY@/¡‚\Ãï¿\í`\Ä>Y@.u×ƒ\Éï¿Œ\Ü\Ó\ÕY@£9²ò\Ëï¿¦}sõY@Aœ‡˜\Î\ï¿\æ\Ë°Y@}Xo\Ô\n\Óï¿»\Ğ\\§‘Y@zŠ\"n\Î\ï¿\ÜFxY@¡õğe¢\ï¿\Å<+i\ÅY@+‰\ìƒ,‹\ï¿\Üóüi£Y@Ü:\åÑ\ï¿\Ì\î\É\ÃBY@µ2\á—úy\ï¿,¨şAY@@3ˆ\ìx\ï¿\ëUdt@Y@‚”0\Óvï¿ˆ/EHY@¯A_zûs\ï¿D\Û1uWY@\éG\Ã)ssï¿\Î¥„Y@ú%\â­óo\ï¿\ÛkA\ïY@\ÓÀj\Øo\ï¿Xf,šY@·8K\Ér\ï¿5ñğ¤Y@—Çš‘An\ï¿\İ\'G¢Y@±\ZKXcï¿…^ŸY@\ÊlIFN\ï¿.\ã¦šY@«\éz¢\ëB\ï¿´­fY@\ÔÔ²µ>\ï¿\×g\Îú”Y@\ÒYùe0\ï¿z\áÎ…Y@Lm©ƒ¼\ï¿ùMa¥‚Y@˜¦pz\ï¿ü\ZI‚pY@gğ÷‹\Ù\ï¿ıh8enY@\Ø.m8,\rï¿«%\å`Y@n¢–\æV\ï¿„%ZY@gv‡\ï¿’“‰[Y@<Mf¼­ôî¿»”XY@P«”\é\î¿\Ò\âŒaNY@š&l?\ã\î¿\Â\ÂIš?Y@\ßo´\ã†\ßî¿ƒ‰?Š:Y@\0\ä„	£\Ù\î¿Õ¯t><Y@\Ï-t%\Õ\î¿)$™\Õ;Y@i\0o\Å\î¿=_³\\6Y@\Ô{*§½î¿¾PÀv0Y@&¨\á[X·î¿«”\é%Y@Š¾¢[¯\î¿/¾hY@„aÀ’«\î¿G\rY@\ÄÍ©d\0¨\î¿^ºIY@·\ìÿ°¥\î¿O\èõ\'ñ\ZY@[A\Ó+£\î¿\æ\Í\áZ\í\ZY@r5²+-£\î¿9Bò\ì\ZY@\è3 ŞŒš\î¿\âx>\ê\ZY@†\Ç~K‘î¿¯\ê¬\Ø\ZY@{®G\áz\î¿\ä1•ñ\ZY@#¼=y\î¿\Ú9\Í\í\ZY@\Ø*Á\âp\î¿CT\á\Ïğ\ZY@ ˜£\Ç\ïm\î¿<O<gY@–¨©ek\î¿ušY@–¨©ekî¿µ‰“ûY@}°Œ\r\İl\î¿j\ÙZ_$Y@²¸ÿ\Èthî¿“R\Ğ\í%Y@\ÚRh\î¿\ãÂ,Y@\ïs|´8c\î¿İ´§!Y@¼ \"5\íb\î¿q“QeY@\á´\àE_\î¿ÅŒğö Y@Ÿ;Áş\ë\\\î¿.Y\á&Y@\Ã9}=_\î¿OÊ¤†6Y@gÒ¦\êY\î¿xz¥,CY@\Ä\ê0Xî¿\ï‹KUY@\ãl:¸Y\î¿|\ÕÊ„_Y@™õb(\'Z\î¿OX\âeY@kŸ\ÇTî¿–\íC\ŞrY@\ÜK\Z£uT\î¿~T\Ã~Y@”4LkS\î¿(»™ÑY@ \'L\ÍJî¿·²Dg™Y@\n Y2G\î¿\0\ä„	£Y@\Z\á\íAH\î¿d[œ¥Y@½5°U‚E\î¿f\Ë-­Y@IVñF\î¿D÷¬k´Y@|¹OD\î¿£Ë›\ÃY@h=|™(Bî¿¼\Éo\Ñ\ÉY@\åZH@\î¿z¦—\ËY@¹\â\â¨\ÜD\î¿z3M\ØY@\0¼viC\î¿F$a\ßY@Šc\îZBî¿ƒ¤O«\èY@\\\Êùb\ïE\î¿S=™ôY@9\rQ…?C\î¿m8,\rüY@)\Ì{œiB\î¿b,\Ó/Y@yY|E\î¿\Õu¨¦$Y@ñ \ÙuoE\î¿\Ú\×3Y@~½p\çBî¿„\ÒBY@#0\Ö709\î¿gF?\ZNY@ü\á\ç¿/î¿£¯ \ÍXY@B°ª^~\'\î¿CsFZY@¼?Ş«V&\î¿b÷\ÃcY@m\â\ä~‡\"\î¿\ßO—nY@«x#ó\È\î¿Q\èyY@ŒdP3$\î¿B@¾„Y@ö{b*î¿¾‰!9™Y@ó<¸;k7î¿š\Ğ$±¤Y@\ßş\\4d<î¿Œ 1“¨Y@hz‰±L?\î¿\çp­ö°Y@ø¨¿^aA\î¿]S ³³Y@y7R¶H\î¿`ºY@ƒ/L¦\nFî¿_” ¿Y@Ã¸DkE\î¿Ğ¶šu\ÆY@›\ÖtB\î¿Gˆ,\ÒY@\Ë\Ø\Ğ\Íş@\î¿[(™œ\ÚY@Šÿ;¢Bî¿–w\Õ\æY@\ŞT¤\Â\ØBî¿¥/„œ÷Y@	MKJ\î¿]ûY@Um7Á7M\î¿\Ë\ÛNY@U[rP\î¿Ê§Ç¶Y@\â#bJ$Q\î¿\Ò\Ä\ÎY@úò\ì£Sî¿¤8GY@ò@d‘&^\î¿S—Œc$Y@Rd­¡\Ô^\î¿gïŒ¶*Y@\Ø›6c\î¿F\Ònô1Y@ºØ´Rdî¿±¥GS=Y@e\á\ëk]j\î¿(\'\ÚUHY@\äóŠ§i\î¿\ë0XY@m¬\Ä<+i\î¿Ç¼8dY@¸#œ¼h\î¿½\á>rY@«°\à‚l\î¿Ö«\È\è€Y@\Û\àDôkk\î¿\ê\Ï~¤ˆY@\ß3¡l\î¿rn\î•Y@_F±\Ü\Òjî¿\î v¦Y@\ÒRy;\Âi\î¿IIC«Y@Ôš\æ§hî¿®€¸«Y@K?ªa\î¿\äº)\åµY@\Âøi\\\î¿9´\Èv¾Y@Ô˜sIUî¿ŠO\È\ÎY@®ò\ÂNî¿ºJw\×\ÙY@\åš™E\î¿&5´\ØY@\Ë\Ø\Ğ\Íş@î¿•\Õt=\ÑY@Ï½‡K;\î¿1^óª\ÎY@ğ\Ü{¸\ä8î¿µ¤£\ÌY@±¨ˆ\ÓI6\î¿1^óª\ÎY@\ÒYùe0\î¿hXŒº\ÖY@¦¹\Âj,î¿”\Ûö=\êY@ı»>s\Ö\'\î¿”0\ÓöY@O\æ}“&î¿$A¸Y@;\äf¸\î¿)°\0¦Y@eT\Æ\İ î¿š@‹Y@B]\Â!\î¿\í·v¢$Y@w Nyt#\î¿ùN\Ìz1Y@¡ø1\æ®%\î¿=|™(BY@vˆ\Ø\Ò#î¿’•_cY@\'P\Ä\"†î¿¢›ırY@mŒğ\î¿\ìQ¸…Y@`>Y1\\\î¿n3\â‘Y@»\ì\×\î¿\'iş˜Y@¹\Ş6S!\î¿eÃšÊ¢Y@S ³³\è\î¿\î{\Ô_¯Y@\ÎÇµ¡b\î¿d¯w¼Y@°x²›\î¿Ó†\Ã\ÒÀY@j¾J>v\î¿G\çü\ÇY@\ÖT…]\î¿,õ,\åY@«^~§\Éî¿¬W‘\ÑY@\Ç*¥gz	\î¿X”†\ZY@}\åAz\n\î¿KXc\'Y@	ıL½n\î¿\æ\æ\Ñ=Y@d\Ëòu\î¿\Õ \Ì\í^Y@\×\Ûf*\Ä#\î¿sK«!qY@»d#\Ù#\î¿/÷\ÉQ€Y@!Ky \î¿l\ÎÁ3¡Y@2\é\ï¥ğ \î¿y7R¶Y@Y£¢\Ñ\î¿_]¨\ÅY@™\Êø÷\î¿ir1\ÖY@ŠXÄ°\Ã\î¿-\Î\æY@à½£Æ„\î¿kb¯\èY@cAJ\î¿]5\ÏùY@°x²›î¿¨9y‘	 Y@\â©i\î¿ô‹ô Y@®š\çˆ|\î¿t·\ë¥) Y@®\ï\ÃAB\î¿ô\ï9 Y@jûWVš\î¿ò”\Õt= Y@6.6­\î¿} y\çP Y@\Ñ\éy7\î¿\npU Y@|œi\Âö\î¿&\ßlsc Y@e¨Š©ô\î¿fLÁ\Zg Y@\é\r÷‘[î¿‡‰)x Y@\ëûp\î¿4€·@‚ Y@]‰@õî¿¼§> Y@ú(#.\0\rî¿½Œb¹¥ Y@9š#+¿\î¿Ç=—© Y@«vMHk\î¿\rı\\¬ Y@\Ü,^,\î¿\çp­ö° Y@y;\ÂiÁ\î¿\ØpA¶ Y@R\î>\ÇG\î¿V™)­¿ Y@p•\'v\nî¿¯–;3Á Y@!Ë‚‰?\nî¿±i¥\È Y@Eõ\ÖÀV	\î¿/…\Í Y@ºK\â¬\î¿\éc> \Ğ Y@‹\á\íA\î¿#.\0\Ò Y@ıõ\n\îî¿¯“\â\ã Y@¡J\Íh\î¿\0A€!Y@Š\è\×\ÖOÿ\í¿#M¼<!Y@28J^\ã\í¿k¸\È=!Y@\Ô\îW¾\Û\í¿hË¹W!Y@\Ú\ZŒƒ\Ë\í¿d°\âTk!Y@—Çš‘Á\í¿Gó!Y@x™a£¬\í¿-^,‘!Y@<i\á²\n›\í¿—Çš‘!Y@2U0*©“\í¿‘&\Ş!Y@ú(#.\0\í¿d=µ!Y@¦	\ÛO\Æx\í¿}YÚ©¹!Y@)\éahur\í¿¹‹0E¹!Y@€¹-@[\í¿¿b\r¹!Y@dY0ñGQ\í¿¿HhË¹!Y@\ëÿ\æK\í¿4÷ğ½!Y@\ÍÉ‹LÀ/\í¿†7kğ¾!Y@–?\ß,\í¿	\â<œÀ!Y@Ÿ\æ\äE&\í¿y;\ÂiÁ!Y@8/N|µ#\í¿rö´\Ã!Y@˜§sE)!\í¿c`\Ç!Y@`>Y1\\\í¿\æ–VC\â!Y@DÜœJ\0\í¿„d\"Y@d@öz÷\Ç\ì¿~$A\"Y@,€)´\ì¿;*\"Y@aºÙŸì¿«\éz¢\ë\"Y@øŒDh›\ì¿È–\å\ë2#Y@`?\Ä§\ì¿\'¢_[#Y@J±£q¨\ì¿P\à|z#Y@\Ó\Ş\à“©\ì¿*Wx—‹#Y@¯\Ì[uªì¿¸¯\çŒ#Y@-—\Îù©ì¿¥ö\"Ú#Y@µ¦yÇ©\ì¿ğ\à\' #Y@\'\ÛÀ¨ì¿ l\Ê\Ş#Y@ 5?şÒ¢\ì¿\Ü/Ÿ¬$Y@úA]¤P–\ì¿xò\é±-$Y@kF¹‹°\ì¿)!XU/$Y@3\á—úy\Óì¿œ¼\è+$Y@.‘\Î\à\ï\ì¿W˜¾\×$Y@YŠ\ä+\í¿?\å˜,\î#Y@W#»\Ò2\í¿a\Ú9\Í#Y@\â\"÷tuG\í¿\î\ÌÃ¹#Y@sGÿËµh\í¿ƒö\ê\ã¡#Y@mXSYv\í¿\Ï\×,—#Y@gš°ıdŒ\í¿mt\ÎOq#Y@$C­gˆ\í¿\ä„	£Y#Y@”„D\ÚÆŸ\í¿ô\ï9#Y@3d’‘³\í¿\Ğìº·\"#Y@úD$]³\í¿…};‰#Y@Yö$°¹\í¿\è K8ô\"Y@Aó9w»\Ş\í¿¹«W‘\Ñ\"Y@…?Ã›5ø\í¿\'¾\ÚQœ\"Y@!w¦(\î¿5F\ë¨j\"Y@\ætYLl>\î¿Ä˜ô÷R\"Y@«‘]i\î¿\Ë\×eøO\"Y@‚ÿ‚€\î¿Í*ŠW\"Y@b¼\æU\î¿UÁ¨¤N\"Y@¡£U-\é¨\î¿ Õ°\ß\"Y@¥j»	¾\éî¿…#H¥\Ø!Y@\ÜIDøA\ï¿erjg˜!Y@òC¥3{\ï¿\ã\ÄW;Š!Y@Ï ¡‚‹\ï¿\Üb~nh!Y@–Ì±¼«\ï¿\Ö\0¥¡F!Y@ù,Ïƒ»³\ï¿\é_’\Ê!Y@¶×‚\Ş\Ã\ï¿y•µMñ Y@xB¯?‰\Ï\ï¿m­/\Ú Y@\æ!S>\Õï¿›\Ó– Y@ iQŸ\ä\ï¿\É;‡2T Y@”‚Uõò\ï¿·˜Ÿ Y@Ç»#cµù\ï¿&¦±úY@QO?ü\ï¿6!­1\èY@x– # ğ¿vk™\ÇY@\Í\í)ğ¿Ë¿–W®Y@¸ [–¯ğ¿À%\0ÿ”Y@\'0\Ömğ¿ò(•ğ„Y@¹\ZÙ•–ğ¿\Å6©hY@\ïY\×h9ğ¿>\Ğ\nYY@#i7ú˜ğ¿š´©ºGY@X\0Sğ¿›\å²\Ñ9Y@¸¬\Âf€ğ¿`\äeM,Y@\n×£p=\nğ¿Í±¼«Y@€Ÿq\á@ğ¿Í±¼«Y@€Ÿq\á@ğ¿Í±¼«Y@€Ÿq\á@ğ¿'),('K02','Kecamatan Pauh',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0K\0\0;8Ø›$Y@E¡e\İ?–\ì¿;8Ø›$Y@E¡e\İ?–\ì¿\Ü/Ÿ¬$Y@úA]¤P–ì¿ l\Ê\Ş#Y@ 5?şÒ¢\ì¿ğ\à\' #Y@\'\ÛÀ¨ì¿¥ö\"Ú#Y@µ¦yÇ©ì¿¸¯\çŒ#Y@-—\Îù©\ì¿*Wx—‹#Y@¯\Ì[uª\ì¿P\à|z#Y@\Ó\Ş\à“©\ì¿\'¢_[#Y@J±£q¨\ì¿È–\å\ë2#Y@`?\Ä§ì¿«\éz¢\ë\"Y@øŒDh›\ì¿;*\"Y@aºÙŸ\ì¿~$A\"Y@,€)´\ì¿„d\"Y@d@öz÷\Ç\ì¿\æ–VC\â!Y@DÜœJ\0\í¿c`\Ç!Y@`>Y1\\\í¿¬\à·!\Æ!Y@¢Òˆ™}\í¿rö´\Ã!Y@˜§sE)!\í¿y;\ÂiÁ!Y@8/N|µ#\í¿	\â<œÀ!Y@Ÿ\æ\äE&\í¿†7kğ¾!Y@–?\ß,\í¿4÷ğ½!Y@\ÍÉ‹LÀ/\í¿¿HhË¹!Y@\ëÿ\æK\í¿¿b\r¹!Y@dY0ñGQ\í¿¹‹0E¹!Y@€¹-@[\í¿}YÚ©¹!Y@)\éahur\í¿d=µ!Y@¦	\ÛO\Æx\í¿‘&\Ş!Y@ú(#.\0\í¿—Çš‘!Y@2U0*©“\í¿-^,‘!Y@<i\á²\n›\í¿Gó!Y@x™a£¬\í¿d°\âTk!Y@—Çš‘Á\í¿hË¹W!Y@\Ú\ZŒƒ\Ë\í¿k¸\È=!Y@\Ô\îW¾\Û\í¿#M¼<!Y@28J^\ã\í¿\0A€!Y@Š\è\×\ÖOÿ\í¿¯“\â\ã Y@¡J\Íh\î¿#.\0\Ò Y@ıõ\n\î\î¿\éc> \Ğ Y@‹\á\íA\î¿/…\Í Y@ºK\â¬\î¿WĞ´\Ä\Ê Y@\\…zúî¿±i¥\È Y@Eõ\ÖÀV	î¿¯–;3Á Y@!Ë‚‰?\n\î¿vQôÀ Y@|›ş\ìG\n\î¿V™)­¿ Y@p•\'v\n\î¿\ØpA¶ Y@R\î>\ÇG\î¿\çp­ö° Y@y;\ÂiÁ\î¿\rı\\¬ Y@\Ü,^,\î¿Ç=—© Y@«vMHkî¿\ÆÁ¥ Y@f‚\á\\\Ãî¿¼§> Y@ú(#.\0\r\î¿4€·@‚ Y@]‰@õî¿‡‰)x Y@\ëûp\î¿fLÁ\Zg Y@\é\r÷‘[\î¿&\ßlsc Y@e¨Š©ô\î¿\npU Y@|œi\Âö\î¿} y\çP Y@\Ñ\éy7\î¿ò”\Õt= Y@6.6­\î¿ô\ï9 Y@jûWVš\î¿t·\ë¥) Y@®\ï\ÃAB\î¿ô‹ô Y@®š\çˆ|î¿¨9y‘	 Y@\â©i\î¿]5\ÏùY@°x²›\î¿kb¯\èY@cAJ\î¿-\Î\æY@à½£Æ„\î¿ir1\ÖY@ŠXÄ°\Ã\î¿_]¨\ÅY@™\Êø÷\î¿y7R¶Y@Y£¢\Ñ\î¿l\ÎÁ3¡Y@2\é\ï¥ğ \î¿/÷\ÉQ€Y@!Ky \î¿sK«!qY@»d#\Ù#\î¿\Õ \Ì\í^Y@\×\Ûf*\Ä#\î¿\æ\æ\Ñ=Y@d\Ëòu\î¿KXc\'Y@	ıL½n\î¿X”†\ZY@}\åAz\nî¿¬W‘\ÑY@\Ç*¥gz	\î¿,õ,\åY@«^~§\É\î¿G\çü\ÇY@\ÖT…]\î¿Ó†\Ã\ÒÀY@j¾J>v\î¿d¯w¼Y@°x²›\î¿\î{\Ô_¯Y@\ÎÇµ¡b\î¿eÃšÊ¢Y@S ³³\è\î¿\'iş˜Y@¹\Ş6S!\î¿n3\â‘Y@»\ì\×\î¿\ìQ¸…Y@`>Y1\\î¿¢›ırY@mŒğî¿’•_cY@\'P\Ä\"†\î¿=|™(BY@vˆ\Ø\Ò#\î¿ùN\Ìz1Y@¡ø1\æ®%\î¿\í·v¢$Y@w Nyt#î¿š@‹Y@B]\Â!\î¿)°\0¦Y@eT\Æ\İ î¿$A¸Y@;\äf¸\î¿”0\ÓöY@O\æ}“&î¿”\Ûö=\êY@ı»>s\Ö\'\î¿hXŒº\ÖY@¦¹\Âj,\î¿\ÚV³\ÎY@\ÒYùe0î¿©ö\éx\ÌY@¸[’v5î¿b\Õ \ÌY@±¨ˆ\ÓI6\î¿1^óª\ÎY@ğ\Ü{¸\ä8î¿•\Õt=\ÑY@Ï½‡K;\î¿&5´\ØY@\Ë\Ø\Ğ\Íş@î¿ºJw\×\ÙY@\åš™Eî¿ŠO\È\ÎY@®ò\ÂN\î¿9´\Èv¾Y@Ô˜sIU\î¿\äº)\åµY@\Âøi\\î¿®€¸«Y@K?ªa\î¿IIC«Y@Ôš\æ§hî¿\î v¦Y@\ÒRy;\Âi\î¿rn\î•Y@_F±\Ü\Òj\î¿\ê\Ï~¤ˆY@\ß3¡l\î¿Ö«\È\è€Y@\Û\àDôkk\î¿½\á>rY@«°\à‚l\î¿Ç¼8dY@¸#œ¼h\î¿\ë0XY@m¬\Ä<+i\î¿(\'\ÚUHY@\äóŠ§iî¿±¥GS=Y@e\á\ëk]j\î¿F\Ònô1Y@ºØ´Rd\î¿gïŒ¶*Y@\Ø›6c\î¿S—Œc$Y@Rd­¡\Ô^î¿¤8GY@ò@d‘&^\î¿\Ò\Ä\ÎY@úò\ì£S\î¿Ê§Ç¶Y@\â#bJ$Q\î¿\Ë\ÛNY@U[rP\î¿]ûY@Um7Á7Mî¿¥/„œ÷Y@	MKJî¿–w\Õ\æY@\ŞT¤\Â\ØB\î¿[(™œ\ÚY@Šÿ;¢B\î¿Gˆ,\ÒY@\Ë\Ø\Ğ\Íş@\î¿Ğ¶šu\ÆY@›\ÖtBî¿_” ¿Y@Ã¸DkE\î¿`ºY@ƒ/L¦\nF\î¿]S ³³Y@y7R¶H\î¿\çp­ö°Y@ø¨¿^aAî¿Œ 1“¨Y@hz‰±L?î¿š\Ğ$±¤Y@\ßş\\4d<î¿¾‰!9™Y@ó<¸;k7\î¿B@¾„Y@ö{b*\î¿Q\èyY@ŒdP3$\î¿\ßO—nY@«x#ó\È\î¿b÷\ÃcY@m\â\ä~‡\"\î¿CsFZY@¼?Ş«V&î¿£¯ \ÍXY@B°ª^~\'\î¿gF?\ZNY@ü\á\ç¿/î¿„\ÒBY@#0\Ö709\î¿\Ú\×3Y@~½p\çB\î¿\Õu¨¦$Y@ñ \ÙuoE\î¿b,\Ó/Y@yY|E\î¿m8,\rüY@)\Ì{œiB\î¿S=™ôY@9\rQ…?Cî¿ƒ¤O«\èY@\\\Êùb\ïE\î¿F$a\ßY@Šc\îZB\î¿z3M\ØY@\0¼viC\î¿z¦—\ËY@¹\â\â¨\ÜDî¿¼\Éo\Ñ\ÉY@\åZH@\î¿£Ë›\ÃY@h=|™(B\î¿D÷¬k´Y@|¹OD\î¿f\Ë-­Y@IVñF\î¿d[œ¥Y@½5°U‚E\î¿\0\ä„	£Y@\Z\á\íAHî¿·²Dg™Y@\n Y2G\î¿(»™ÑY@ \'L\ÍJ\î¿~T\Ã~Y@”4LkSî¿–\íC\ŞrY@\ÜK\Z£uT\î¿OX\âeY@kŸ\ÇT\î¿|\ÕÊ„_Y@™õb(\'Zî¿\ï‹KUY@\ãl:¸Y\î¿xz¥,CY@\Ä\ê0X\î¿OÊ¤†6Y@gÒ¦\êY\î¿.Y\á&Y@\Ã9}=_\î¿ÅŒğö Y@Ÿ;Áş\ë\\\î¿q“QeY@\á´\àE_\î¿İ´§!Y@¼ \"5\íb\î¿\ãÂ,Y@\ïs|´8cî¿“R\Ğ\í%Y@\ÚRh\î¿j\ÙZ_$Y@²¸ÿ\Èth\î¿q“QeY@<…\\©g\î¿÷[;QY@¦\Öûv\\\î¿>\èÙ¬ú\ZY@Ár„\äY\î¿ôûş\Í\ZY@P\Æø0{Yî¿›X\à+º\ZY@N¶;P\î¿u’­.§\ZY@óUò±»@î¿£@ŸÈ“\ZY@¶+ôÁ26\î¿*¬ÿs\ZY@‡ûÈ­I7\î¿7Â¢\"N\ZY@ÿYó\ã/-î¿½\ßh\Ç\r\ZY@h$B#\Ø8î¿Ÿ\â8ğY@ŒƒKG\î¿=IºfòY@Á8¸tL\î¿	§/úY@$cµùU\î¿\×\Ü\ÑY@4œ27_î¿Œi¦{Y@$\'·\nb\î¿?\æY@±\ÄÊ¦\\\î¿8¤Q“Y@¬p\ËGRR\î¿ß‰Y/†Y@x\íÒ†\ÃR\î¿ _B‡Y@kIG9˜M\î¿\ÉuS\ÊkY@\î>\ÇG‹3\î¿\Ú;£­JY@\Ñ=\ë\Z-î¿½Ç™&lY@,¼\ËE|\'î¿…A™Y@RñGT(\î¿\Ğb)’¯Y@Èš‘A\î\"\î¿\àe†²Y@±û\á±î¿¸Z\'.\ÇY@¨\0Ï !î¿š^b,\ÓY@z\Â(\î¿÷Xú\ĞY@q\Æ0\'h\î¿\0Q¡ºY@\á+Ù±î¿™¼f¾Y@Y¤‰w\0\î¿ñğ\ËY@,cC7û\í¿\à¼8ñ\ÕY@t]‰@õ\í¿¤#\Ö\âY@¿‚4c\Ñô\í¿\Ùƒk\îY@±‰\Ì\\\àò\í¿z4Õ“ùY@9\nğ\í¿ï®³!ÿY@„KÇœg\ì\í¿b,\Ó/\ZY@ÁtZ·A\í\í¿ş\î5&\ZY@¥‚Šª_\é\í¿Ÿp]1\ZY@PŠV\î\æ\í¿\Æ¬q6\ZY@1\ïq¦	\Û\í¿r£\ÈZC\ZY@\Ï.\ßú°\Ş\í¿[wóT\ZY@`\ÊÀ-\İ\í¿\ß€c\ZY@\ãósC\Ó\í¿ñe¢©\ZY@rQ-\"Š\É\í¿\Ól‡Á\ZY@”3w¼\É\í¿	\â<œÀ\ZY@;m\ÆÁ\í¿²eùº\ZY@}\è‚ú–¹\í¿>	l\ÎÁ\ZY@\êD²\í¿– # \Â\ZY@ü6\ÄxÍ«\í¿Eh\æ\É\ZY@ó\å\ØG§\í¿im\Z\Û\ZY@5bfŸÇ¨\í¿J´\äñ\ZY@r6Ü¬\í¿©¾ó‹Y@;S\è¼Æ®\í¿ıl\äº)Y@$´\å\\Š«\í¿S±1¯#Y@\ÈEµˆ(¦\í¿+£‘\Ï+Y@±ûá±Ÿ\í¿õ»°5Y@\é\ÑTO\æŸ\í¿Û‰’HY@mt\ÎOqœ\í¿	1—TY@¼>sÖ§œ\í¿:\ÏØ—lY@\âr¼Ñ“\í¿·\r£ xY@\0kÕ®‰\í¿½ş$>wY@\0«#G:ƒ\í¿f£s~ŠY@¼\"ø\ßJv\í¿mp–Y@DÔ·\Ìi\í¿¾İ’°Y@š%jjY\í¿/…Í®Y@ø¬8U\í¿\á³up°Y@E>‘\'I\í¿\Ãf€²Y@\Äy8\é4\í¿š\Í\ã0˜Y@zVÒŠo(\í¿B•šY@“\İJ\n\í¿\æ}“¦Y@4fõ\í¿ô‰<IºY@=»|\ë\Ãú\ì¿KVE¸\ÉY@#…–õ\ì¿~\äÖ¤\ÛY@\ÔDŸ2\â\ì¿úÔ±J\éY@J\íE´\Ó\ì¿\ß\â\á=Y@—ª´\Å5¾\ì¿S—Œc$Y@°\å•\ëm³\ì¿0,¾-Y@\Í\È w¦\ì¿\î<0Y@Ze¦´ş–\ì¿\â\È‘EY@§wñ~\Ü~\ì¿jP4`Y@©eo)gì¿”\Ù “ŒY@z\Ç):’K\ì¿=°S¬Y@’XR\î>G\ì¿şµ¼r½Y@¹\áw\Ó-;\ì¿u=\Ñu\áY@g­‡/ì¿®¼\äòY@\Æiˆ*ü\ì¿\\\ÆúY@u\ç‰\çl\ì¿!ºöY@œ\Ä °r\èë¿\ÖmPûY@&Rš\Í\ã°\ë¿__\ëR#Y@œ\Ş\Åûq\ë¿İ¶\ïQY@³B‘\î\ç\ë¿oÅY@\Ã,´sš\ë¿\ÖÈ®´ŒY@bÀ’«Xü\ê¿3\ÂÛƒY@Ì¸©\æó\ê¿/\İ$Y@\ërJ@L\Â\ê¿\×h9\ĞCY@ 5?şÒ¢\ê¿\é\n¶OY@¹oµN\\ê¿±\ß\ëTY@õei§\ær\ê¿j¾J>vY@\åñ´üÀU\ê¿6«>W[Y@ªa¿\'\Ö)\ê¿\Ğw.Y@™g%­øê¿ªCn†Y@W@¡>ê¿¦	\ÛO\ÆY@QMI\Ö\á\èé¿Ÿ6\ç\àY@°WXp?\àé¿ˆ®}Y@\Ä\ê0\Ø\é¿I¼<+Y@G\ãP¿\Ûé¿\ìJ\ËHY@«\ëPMI\Ö\é¿\Z\İA\ìLY@B\Îûÿ¸\é¿x\Ò\ÂeY@\æ\ØG§®é¿#½¨Y@¶¼r½m¦\é¿š²\ÓY@.9(a¦\é¿>°\ã¿@Y@ÀŸ\é¿…Ì•AY@hv\İ[‘˜é¿…%P6Y@d\Ì]KÈ‡\é¿\\\Ëd8Y@Z¸¬\Âf€é¿Š\0§wñY@%!‘¶q\é¿36t³? Y@`\å\Ğ\"\Ûy\é¿†:¬p Y@	4\Ø\Ôy\é¿\Õ\è\Õ\0¥ Y@ª›‹¿m\é¿òy\ÅS Y@”ö_˜L\é¿Xs€` Y@¿\'Ö©ò=\é¿Î‰=´!Y@Ot	‡\é¿õei§\æ!Y@²¾É¢é¿œ†¨ÂŸ\"Y@?Vğ\Û\ã\é¿è¾œ\Ù\"Y@UJ\Ïô\ê¿> Ğ™´\"Y@òxZ~\à*ê¿š>;\àº\"Y@\åb¬\ãxê¿¦GS=™\"Y@Œº\ÖŞ§ª\ê¿\ÅW;Šs\"Y@\Şæ“Â¼\ê¿fKVE¸\"Y@ƒ0º¼\ê¿\ËÇº¸\"Y@ƒÁ5wô¿\ê¿\Ô\Õ‹m\"Y@¥»\ëlÈ¿\ê¿gš°ıd\"Y@_B‡\Äê¿£°‹¢\"Y@\0ÿ”*Qö\ê¿?q\0ı!Y@\Şs`9B\ë¿´W\"Y@-\ê“\Üa\ë¿C\Å8\"Y@ù*8¼ \ë¿\Øb·\Ï*\"Y@ıgÍ¿4ë¿”€F\"Y@&«\"\ÜdTë¿–\ê^f\"Y@pÎˆ\Ò\Ş`\ë¿ó:\â\"Y@{m\Ç\Ô]\ë¿{À<d\Ê\"Y@kb¯\èVë¿±‰\Ì\\\à\"Y@f\Øñ_\ë¿Gu:õ\"Y@\Útp³xë¿£!\ãQ*#Y@Z€¶Õ¬³ë¿­P¤û9#Y@<Ÿõf\Ô\ë¿\ßÄœL#Y@o»\ìë¿·$\ìj#Y@\áBÁì¿±‡ö±‚#Y@Š‘%s,\ì¿ØY #Y@	ˆI¸G\ì¿Dú\í\ëÀ#Y@)\Ğ\'ò$i\ì¿\Ôñ˜\Ê#Y@œ‰\éB¬~ì¿§@fg\Ñ#Y@ ‡\Ú6Œ‚\ì¿;8Ø›$Y@E¡e\İ?–\ì¿'),('K03','Kecamatan Padang Selatan',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00\0\0¶HÚ>Y@Œ¢>«ğ¿¶HÚ>Y@Œ¢>«ğ¿¶HÚ>Y@Œ¢>«ğ¿\"\â\æT2Y@d\è\ØA¥ğ¿|G	1Y@pÎˆ\ÒŞ ğ¿Üµ\Û.Y@M£\É\Å˜ğ¿ûõ\×+Y@\'iş˜–ğ¿¡¹N#-Y@>”ğ¿\0\ÅÈ’9Y@şE>‘ğ¿•\Öÿ9Y@>\íğ\×dğ¿nN%@Y@ôú“øÜ‰ğ¿B\"m\ãOY@²/\Ùx°…ğ¿]¿`7lY@\0\áC‰–|ğ¿¶%!‘Y@2Xqªµpğ¿2U0*©Y@ü‹ 1“hğ¿^»´\á°Y@Š\å–VCbğ¿§\Ï¸®Y@}\Ír\Ù\è\\ğ¿?QÙ°Y@3Œ»A´Vğ¿x\Ğìº·Y@>Tğ¿‡ˆ›S\ÉY@iQŸ\äNğ¿\Ç\Ö\Æ\ØY@`\æ;øIğ¿hA(\ï\ãY@	pz\ïGğ¿|eŞª\ëY@…w¹ˆ\ïDğ¿÷.9\îY@„\Ù–?ğ¿F\'K­÷Y@‚Uõò;ğ¿Á\àš;úY@::®F6ğ¿\ësµûY@ByG3ğ¿O\ë6¨ıY@´Ø€1ğ¿ıI|\îY@-²\ï\'ğ¿Ê¤†6\0Y@\'õei§&ğ¿\ê%\Æ2ıY@\Å:U¾g$ğ¿\Æûqû\åY@ ğ¿\ÕyTü\ßY@h[\Í:#ğ¿]\Ş®\ÕY@‰`\\:&ğ¿\ÈTÆ¿Y@¼?Ş«V&ğ¿^¡–±Y@2 {½û#ğ¿v\ãİ‘±Y@/3l”õğ¿\È	F³Y@’ğ¿û®ş·Y@4¼Yƒ÷ğ¿\áÓœ¼\ÈY@bùómÁğ¿\×ÁÁ\Ş\ÄY@¸\ê:TSğ¿Zº‚m\ÄY@¯%äƒ\rğ¿\ÈC\ß\İ\ÊY@t\Ğ%zğ¿_x%\ÉY@¢\rÀDğ¿…\Ï\ÖÁY@2kœMğ¿7\ê°\ÂY@QôÀ\Ç`ğ¿É@¼Y@\ÚuoEbğ¿1$\'·Y@<£­J\"û\ï¿\Æm4€·Y@Ù™B\ç5ö\ï¿$ñòt®Y@Hj¡dr\ê\ï¿j2\ãm¥Y@\Ã\Ó+e\â\ï¿\Õ\è\Õ\0¥Y@@\Ûj\Ö\ß\ï¿c™~‰Y@e\Ä \Ñ\ï¿n\î•yY@M¢^ği\Îï¿¸u7OuY@¢]…”Ÿ\Ôï¿·\í{\Ô_Y@\é,³\Å\Öï¿Zaú^Y@ú¶`©.\à\ï¿\ã4ôOY@ÿ	.V\Ô\à\ï¿9a\ÂhVY@6t³?P\î\ï¿\ì¿\ÎMY@6t³?P\î\ï¿öµ.5BY@ñ»\é–\â\ï¿\Ç.Q½5Y@28J^\ã\ï¿46<Y@fO›sğ\ï¿ñ[z4Y@J³yó\ï¿¯²¶)Y@\Öa°\ä\ï¿rp\é˜óY@k¹3\ç\ï¿{úü\áY@qªµ0\í\ï¿6\Êú\Í\ÄY@ı1­Mcû\ï¿¿›n\ÙY@!u;û\Êğ¿d*\ã\ßY@jg˜\ÚRğ¿X9´\ÈY@^h®\ÓHğ¿¼[Y¢³Y@‘}eÁğ¿\î•y«Y@«”\é%ğ¿¯\îXl“Y@Š \Î\Ã	ğ¿	\Z3‰zY@\Ôa…[>ğ¿\ÌbbóqY@-@\Ûjğ¿\ì£SWY@\é\ï¥ğ ğ¿\èˆ|—RY@·C\Ãbğ¿W]‡jJY@–é—ˆ·ğ¿§°RAEY@|Ò‰S\rğ¿ğÄ¬CY@M÷:©/ğ¿‚;P§<Y@\Ã\××º\Ôğ¿«\Îj=Y@D2\ä\Øzğ¿\×4\ï8EY@1Bx´qğ¿‡\á#bJY@Ï‡g	2ğ¿¼Yƒ÷UY@e¦´ş–\0ğ¿(vŠUY@gCş™Aü\ï¿÷=\ê¯WY@ö\ëNwø\ï¿\å\ì\ÑVY@ôMšEó\ï¿k¸\È=]Y@‚X6sH\ê\ï¿uÊ£aY@µmÁ\ã\ï¿PU¡XY@6\È$#g\á\ï¿e\Ä QY@ÿ°¥G\Ó\ï¿?\ÇG‹3Y@\0u\Ş\Éï¿‰&P\Ä\"Y@\ìL¡ó\Z»\ï¿a\Ş\ãLY@«\Ğ@,›¹ï¿½8dY@\Û\ÂóR±±\ï¿\äN\é`ıY@\É!\â\æT²\ï¿DkE›\ãY@ŠZš[!¬\ï¿mş_u\äY@ÿ\ëÜ´§ï¿›7N\nóY@pA¶,_—\ï¿øo^œøY@.¬ïŒï¿…zúüY@\Õ\Í\Å\ßö„\ï¿\éñ{›şY@\Ï\ÜC\Â÷~\ï¿\á²\n›Y@<ø‰\èw\ï¿\Õê««Y@\É&p\ën\ï¿o½¦Y@›¬Q\Ñh\ï¿òµg–Y@0-\ê“\Üa\ï¿\êvö•Y@\ç:´T^\ï¿\Ù%ª·Y@şš¬QQ\ï¿N\ÒüY@“E\Ö\ZJ\ï¿	`\ãúY@\İ$•C\ï¿ü\ÄôY@Z,Eò•@\ï¿b‡1\é\ïY@\İ\Ì\nE:\ï¿DQ O\äY@D„4\ï¿ú\Ñp\Ê\ÜY@t{Ic4ï¿¢·xx\ÏY@\'µ¿3\ï¿T\â:\ÆY@kF¹‹0\ï¿?‹¥H¾Y@º«?\Â0\ï¿ıJ\çÃ³Y@º«?\Â0\ï¿r¨ß…­Y@À\èò\æp-ï¿“ß¢“¥Y@!«[=\'\ï¿\Ú “ŒœY@F}’;l\"ï¿¡c•Y@~\åAzŠ\ï¿)	‰´Y@(*\ÖT\ï¿M¶ŸŒY@1·{¹Oï¿fv‡Y@¸\é\Ï~¤\ï¿#\Æ‚Y@*\Æù›P\ï¿sh‘\í|Y@÷\Ç{\Õ\Ê\ï¿ñ[zY@ª‚QI\0ï¿œ\Ş\ÅûqY@ª‚QI\0\ï¿\Û\àDôkY@+\İ]gCşî¿ªñ\ÒMbY@†pÌ²\'ï¿³{ò°PY@Y32\È]\ï¿Eò•@JY@…\ëQ¸\ï¿%•CY@aN\Ğ&\ï¿L\Æ1’=Y@$€›Å‹ï¿¦+\ØF<Y@\èÛ‚¥º\0ï¿µÆ BY@\ÆNx	Nıî¿‰}(FY@\Ñy]¢úî¿¯\Ò\İu6Y@£#¹ü‡ô\î¿>“ıó4Y@­N\ÎP\Üñ\î¿oe‰\Î2Y@d\\qqT\î\î¿4\"1Y@\Zj’\Ì\êî¿¼Ñ“2Y@\×OÿYó\ãî¿–B —8Y@\Û\İt\ß\î¿ùõCY@*T7\Û\î¿&‹ûLY@=)“\Z\Úî¿&3\ŞVY@ª~¥ó\á\Ù\î¿5Cª(^Y@\ß1<ö³\Ø\î¿z9\ì¾cY@¸\Ìé²˜\Ø\î¿Ğ€z3jY@3O®)\Ùî¿³Ò¤tY@ƒ‡i\ß\Ü\î¿÷\È\æªyY@\Û÷¨¿^\á\î¿\ØG§®|Y@t´ª%\å\î¿	\Z3‰zY@½¦¥\è\î¿£ x|Y@\Å­\êî¿¹\Æg²Y@\Êo\Ñ\ÉR\ë\î¿3#…Y@õ÷Rx\Ğ\ì\î¿\í\Ö2Y@²öw¶G\ï\î¿[`‰”Y@C=}şğ\î¿OIŸY@ZHÀ\èò\î¿?:u\å³Y@`wºó\Äó\î¿L§u\ÔY@U¿\Òùğ\î¿CV¸\åY@²KTo\r\ìî¿«w¸\ZY@—uX\áî¿ª\î‘\ÍUY@[^¹\Ş6\Óî¿—\Ê\ÛNY@Gó\Î\î¿\\\ætYLY@y\ËÕ\Í\î¿\ã\â¨\ÜDY@:“6U÷\È\î¿6:\ç§8Y@usñ·=Á\î¿s ‡\Ú6Y@fJ\ëo	Àî¿½6+1Y@e¸u·\î¿[[x^*Y@I¹û­î¿Ÿ\Éşy\ZY@\ï\ç\äg£\î¿	MY@6‘™\\\î¿]‰@õY@m\áy©Ø˜\î¿p\\\ÆM\rY@W—Sb’\î¿0¡‚\ÃY@t{Ic´\î¿\ç¦\Í8\rY@„f×½‰\î¿:\èY@O \ì«†\î¿]£\å@Y@T\Ç*¥gz\î¿\Å8\nY@Kvl\âu\î¿\ÏJZñ\rY@5\ï8EGr\î¿\Û2\à,Y@\Ê\İ\çøhqî¿¦_\"\Ş:Y@\í×\î<q\î¿\ÃGÄ”HY@S®ğ.q\î¿Y|^Y@5Dşo\î¿U[rY@-\Î\æm\î¿2g—Y@sò\"ğk\î¿\æ\èñ{›Y@	Œõ\rLn\î¿\É6‘™Y@\ÄZ|\n€q\î¿\æ\Ë°Y@*\0ª¸q\î¿øXY@<£­J\"{\î¿0.Ui‹Y@½Â‚û\î¿\á%8õY@T8‚TŠ\î¿Ú«‡Y@HnMº-‘\î¿=a‰”Y@.py¬™\î¿V*¨¨Y@`\é|x– \î¿\Ù&µY@K“R\Ğ\í¥\î¿\ÖS«¯®Y@À=ÏŸ6ª\î¿k¸¯Y@“\05µl­\î¿\Ù&µY@_#I®\î¿\íJ\ËH½Y@\Ô|•|\ì®\î¿C’Y½\ÃY@ò¶\Òk³±\î¿Ôº\rj¿Y@¸®˜Ş\î¿~sõ¸Y@”ƒ\Ù–\î¿C=·Y@4/‡\İwŒ\î¿\rQ…?\ÃY@È–\å\ë2|\î¿t#,*\âY@nˆñšWu\î¿^ñ\Ô#\rY@\Ó/o\î¿n÷rŸY@\ÑvLİ•\î¿Dªb*Y@)[$\íFŸ\î¿>°\ã¿@Y@1\Óö¯¬´\î¿n…°\ZKY@¤\ãjdW\Ú\î¿­jIY@B“Ä’r÷\î¿\nô‰<IY@6\å\n\ïr\ï¿\Ó0|DLY@Z\Êû8\Z\ï¿KÌ³’VY@ø¤	¦\Zï¿™\Ô\Ğ`Y@œŒ*Ã¸\ï¿õIî°‰Y@\ßPøl\ï¿fô£\á”Y@\ê?k~ü%\ï¿G¬Å§Y@\\•›¨%\ï¿YLl>®Y@c‚V5\ï¿,›9$µY@/ûu§;O\ï¿õ\×+,¸Y@\æ=\Î4a\ï¿)\ËÇºY@.ÿ!ıöu\ï¿wg\í¶Y@õø\Ã\Ï\ï¿Zc\Ğ	¡Y@…\è8’\ï¿B™F“‹Y@]‰@õ¢\ï¿3\ÂÛƒY@¾İ’°«\ï¿ù„ì¼Y@\ÒYùe°ï¿Š°\á\é•Y@!\çıœ°\ï¿!\ÍX4Y@\î<ñœ­\ï¿\É:]¥Y@jÀ \éÓª\ï¿ò\ìò­Y@\r¨7£\æ«\ï¿fKVE¸Y@\r¨7£\æ«ï¿Ÿ\ä›\ÈY@>!;oc³\ï¿wÙ¯;\İY@â¢\Î\Ü\Ã\ï¿T:Xÿ\çY@r¿CQ \Ï\ï¿\\…zúY@VW@\Ü\ï¿-?p•\'Y@dZ›\Æö\Ú\ï¿1š•\íCY@.\ÊM\Ô\Ò\ï¿*\ã\ßg\\Y@¹\ãM~‹\Î\ï¿~T\Ã~Y@÷­Ö‰\Ë\ï¿1™*•Y@š`8\×0\Ã\ï¿õiı¡Y@\Ë\Ù;£­\Ê\ï¿z8\é´Y@›\çˆ|—\Ò\ï¿Á-]ÁY@™D½\à\Óï¿¤SW>\ËY@\Ê\Â\××º\Ôï¿¸w\rú\ÒY@M»˜fº\×\ï¿r6\ÜY@)yu\Ù\ï¿\\Ç¸\â\âY@º¿zÜ·\Ú\ï¿\Ôbğ0\íY@jõ\ÕU\Úï¿·´\Z÷Y@\ÛL…x$\Ş\ï¿-¤ı\ZY@ó®zÀ<\ä\ï¿-\Î\ZY@\Åq\à\Õr\ç\ï¿\á\ï³%\ZY@$(~Œ¹\ëï¿»š<e5\ZY@u×ƒIñ\ï¿\İ\î\å>9\ZY@q=\n×£ğï¿ ‹†ŒG\ZY@\'‰%\å\îó\ï¿{0)>>\ZY@–[Z\r‰û\ï¿<úD\ZY@>\ÍÉ‹L\0ğ¿+¦\ÒO8\ZY@mY¾.\Ãÿ\ï¿¯–;3\ZY@\Å\0‰&Pğ¿±ˆa‡1\ZY@‡jJ²ğ¿y#ó\È\ZY@\Ö\ÇC\ß\İ\nğ¿¢`\Æ\ZY@\Ê\à(yuğ¿\ä.\Â\ZY@°bƒ…ğ¿a³\é\ZY@7S!‰ğ¿ôiıY@Ü¡a1\ê\Zğ¿›\0\Ãò\çY@Ê¦\\\áğ¿\ÉËšX\àY@‚\ã2nj ğ¿>@÷\å\ÌY@÷u\àœ%ğ¿ğQ½\ÂY@™d\ä,\ì)ğ¿Æ¾d\ãÁY@\Ñ\Íş@¹-ğ¿¾À¬P¤Y@µ¥òz0ğ¿2t\ì Y@D„4ğ¿1™*•Y@‰C6.6ğ¿\Şrõc“Y@%xC\Z8ğ¿¼³vÛ…Y@h[\Í:\ã;ğ¿(¸XQƒY@0AC?ğ¿\Ø-c}Y@9™¸UCğ¿!sePmY@£±öw¶Gğ¿¾\Şıñ^Y@Sz¦—Kğ¿Ä²™CRY@ ^\×/\ØMğ¿\ÑZ\Ñ\æ8Y@~ú\ëVğ¿hwH1Y@I\ï\0OZğ¿bI¹ûY@1E¹4~ağ¿ô7¡Y@”0\Óö¯lğ¿†\È\é\ëY@5²+-#uğ¿2\0Tq\ãY@\ã\ZŸ\Éşyğ¿¥\Ø\Ñ8\ÔY@m®š\çˆ|ğ¿\Ä\î;†\ÇY@³\ëŞŠÄ„ğ¿\Ê\Â\××ºY@:%Èˆğ¿|\Ô_¯°Y@\è‡Â£ğ¿‚¨û\0¤Y@6X‹ğ¿`\é|x–Y@ùN\Ìz1”ğ¿§’ ŠY@bg\n×˜ğ¿FšxxY@J\íE´ğ¿£<órY@S³Z¡ğ¿‘{ººcY@d\çmlv¤ğ¿‡\á#bJY@\Ü\ÙW¤§ğ¿¶HÚ>Y@Œ¢>«ğ¿'),('K04','Kecamatan Lubuk Begalung',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&«\"\ÜdY@¤\Ç\ïmú³î¿¿}8gY@“«Xü¦°\î¿\é8hY@?\æ\ÈÊ¯î¿•œ{hY@ºe‡ø‡­\î¿dÊ‡ jY@ Nyt#¬\î¿&p\ënY@hx³\ï«\î¿,¹Š\ÅoY@\íõ\î÷ª\î¿\ÒS\äqY@qs*\0ª\î¿6\Ëe£sY@V¸\å#©\î¿Q._xY@9d«Ë©\î¿`\ÉU,~Y@òxZ~\àªî¿¥¿—ÂƒY@\ØpA¶¬î¿…>XÆ†Y@k*‹Â®\î¿N{JÎ‰Y@ ·_>Y±\î¿N{JÎ‰Y@›9$µP²\î¿\èME*ŒY@P\ÂLÛ¿²\î¿(»™ÑY@cc^G²\î¿,D‡À‘Y@Zh\ç4´\î¿W%‘}Y@óT‡\Ü·î¿±Š72Y@P”i4¹\î¿ÿunÚŒY@o‚oš>»\î¿ú\ì€\ëŠY@\0\Ét\èô¼î¿£=^H‡Y@w£ù€À\î¿\å`6†Y@\ÊÀ-]Á\î¿\å`6†Y@\Şs`9\Â\î¿,\rü¨†Y@O\é`ıŸ\Ã\î¿q>?ŒY@Ø¹i3N\Ã\î¿ş\rÚ«Y@\ÇHö5\Ãî¿9\ÏØ—Y@r0›\0\Ãî¿‡ú]ØšY@ğ\İæ“\Â\î¿\ÌğŸn Y@3Š\å–V\Ã\î¿R\nº½¤Y@\Ë-­†\Ä\î¿Û‹h;¦Y@\Îûÿ8a\Â\î¿()°\0¦Y@È³Ë·¾î¿’‘³°§Y@+¾¡ğÙº\î¿Pn\Û÷¨Y@>´ü¶\î¿h°©ó¨Y@V\Õ\Ë\ï´\î¿h°©ó¨Y@´8c˜´\î¿-\ÌB;§Y@\\\È#¸‘²\î¿E7§Y@ˆ\Õa°\î¿E7§Y@0e\à€–®\î¿Í¿´¨Y@›\Ë\r†:¬\î¿Á\Ç`Å©Y@¨REñª\î¿ü«\Ç}«Y@YO­¾ºª\î¿\Ë\Ù;£­Y@YO­¾ºª\î¿\ï\ãh¬Y@ü‹ 1“¨\î¿=°S¬Y@-\ìi‡¿¦î¿—\æV«Y@^¸sa¤\î¿tD¾K©Y@$›«\æ9¢î¿©Ÿ7©Y@YNB\é¡\î¿Ø»?Ş«Y@\Ş\Ë}r \î¿\çV«±Y@t\ê\Êgyî¿…²ğõµY@.\ÆÀ:Ÿî¿œŒ*Ã¸Y@EºŸSŸ\î¿l\"3¸Y@ññ	\Ùy›\î¿7Ç¹M¸Y@”.ıKR™î¿•µMñ¸Y@S²œ„Ò—\î¿/ˆHM»Y@v\Ä!H—\î¿?‹¥H¾Y@\Z1³\Ïc”\î¿ıgÍ¿Y@\Z†ˆ)‘\î¿s0›\0\ÃY@(\Ô\ÓG\à\î¿Z \İ!\ÅY@:u\å³<î¿«^~§\ÉY@¿ò =E\î¿8i\Z\ÍY@_·Œõ\î¿NCT\á\ÏY@@1²d\î¿yvù\ÖY@\És}’\î¿XXp?\àY@Œ 1“¨—\î¿xD…\ê\æY@Ê¤†6\0›\î¿	pz\ïY@Ÿ\Ç(Ï¼œ\î¿A]¾õY@“©‚QI\î¿\ZŞ¬ÁûY@¿a¢A\nî¿”/h!Y@‹Ş©€{\î¿u®(%Y@AgÒ¦\ê\î¿Ôœ¼\ÈY@mò–«Ÿ\î¿\npY@ñœ- ´\î¿w’Y@ˆ»z\î¿\"¥\Ù<Y@Ÿ¯Y.\î¿÷[;QY@š\\Œuœ\î¿9\ÒY@iT\àd›\î¿]¦&ÁY@—9]›\î¿\ß3¡Y@\âZ\ía/”î¿¡.R(Y@óuşÓ\î¿	\Ä\ëúY@¾l;mˆ\î¿£’:Y@µ}\Ì„î¿šìŸ§Y@ˆc]\ÜFƒ\î¿\Õ\Ğ`Y@\ÂiÁ‹¾‚\î¿8HˆòY@Ç¼8dƒ\î¿~©Ÿ7Y@ ¡c‡\î¿İ´§!Y@\àª\Ô\ì\î¿2®¸8*Y@{× /½}\î¿\ê°\Â-Y@\Ş„€|\î¿\Ú|a2Y@$—ÿ~{\î¿	8„*5Y@;‹Ş©€{î¿´[\Ëd8Y@cğ0\í›{î¿¸\ä¸S:Y@gCş™A|\î¿c\0=Y@‡\İw}î¿¹ODY@Y¤‰w€î¿¹ODY@‡ˆ›SÉ€\î¿ù¼\â©GY@S£’:î¿ŸW<õHY@;ş\î¿ \nfLY@, PO\î¿T^\rPY@¹\Ã&2s\î¿ósCSY@G\çüÇ\î¿\ÉU,~SY@›oH£‚\î¿\î_YiRY@P—nƒ\î¿:“6UY@ü\ZI‚p…î¿œ¤ùcZY@\n±ˆa‡\î¿Z!«[Y@6\Ì\Ğx\"ˆ\î¿\ÊÀ-]Y@\Ã\ï¦[vˆ\î¿;\0\â®^Y@%[]N	ˆ\î¿ù\Ü	ö_Y@ ¡c‡\î¿\È\n~bY@‚sF”ö†\î¿n¥\×fcY@©Ø˜\×‡î¿©‰>eY@\ã\Şü†‰†\î¿mW\èƒeY@µ3Lm©ƒ\î¿IM»˜fY@\çoB!‚î¿¯—¦pY@\Âûª\\¨|î¿§X5sY@O?ü|\î¿R||BvY@5s»—{î¿¥¢±öwY@º…®D z\î¿\Î5\Ì\ĞxY@CV·zNzî¿‹ª_\é|Y@ô‹ôz\î¿\î!\á{Y@2\åCP5zî¿¹\Æg²Y@-$`ty\î¿w£ù€Y@\Ş\Ç\ÑYy\î¿>\éD‚Y@‹ª_\é|x\î¿F\ÑƒY@q“Qew\î¿cœ¿	…Y@¡ó\Z»Du\î¿ünºe‡Y@*\Ä#ñòtî¿´Z`‰Y@‚§+u\î¿Iô2ŠY@¯A_zûs\î¿/°ŒY@š}£<s\î¿>¯x\ê‘Y@a§X5s\î¿-^,‘Y@	7U†qî¿‡\Ã\ÒÀY@°\Æ\Ùtpî¿“‹1°Y@Ï…‘^\Ôn\î¿@\rY@wR~Rm\î¿\n¼“OY@§u\Ô~kî¿­5”Ú‹Y@¬\Å9\êhî¿­5”Ú‹Y@\Ø*Á\âpfî¿›\äGüŠY@\Ô\×ó5\Ëe\î¿\É\0PÅY@\r\ŞW\åBe\î¿ó“jŸY@\ÆÁ¥cî¿‡\İwY@¾h\Òa\î¿\ÂÁ\ŞÄY@º\Âj,aî¿…\'ôú“Y@©¤N@a\î¿¸ [–Y@ •b\î¿Aœ‡˜Y@;ò\Ïb\î¿ÿx¯Z™Y@†’É©aî¿¥	¦šY@\Ä\ëú»a\î¿\Ó/oY@˜3\Ûú`î¿Œi¦{Y@$\'·\nb\î¿\×\Ü\ÑY@4œ27_\î¿	§/úY@$cµùU\î¿=IºfòY@Á8¸tLî¿Ÿ\â8ğY@ŒƒKGî¿½\ßh\Ç\r\ZY@h$B#\Ø8\î¿7Â¢\"N\ZY@ÿYó\ã/-\î¿*¬ÿs\ZY@‡ûÈ­I7î¿£@ŸÈ“\ZY@¶+ôÁ26\î¿u’­.§\ZY@óUò±»@î¿›X\à+º\ZY@N¶;P\î¿ôûş\Í\ZY@P\Æø0{Y\î¿>\èÙ¬ú\ZY@Ár„\äY\î¿÷[;QY@¦\Öûv\\\î¿q“QeY@<…\\©g\î¿j\ÙZ_$Y@²¸ÿ\Èthî¿µ‰“ûY@}°Œ\r\İl\î¿ušY@–¨©ek\î¿<O<gY@–¨©ek\î¿CT\á\Ïğ\ZY@ ˜£\Ç\ïm\î¿\Ú9\Í\í\ZY@\Ø*Á\âp\î¿\ä1•ñ\ZY@#¼=yî¿¯\ê¬\Ø\ZY@{®G\áz\î¿\âx>\ê\ZY@†\Ç~K‘\î¿9Bò\ì\ZY@\è3 ŞŒš\î¿\æ\Í\áZ\í\ZY@r5²+-£\î¿O\èõ\'ñ\ZY@[A\Ó+£\î¿^ºIY@·\ìÿ°¥\î¿G\rY@\ÄÍ©d\0¨\î¿/¾hY@„aÀ’«î¿«”\é%Y@Š¾¢[¯î¿¾PÀv0Y@&¨\á[X·\î¿=_³\\6Y@\Ô{*§½\î¿)$™\Õ;Y@i\0o\Å\î¿Õ¯t><Y@\Ï-t%\Õî¿ƒ‰?Š:Y@\0\ä„	£\Ù\î¿\Â\ÂIš?Y@\ßo´\ã†\ß\î¿\Ò\âŒaNY@š&l?\ãî¿»”XY@P«”\é\î¿’“‰[Y@<Mf¼­ô\î¿„%ZY@gv‡ï¿«%\å`Y@n¢–\æV\ï¿ıh8enY@\Ø.m8,\r\ï¿ü\ZI‚pY@gğ÷‹\Ù\ï¿ùMa¥‚Y@˜¦pz\ï¿z\áÎ…Y@Lm©ƒ¼\ï¿\×g\Îú”Y@\ÒYùe0\ï¿´­fY@\ÔÔ²µ>\ï¿.\ã¦šY@«\éz¢\ëBï¿…^ŸY@\ÊlIFN\ï¿\İ\'G¢Y@±\ZKXc\ï¿5ñğ¤Y@—Çš‘An\ï¿Xf,šY@·8K\Ér\ï¿\ÛkA\ïY@\ÓÀj\Øoï¿\Î¥„Y@ú%\â­óo\ï¿D\Û1uWY@\éG\Ã)ssï¿ˆ/EHY@¯A_zûs\ï¿\ëUdt@Y@‚”0\Óv\ï¿,¨şAY@@3ˆ\ìxï¿½\å\ê\Ç&Y@\ÒS\äqs\ï¿N·\ìÿ\ZY@¾kĞ—\Ş~\ï¿?øù\ZY@Ts¹ÁP‡\ï¿q\ê\é\ZY@\Z0Hú´Š\ï¿\Õ\Í\Å\ß\ZY@\Âõ(\\\ï¿%³z‡\Û\ZY@%\Ê\ŞRÎ—\ï¿û`­\Ú\ZY@IŸVÑŸ\ï¿]§‘–\Ê\ZY@oÅ±ï¿¼’ä¹¾\ZY@„œ÷ÿq\Âï¿¤ß¾œ\ZY@|(Ñ’\Ç\Ó\ï¿\Ã\ØBƒ\ZY@k\r¥ö\"\Úï¿}\åAz\ZY@S?o*R\áï¿¸>¬7j\ZY@€\'-\\V\áï¿ ‹†ŒG\ZY@\'‰%\å\îó\ï¿\İ\î\å>9\ZY@q=\n×£ğï¿»š<e5\ZY@u×ƒIñ\ï¿\á\ï³%\ZY@$(~Œ¹\ë\ï¿-\Î\ZY@\Åq\à\Õr\ç\ï¿-¤ı\ZY@ó®zÀ<\äï¿·´\Z÷Y@\ÛL…x$\Ş\ï¿\Ôbğ0\íY@jõ\ÕU\Ú\ï¿\\Ç¸\â\âY@º¿zÜ·\Ú\ï¿r6\ÜY@)yu\Ùï¿¸w\rú\ÒY@M»˜fº\×ï¿¤SW>\ËY@\Ê\Â\××º\Ô\ï¿Á-]ÁY@™D½\à\Ó\ï¿z8\é´Y@›\çˆ|—\Ò\ï¿õiı¡Y@\Ë\Ù;£­\Ê\ï¿1™*•Y@š`8\×0\Ã\ï¿~T\Ã~Y@÷­Ö‰\Ë\ï¿*\ã\ßg\\Y@¹\ãM~‹\Î\ï¿1š•\íCY@.\ÊM\Ô\Ò\ï¿-?p•\'Y@dZ›\Æö\Ú\ï¿\\…zúY@VW@\Ü\ï¿T:Xÿ\çY@r¿CQ \Ï\ï¿wÙ¯;\İY@â¢\Î\Ü\Ãï¿Ÿ\ä›\ÈY@>!;oc³\ï¿fKVE¸Y@\r¨7£\æ«\ï¿ò\ìò­Y@\r¨7£\æ«\ï¿\É:]¥Y@jÀ \éÓªï¿Š°\á\é•Y@!\çıœ°\ï¿ù„ì¼Y@\ÒYùe°\ï¿3\ÂÛƒY@¾İ’°«\ï¿B™F“‹Y@]‰@õ¢\ï¿Zc\Ğ	¡Y@…\è8’\ï¿wg\í¶Y@õø\Ã\Ï\ï¿)\ËÇºY@.ÿ!ıöu\ï¿õ\×+,¸Y@\æ=\Î4a\ï¿,›9$µY@/ûu§;O\ï¿YLl>®Y@c‚V5\ï¿G¬Å§Y@\\•›¨%\ï¿fô£\á”Y@\ê?k~ü%\ï¿õIî°‰Y@\ßPølï¿™\Ô\Ğ`Y@œŒ*Ã¸\ï¿KÌ³’VY@ø¤	¦\Z\ï¿\Ó0|DLY@Z\Êû8\Z\ï¿\nô‰<IY@6\å\n\ïr\ï¿­jIY@B“Ä’r÷\î¿n…°\ZKY@¤\ãjdW\Ú\î¿;ÅªAY@¡c•¸\î¿}“EY@¢Busñ·î¿‘\'I\×LY@Ç„˜Kª¶\î¿ÇŸ¨lXY@ıgÍ¿´î¿ \ß÷o^Y@À>:u\å³\î¿&«\"\ÜdY@¤\Ç\ïmú³\î¿&«\"\ÜdY@¤\Ç\ïmú³\î¿'),('K05','Kecamatan Padang Timur',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ó/oY@˜3\Ûú`\î¿\Ó/oY@˜3\Ûú`î¿¥	¦šY@\Ä\ëú»a\î¿ÿx¯Z™Y@†’É©a\î¿Aœ‡˜Y@;ò\Ïb\î¿¸ [–Y@ •bî¿…\'ôú“Y@©¤N@a\î¿\ÂÁ\ŞÄY@º\Âj,aî¿‡\İwY@¾h\Òa\î¿ó“jŸY@\ÆÁ¥c\î¿\É\0PÅY@\r\ŞW\åBeî¿›\äGüŠY@\Ô\×ó5\Ëeî¿­5”Ú‹Y@\Ø*Á\âpfî¿­5”Ú‹Y@¬\Å9\êh\î¿\n¼“OY@§u\Ô~k\î¿@\rY@wR~Rmî¿“‹1°Y@Ï…‘^\Ônî¿‡\Ã\ÒÀY@°\Æ\Ùtp\î¿-^,‘Y@	7U†q\î¿>¯x\ê‘Y@a§X5s\î¿/°ŒY@š}£<s\î¿Iô2ŠY@¯A_zûsî¿´Z`‰Y@‚§+u\î¿ünºe‡Y@*\Ä#ñòt\î¿cœ¿	…Y@¡ó\Z»Du\î¿F\ÑƒY@q“Qew\î¿>\éD‚Y@‹ª_\é|x\î¿w£ù€Y@\Ş\Ç\ÑYyî¿¹\Æg²Y@-$`ty\î¿\î!\á{Y@2\åCP5zî¿‹ª_\é|Y@ô‹ôz\î¿\Î5\Ì\ĞxY@CV·zNzî¿¥¢±öwY@º…®D z\î¿R||BvY@5s»—{î¿§X5sY@O?ü|î¿¯—¦pY@\Âûª\\¨|\î¿IM»˜fY@\çoB!‚\î¿mW\èƒeY@µ3Lm©ƒî¿©‰>eY@\ã\Şü†‰†\î¿n¥\×fcY@©Ø˜\×‡\î¿\È\n~bY@‚sF”ö†\î¿ù\Ü	ö_Y@ ¡c‡\î¿;\0\â®^Y@%[]N	ˆ\î¿\ÊÀ-]Y@\Ã\ï¦[vˆ\î¿Z!«[Y@6\Ì\Ğx\"ˆî¿œ¤ùcZY@\n±ˆa‡\î¿:“6UY@ü\ZI‚p…\î¿\î_YiRY@P—nƒ\î¿\ÉU,~SY@›oH£‚\î¿ósCSY@G\çüÇ\î¿T^\rPY@¹\Ã&2s\î¿ \nfLY@, POî¿ŸW<õHY@;ş\î¿ù¼\â©GY@S£’:î¿¹ODY@‡ˆ›SÉ€î¿¹ODY@Y¤‰w€\î¿c\0=Y@‡\İw}î¿´[\Ëd8Y@cğ0\í›{\î¿	8„*5Y@;‹Ş©€{\î¿\Ú|a2Y@$—ÿ~{\î¿\ê°\Â-Y@\Ş„€|\î¿2®¸8*Y@{× /½}\î¿İ´§!Y@\àª\Ô\ì\î¿~©Ÿ7Y@ ¡c‡\î¿\Õ\Ğ`Y@\ÂiÁ‹¾‚î¿šìŸ§Y@ˆc]\ÜFƒ\î¿£’:Y@µ}\Ì„\î¿	\Ä\ëúY@¾l;mˆî¿¡.R(Y@óuşÓ\î¿\ß3¡Y@\âZ\ía/”\î¿]¦&ÁY@—9]›\î¿9\ÒY@iT\àd›\î¿÷[;QY@š\\Œuœ\î¿\"¥\Ù<Y@Ÿ¯Y.\î¿w’Y@ˆ»z\î¿\npY@ñœ- ´\î¿Ôœ¼\ÈY@mò–«Ÿ\î¿u®(%Y@AgÒ¦\êî¿”/h!Y@‹Ş©€{\î¿\ZŞ¬ÁûY@¿a¢A\n\î¿A]¾õY@“©‚QI\î¿	pz\ïY@Ÿ\Ç(Ï¼œ\î¿xD…\ê\æY@Ê¤†6\0›\î¿XXp?\àY@Œ 1“¨—\î¿yvù\ÖY@\És}’\î¿NCT\á\ÏY@@1²d\î¿8i\Z\ÍY@_·Œõî¿«^~§\ÉY@¿ò =E\î¿Z \İ!\ÅY@:u\å³<\î¿s0›\0\ÃY@(\Ô\ÓG\à\î¿ıgÍ¿Y@\Z†ˆ)‘\î¿?‹¥H¾Y@\Z1³\Ïc”\î¿/ˆHM»Y@v\Ä!H—î¿•µMñ¸Y@S²œ„Ò—\î¿7Ç¹M¸Y@”.ıKR™\î¿l\"3¸Y@ññ	\Ùy›î¿œŒ*Ã¸Y@EºŸSŸî¿…²ğõµY@.\ÆÀ:Ÿ\î¿\çV«±Y@t\ê\Êgy\î¿Ø»?Ş«Y@\Ş\Ë}r î¿©Ÿ7©Y@YNB\é¡\î¿tD¾K©Y@$›«\æ9¢î¿—\æV«Y@^¸sa¤\î¿=°S¬Y@-\ìi‡¿¦\î¿\ï\ãh¬Y@ü‹ 1“¨\î¿\Ë\Ù;£­Y@YO­¾ºª\î¿ü«\Ç}«Y@YO­¾ºª\î¿Á\Ç`Å©Y@¨REñª\î¿Í¿´¨Y@›\Ë\r†:¬\î¿E7§Y@0e\à€–®\î¿E7§Y@ˆ\Õa°\î¿-\ÌB;§Y@\\\È#¸‘²\î¿h°©ó¨Y@´8c˜´\î¿h°©ó¨Y@V\Õ\Ë\ï´\î¿Pn\Û÷¨Y@>´ü¶î¿’‘³°§Y@+¾¡ğÙº\î¿()°\0¦Y@È³Ë·¾\î¿Û‹h;¦Y@\Îûÿ8a\Â\î¿R\nº½¤Y@\Ë-­†\Ä\î¿\ÌğŸn Y@3Š\å–V\Ãî¿‡ú]ØšY@ğ\İæ“\Âî¿9\ÏØ—Y@r0›\0\Ã\î¿q>?ŒY@Ø¹i3N\Ã\î¿,\rü¨†Y@O\é`ıŸ\Ã\î¿\å`6†Y@\Şs`9\Â\î¿\å`6†Y@\ÊÀ-]Áî¿£=^H‡Y@w£ù€À\î¿ú\ì€\ëŠY@\0\Ét\èô¼\î¿ÿunÚŒY@o‚oš>»î¿±Š72Y@P”i4¹\î¿W%‘}Y@óT‡\Ü·\î¿,D‡À‘Y@Zh\ç4´\î¿(»™ÑY@cc^G²\î¿\èME*ŒY@P\ÂLÛ¿²\î¿N{JÎ‰Y@›9$µP²\î¿N{JÎ‰Y@ ·_>Y±î¿…>XÆ†Y@k*‹Â®î¿¥¿—ÂƒY@\ØpA¶¬\î¿`\ÉU,~Y@òxZ~\àª\î¿Q._xY@9d«Ë©\î¿6\Ëe£sY@V¸\å#©\î¿\ÒS\äqY@qs*\0ª\î¿,¹Š\ÅoY@\íõ\î÷ª\î¿&p\ënY@hx³\ï«\î¿dÊ‡ jY@ Nyt#¬î¿•œ{hY@ºe‡ø‡­\î¿\é8hY@?\æ\ÈÊ¯\î¿&«\"\ÜdY@¤\Ç\ïmú³î¿ \ß÷o^Y@À>:u\å³\î¿ÇŸ¨lXY@ıgÍ¿´î¿‘\'I\×LY@Ç„˜Kª¶\î¿}“EY@¢Busñ·\î¿;ÅªAY@¡c•¸\î¿>°\ã¿@Y@1\Óö¯¬´\î¿Dªb*Y@)[$\íFŸ\î¿n÷rŸY@\ÑvLİ•\î¿^ñ\Ô#\rY@\Ó/o\î¿t#,*\âY@nˆñšWu\î¿\rQ…?\ÃY@È–\å\ë2|\î¿C=·Y@4/‡\İwŒ\î¿~sõ¸Y@”ƒ\Ù–\î¿Ôº\rj¿Y@¸®˜Ş\î¿C’Y½\ÃY@ò¶\Òk³±\î¿\íJ\ËH½Y@\Ô|•|\ì®\î¿k¸¯Y@“\05µl­\î¿\ÖS«¯®Y@À=ÏŸ6ª\î¿\Ù&µY@K“R\Ğ\í¥\î¿V*¨¨Y@`\é|x– \î¿=a‰”Y@.py¬™\î¿Ú«‡Y@HnMº-‘\î¿\á%8õY@T8‚TŠ\î¿0.Ui‹Y@½Â‚û\î¿øXY@<£­J\"{\î¿\æ\Ë°Y@*\0ª¸q\î¿\É6‘™Y@\ÄZ|\n€q\î¿\æ\èñ{›Y@	Œõ\rLn\î¿2g—Y@sò\"ğk\î¿U[rY@-\Î\æm\î¿Y|^Y@5Dşo\î¿\ÃGÄ”HY@S®ğ.qî¿¦_\"\Ş:Y@\í×\î<q\î¿8h¯>Y@¨Š©ô\Î\í¿7¥¼VBY@£\r§\Ì\Í\í¿·e¥IY@!\ê>\0©\Í\í¿lµ‡½PY@ª\Ò\×ø\Ì\í¿\\\å	„Y@\Û1uWvÁ\í¿ãª²\ïŠY@\åD»\n)¿\í¿\Z¿ğJ’Y@r¥¡¼\í¿\áE_AšY@\Ğ\ÕV\ì/»\í¿úò\ì£Y@C\ÊOª}º\í¿\éŒ¼¬Y@ Ğ™´©º\í¿‘,`·Y@ÁoCŒ×¼\í¿²€	ÜºY@R¶HÚ¾\í¿\Ét\èô¼Y@\Z‹¦³“Á\í¿nÁR]ÀY@/¡‚\Ã\í¿“°«\ÉY@\nö_\ç¦\Í\í¿¡£U-\éY@¡0(\Óhò\í¿-`·\îY@ünºe‡ø\í¿û?‡ùòY@’]i©÷\í¿\\\â\ÈY@ƒNô\í¿\İzMY@ö•\é)ò\í¿zTü\ßY@m­/\Úò\í¿I‚pY@\Ú½\á>ò\í¿‚şBY@S®ğ.ñ\í¿½\â©G\ZY@=ºñ\í¿ú™z\İ\"Y@j¢\ÏGñ\í¿\à\Õrg&Y@\ÅrK«!ñ\í¿ı¡™\'Y@q=\n×£ğ\í¿sƒ¡+Y@2g—\ï\í¿}•|\ì.Y@/Á©$\ï\í¿°:r¤3Y@)>>!;\ï\í¿4œ27Y@–—üOş\î\í¿:u\å³<Y@|˜½l;\í\í¿1\Îß„BY@\ß3¡\ì\í¿\Ãai\àGY@P\à|z\ì\í¿ğHY@!\08ö\ì\í¿dY0ñGY@~‹N–Z\ï\í¿ønó\ÆIY@\È\êV\ÏI\ï\í¿]\Z¿ğJY@\ÈÒ‡.¨\ï\í¿\nGJY@\Ü)¬ÿó\í¿‹PlMY@¸¯@ô\í¿\Â»}VY@OGÉ«ó\í¿	¦šYY@ú¸6TŒó\í¿AG«ZY@˜M€aùó\í¿¹U]Y@t#,*\âô\í¿.\Şs`Y@­ùñ—õ\í¿\ëÆ»#cY@i5$\î±ô\í¿\ê’qŒdY@•F\Ì\ìó\í¿ö˜HiY@C\0p\ì\Ùó\í¿Â¤øø„Y@\æÏ·Kõ\í¿À\"¿~ˆY@ˆŸÿ¼ö\í¿ºKâ¬ˆY@5]Ot]ø\í¿\í¼ÍY@@KW°ø\í¿\ÒÅ¦•Y@fh<\Äù\í¿\Ğ(]ú—Y@aŠriü\í¿±\Ûg•™Y@-%\ËI(ı\í¿^gCş™Y@\Õw~Q‚ş\í¿E×…œY@ğ¦[vˆÿ\í¿¼è¾œY@\Ñç£Œ¸\0\î¿h“\Ã\'Y@/\Ãºî¿•G7Â¢Y@£\çº\î¿\ç9\"ß¥Y@vÿXˆî¿¹T¥-®Y@ñ\Öù·\Ëş\í¿\0qW¯Y@¨Œÿ\í¿÷Ye¦´Y@\Ø×º\Ôı\í¿ú`ºY@\Ñ<€E~ı\í¿\ÙwEğ¿Y@·{¹O\î¿\Ôñ˜\ÊY@\n\Ö8›\0\î¿ó\ÎY@/0+\éş\í¿¯\ê¬\ØY@ƒ¢y\0‹ü\í¿Ad‘&\ŞY@ÿ\Ïa¾¼\0\î¿Di\âY@Iò\\ß‡î¿¼\Ïñ\Ñ\âY@\Üh\0o\î¿fÙ“À\æY@\Zˆe3\î¿\"§¯\çY@Ÿ­ƒƒ½	\î¿qVDMôY@“R\Ğ\í%\r\î¿>\Î4aûY@¢\Ñ\Ä\Î\î¿üŞ¦?ûY@9›\0nî¿–±¡›ıY@\'ú|”\î¿u\È\ÍpY@¬\å\ÎL0\î¿B@¾„\nY@z‹‡÷\î¿íš\ÖY@\éb\ÓJ!\î¿$Dù‚Y@7\ê°\Â-\î¿Í®{+Y@†œO+\î¿\×	m9Y@\ã\â¨\ÜD-\î¿\é\Ó*úCY@6=((E+\î¿\Ú;£­JY@\Ñ=\ë\Z-\î¿\ÉuS\ÊkY@\î>\ÇG‹3\î¿ _B‡Y@kIG9˜M\î¿ß‰Y/†Y@x\íÒ†\ÃR\î¿8¤Q“Y@¬p\ËGRR\î¿?\æY@±\ÄÊ¦\\\î¿\Ó/oY@˜3\Ûú`\î¿'),('K06','Kecamatan Kuranji',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0–\0\0½\â©G\ZY@=ºñ\í¿ˆ\Ø`\á$Y@Ô‚}\é\í¿1\ì0&Y@¾h\Ò\á\í¿\ÉW)Y@[´\0m«\Ù\í¿8kğ¾*Y@`±†‹\Ü\Ó\í¿G\å&Y@i¬ı\í\Ñ\í¿²Ÿ\ÅR$Y@>yX¨5\Í\í¿%•)\æ Y@¥¡F!\É\í¿U3k) Y@ÁX\ßÀ\ä\Æ\í¿’\Ì\êY@BÈ—PÁ\í¿^ô¤Y@€¶Õ¬3¾\í¿ö”œY@PVWÀ\í¿š#+¿Y@b÷\Ãc¿\í¿\î—OVY@F\í~\à»\í¿Š \Î\Ã	Y@ûÊƒô¹\í¿›q\Z¢\nY@¬U»&¤µ\í¿ğM\ÓgY@\rÁq7µ\í¿\á²\n›Y@’\é\Ğ\éy·\í¿]Ot]øY@Grù\é·\í¿[|\n€ñY@\ã\ã²ó¶\í¿GXT\Ä\éY@“o+½¶\í¿ƒk\î\èY@ş\Ôx\é&±\í¿Y÷…\èY@¸Z\'.Ç«\í¿™Gş`\àY@‰&PÄ¢\í¿;§Y \İY@®-</›\í¿óuş\ÓY@\ÆPN´«\í¿p}Xo\ÔY@kF¹‹\í¿W#»\ÒY@Ø›’“‰\í¿ø\á !\ÊY@\áA³\ëŞŠ\í¿ÿ ’!\ÇY@›r…w¹ˆ\í¿\Ş\Ì\èG\ÃY@Ï ¡‚\í¿®HLP\ÃY@\ÛO\Æø0{\í¿mscz\ÂY@o\ï\Zt\í¿\ÅS4¸Y@6l±\Ûg\í¿á¶¶ğ¼Y@\ìûpe\í¿4+Û‡¼Y@Rd­¡\Ô^\í¿¼Ì°Q\ÖY@\ìú»a[\í¿KqU\ÙY@“ß¢“¥V\í¿ˆdÈ±õY@a¤µûU\í¿\ÓN\Í\åY@¨şš¬Q\í¿À²Ò¤Y@KZñ\r…O\í¿\ìW\\Y@q:\ÉV—S\í¿¯\éAA)Y@³\×\ÜQ\í¿‘ğ½¿AY@;¬p\ËGR\í¿»\Ñ\Ç|@Y@_˜LŒJ\í¿Ab»{€Y@4øû\ÅlI\í¿NG\07‹Y@·›\à›¦O\í¿\Öå”€˜Y@€cÏ\ËT\í¿…•\n*ªY@°¨ˆ\ÓI\í¿\ÛÜ˜°Y@…A™F\í¿\àH Á¦Y@qu\0\Ä]=\í¿“r0›Y@A\ï!\08\í¿¦*mqY@¾öÌ’\05\í¿«–t”ƒY@@¦µil/\í¿¬\äcwY@VDMôù(\í¿Y¾.\ÃY@\É\å?$\í¿k{¡€Y@#Ø¸ş]\í¿UMuY@H4\"\í¿\áR)vY@˜‡Lù\í¿…\í\'c|Y@”\Ã\Õ\í¿-[ë‹„Y@¥†6\0\í¿AEÕ¯tY@r\Şÿ\Ç	\í¿ıN“oY@`<ƒ†ş	\í¿HqhY@À\"¿~\í¿»Õ”dY@‰&P\Ä\"\í¿D\ŞrõcY@—\Ép<Ÿ\í¿U/¿\ÓdY@$B#Ø¸ş\ì¿şœ0aY@&Œfeûì¿š^Y@ª™µöì¿‡O:‘`Y@×¦±½ô\ì¿\Ä\é$[]Y@A\r\ßÂºñ\ì¿„%ZY@µnƒ\Úo\í\ì¿N¹Â»\\Y@^\rP\Z\ê\ì¿XË™`Y@ºk	ù \ç\ì¿\Ş\ä·\èdY@¬r¡ò¯\å\ì¿x·²DgY@XU/¿\Ó\ä\ì¿q\Æ0\'hY@ó&\Z¤\à\ì¿óV]‡jY@\ÚYôN\Ü\ì¿\ÏL0œkY@µ4·B\Øì¿‹ÁÃ´oY@p\"úµõ\Ó\ì¿6\å\n\ïrY@Ä”H¢—\Ñ\ì¿Y‡£«tY@Rb\×öv\Ë\ì¿…$³zY@Nd\æ—\Ç\ì¿À\"¿~ˆY@\ä\È\"M¼\ì¿\éµ\ÙX‰Y@\Æ\íñBº\ì¿Ë‚‰?ŠY@ôş?N˜°\ì¿y\\T‹ˆY@û&7Š¬\ì¿sŸˆY@°\ä*¿©\ì¿@ú&MƒY@b‡1\é\ï¥ì¿¦\',ñ€Y@”-’v£\ì¿\íœfY@o.\Z2\ì¿eRC€Y@\Ş8)\Ì{œ\ì¿m‘´}Y@\Ã`ş\n™\ì¿1E¹4~Y@zTü\ß•\ì¿N^d~Y@\ä{ì¿¿D„Y@š\í\n}°Œ\ì¿Hm\â\ä~Y@\'f½Ê‰\ì¿~\È[®~Y@Xc\'¼„\ì¿8j…\é{Y@QúB\Èy\ì¿Á9#J{Y@;‹Ş©€{\ì¿1y\Ì|Y@¡>x\ì¿0e\à€Y@{h+xì¿µÜ™	†Y@²²,˜x\ì¿TœˆY@(›r…w\ì¿YÁoCŒY@©i\ÓLw\ì¿\Ñ?ÁÅŠY@\Õv|\Ót\ì¿\ÖÈ®´ŒY@hB“Ä’r\ì¿\"şaKY@@\İ@wrì¿´‘ë¦”Y@\ŞqŠ\är\ì¿\Ïôc™Y@HPüs\ì¿\Êk%t—Y@^œøjGq\ì¿}\Îİ®—Y@,¹Š\Åo\ì¿Q…?Ã›Y@\ãn­m\ì¿÷™Y@;4,F]k\ì¿Kº Y@\ì¾cx\ìg\ì¿+~©ŸY@ß¿yqb\ì¿Zœ¡Y@[\"œÁ_\ì¿şaK¦Y@\àŸR%\Ê^\ì¿{iŠ\0§Y@i\Å7>[ì¿¶Mñ¸¨Y@ˆ„\ïı\rZì¿‘C\ÄÍ©Y@\î—OVW\ì¿\âeS®Y@Ÿ\"‡ˆ›S\ì¿U÷\È\æªY@\0\ã4ôO\ì¿Z€¶Õ¬Y@kIG9˜M\ì¿OGÉ«Y@x\ìg±I\ì¿iÿ¬Y@Q\Üñ&¿E\ì¿<Mf¼­Y@\rÄ²™Cì¿¬ŒF>¯Y@;ÅªAì¿†¯¯u©Y@\Î8\rQ…?\ì¿e¡Y@ÁoCŒ\×<\ì¿?\æY@O\èõ\'ñ9ì¿ˆHM»˜Y@µûU€\ï6ì¿—\Æ/¼’Y@cc^G2\ì¿d!:Y@¦¹\Âj,\ì¿%\Õ?ˆY@ò\nDO\Ê$ì¿€&Â†Y@\r§\Ì\Í7\"\ì¿vŠUƒY@B¯?‰\Ï\ì¿\"\Ç\Ö3„Y@øŒDh\ì¿\Òs]‰Y@x·²Dg\ì¿\Å\ËÓ¹¢Y@\ê=•Ó\ì¿¤ı°Y@5\nIfõ\ì¿T¬\Z„¹Y@„)Ê¥ñ\ì¿h\Ğ\Ğ?ÁY@FĞ˜I\Ô\ì¿ÿ\ìGŠ\ÈY@\ëTù\ì¿\Æ\ÛJ¯\ÍY@C«“3\ì¿\é}\ãk\ÏY@·\'Hlw\ì¿\Ì\Ï\rM\ÙY@GÉ«sì¿‡ùò\ìY@D2\ä\Øz\ì¿\î&ø¦\éY@M-[\ë‹ì¿¨\È!\â\æY@³@»CŠ\ì¿Nc{-\èY@\éóQF\\\0\ì¿\àö‰\íY@ƒ5Î¦#\0ì¿•,\'¡ôY@ªš \ê>\0ì¿Ÿ>øY@“¦A\Ñ<\0ì¿«an÷Y@¯B\ÊOªı\ë¿z4Õ“ùY@\Í‚9zü\ë¿O\ë6¨ıY@z\äû\ë¿r¥Y@\çmlv¤ú\ë¿\å\'\Õ>Y@—s)®*û\ë¿ö•\é)Y@ò[t²\Ôú\ë¿ÿ\\4d<Y@+‡\Ù\Î÷ë¿¼<+JY@\î\\\éE\í\ë¿÷ \äKY@9\Ô\ï\Â\Ö\ì\ë¿3\ßÁOY@=\'½o|\í\ë¿#‡ˆ›SY@½\Şıñ\ë¿\ä„	£YY@\ê\"…²ğ\ë¿:Ì—`Y@qªµ0\í\ë¿%]3ùfY@h×¿\ë\ë¿F±\Ü\ÒjY@\ì1‘\Ò\ì\ë¿*´tY@œ27ßˆ\î\ë¿|)<hvY@\çT2\0Tñ\ë¿6\èKoY@+ømˆñ\ë¿bN\Ğ&‡Y@İ³®\Ñòë¿ºh\Èx”Y@F`¬o`ò\ë¿\â°4ğ£Y@\ÒS\äqó\ë¿zUgµÀY@›p¯\Ì[õ\ë¿ñğ\ËY@(d\çmlöë¿¡\Ó,\ĞY@€)´ô\ë¿QJV\ÕY@\Âú?‡ùò\ë¿Zd;\ßY@n\İ\ÍSò\ë¿\İ	ö_\çY@J›ª{dó\ë¿\ê<*ş\ïY@ú%\â­ó\ï\ë¿\í”\ÛöY@¢µ¢\Íq\î\ë¿-\è½1\ZY@‹ m5\ë\ë¿ÿ\è›4\r\ZY@\Ò\å\Í\áZ\í\ë¿\Î\à\ï\ZY@aü4\î\ë¿\ìL¡ó\Z\ZY@­ø†\Âg\ë\ë¿\Ş®\Õ\ZY@»FË\ê\ë¿}x– #\ZY@øo^œø\ê\ë¿K\0ş)\ZY@9\ì¾cx\ì\ë¿ß¤iP4\ZY@\á\Ğ[<¼\ç\ë¿\é¶D.8\ZY@\ï ûr\æ\ë¿r£\ÈZC\ZY@Æ‰¯v\ç\ë¿%#gaO\ZY@>”\è\ë¿¥„`U\ZY@õ\"r\ì\ë¿IJzZ\ZY@‹©ô\Î\îë¿Ÿ‘`\ZY@‹ş\ĞÌ“\ë\ë¿O>=¶e\ZY@\ßp¹5\é\ë¿\"\nœl\ZY@P3¤Š\â\ë¿\È\'d\çm\ZY@”ø\Ü	ö\ß\ë¿oò[t\ZY@‹RB°ª\Ş\ë¿be4òy\ZY@‹RB°ª\Şë¿„¹\İ\Ë}\ZY@\Ã\Ó+e\âë¿¡c•\ZY@\ÖÈ®´Œ\Ô\ë¿\Çg²\ZY@‚\0:v\Ğ\ë¿wç¨£\ZY@p´\ã†\ß\Í\ë¿}ªF¯\ZY@b»{€\î\Ë\ë¿\ÑŠX\Ä\ZY@ú}ÿ\æ\Å\ë¿\'L\Í\Ê\ZY@²„µ1v\Â\ë¿\nB®\Ô\ZY@©\Ş\Z\Ø*Áë¿›\É7\Û\Ü\ZY@ \\7¥¼\ë¿\Z¤\à)\ä\ZY@¤5º\ë¿.È–\å\ë\ZY@ \â8ğj¹\ë¿ ˜£\Ç\ï\ZY@5\Ñç£Œ¸\ë¿d\Ëò\ZY@\ê®\ì‚Áµ\ë¿4¼Yƒ÷\ZY@\ê®\ì‚Áµ\ë¿ÿËµhY@€òwï¨±\ë¿\ä.\ÂY@1zn¡«ë¿ƒOsò\"Y@\Ëh\äóŠ§\ë¿k\r¥ö\"Y@,)wŸ\ã£ë¿¦ñ¯$Y@’<\×÷\á \ë¿-&ş(Y@‰–<–Ÿ\ë¿ßŠ\Ä5Y@|Ô—¥ë¿ ˆE;Y@,(\Ê4šë¿‹\á\íAY@\Ë2g—\ë¿rl=CY@|œi\Âö“\ë¿#„GGY@\â¯\É\Zõ\ë¿f/\ÛNY@$›:\ë¿3Š\å–VY@\r\'‚8ë¿‡†Å¨kY@µÆ B‡\ë¿ò|Ô›Y@£\Î\ÜC\Âw\ë¿Ñ°u­Y@/l\ÍV^r\ë¿{ô†û\ÈY@!\Âøi\ë¿?\Åq\à\ÕY@\ÎTˆG\âe\ë¿HŒ[\èY@_EF$a\ë¿ş,–\"ùY@ı.l\ÍV^ë¿œÅ‹…!Y@\Ç,{Xë¿•˜g%Y@aŒHZV\ë¿vS\Êk%Y@e\Ä Q\ë¿VÒŠo(Y@1[²*\ÂM\ë¿\Û;\á%Y@şrÛ¾G\ë¿NŸt\"Y@[\ï7\ÚqCë¿‹¨‰>Y@/¤\ÃC?ë¿œ\Ü\ïPY@€ó\â\ÄW;ë¿$A¸Y@—ª´\Å5\ë¿w.ŒôY@ò¶\Òk³1\ë¿8À\ÌwğY@+½6+1ë¿¯>ú\îY@\rS[\ê /\ë¿b¡\Ö4\ïY@\Øô  -ë¿…=\íğY@\á\ï³%+\ë¿Ô›QóY@ŠY/†r\"\ë¿N€aùóY@õ9D\Üë¿“Ä’r÷Y@µ\ßÚ‰\ë¿oºe‡øY@°V\íšë¿¯\'º.üY@m\È?3ˆë¿©¾ó‹Y@&s,\ïª\ë¿Éª7Y@¯˜\Ş\ë¿g\\S Y@&\å`6\ë¿k\'JB\"Y@³	0,ÿ\ê¿\í·v¢$Y@şo\Ö\àıê¿‘œL\Ü*Y@&rÁüı\ê¿M.\ÆÀ:Y@\Õw~Q‚ş\ê¿“©‚QY@÷Ye¦´şê¿¥¢±öwY@Hm\â\äş\ê¿x³\ï«Y@\Ï\ÜC\Â÷şê¿¬\Å9\êY@¬\â\Ì#ÿ\ê¿öa½Q+Y@^0¸\æş\ê¿ÿÍ‹_Y@¯B\ÊOªıê¿¹Œ›\ZhY@\Ì&À°ü\ê¿oò[tY@Ä°Ã˜ô÷\ê¿3\ÂÛƒY@Ì¸©\æó\ê¿\ÖÈ®´ŒY@bÀ’«Xü\ê¿oÅY@\Ã,´sš\ë¿İ¶\ïQY@³B‘\î\ç\ë¿__\ëR#Y@œ\Ş\Åûqë¿\ÖmPûY@&Rš\Í\ã°\ë¿!ºöY@œ\Ä °r\è\ë¿\\\ÆúY@u\ç‰\çlì¿®¼\äòY@\Æiˆ*ü\ì¿u=\Ñu\áY@g­‡/\ì¿şµ¼r½Y@¹\áw\Ó-;\ì¿=°S¬Y@’XR\î>Gì¿”\Ù “ŒY@z\Ç):’K\ì¿jP4`Y@©eo)g\ì¿\â\È‘EY@§wñ~\Ü~\ì¿\î<0Y@Ze¦´ş–\ì¿0,¾-Y@\Í\È w¦\ì¿S—Œc$Y@°\å•\ëm³\ì¿\ß\â\á=Y@—ª´\Å5¾\ì¿úÔ±J\éY@J\íE´\Ó\ì¿~\äÖ¤\ÛY@\ÔDŸ2\â\ì¿KVE¸\ÉY@#…–õ\ì¿ô‰<IºY@=»|\ë\Ãú\ì¿\æ}“¦Y@4fõ\í¿B•šY@“\İJ\n\í¿š\Í\ã0˜Y@zVÒŠo(\í¿\Ãf€²Y@\Äy8\é4\í¿\á³up°Y@E>‘\'I\í¿/…Í®Y@ø¬8U\í¿¾İ’°Y@š%jjY\í¿¾İ’°Y@š%jjY\í¿mp–Y@DÔ·\Ìi\í¿f£s~ŠY@¼\"ø\ßJv\í¿½ş$>wY@\0«#G:ƒ\í¿·\r£ xY@\0kÕ®‰\í¿:\ÏØ—lY@\âr¼Ñ“\í¿	1—TY@¼>sÖ§œ\í¿Û‰’HY@mt\ÎOqœ\í¿õ»°5Y@\é\ÑTO\æŸ\í¿+£‘\Ï+Y@±ûá±Ÿ\í¿S±1¯#Y@\ÈEµˆ(¦\í¿ıl\äº)Y@$´\å\\Š«\í¿©¾ó‹Y@;S\è¼Æ®\í¿J´\äñ\ZY@r6Ü¬\í¿im\Z\Û\ZY@5bfŸÇ¨\í¿Eh\æ\É\ZY@ó\å\ØG§\í¿– # \Â\ZY@ü6\ÄxÍ«\í¿>	l\ÎÁ\ZY@\êD²\í¿²eùº\ZY@}\è‚ú–¹\í¿	\â<œÀ\ZY@;m\ÆÁ\í¿\Ól‡Á\ZY@”3w¼\É\í¿ñe¢©\ZY@rQ-\"Š\É\í¿\ß€c\ZY@\ãósC\Ó\í¿[wóT\ZY@`\ÊÀ-\İ\í¿r£\ÈZC\ZY@\Ï.\ßú°\Ş\í¿\Æ¬q6\ZY@1\ïq¦	\Û\í¿Ÿp]1\ZY@PŠV\î\æ\í¿ş\î5&\ZY@¥‚Šª_\é\í¿b,\Ó/\ZY@ÁtZ·A\í\í¿ï®³!ÿY@„KÇœg\ì\í¿z4Õ“ùY@9\nğ\í¿\Ùƒk\îY@±‰\Ì\\\àò\í¿¤#\Ö\âY@¿‚4c\Ñô\í¿\à¼8ñ\ÕY@t]‰@õ\í¿ñğ\ËY@,cC7û\í¿™¼f¾Y@Y¤‰w\0\î¿\0Q¡ºY@\á+Ù±\î¿÷Xú\ĞY@q\Æ0\'hî¿š^b,\ÓY@z\Â(î¿¸Z\'.\ÇY@¨\0Ï !\î¿\àe†²Y@±û\á±\î¿\Ğb)’¯Y@Èš‘A\î\"î¿…A™Y@RñGT(î¿½Ç™&lY@,¼\ËE|\'\î¿\Ú;£­JY@\Ñ=\ë\Z-\î¿\é\Ó*úCY@6=((E+\î¿\×	m9Y@\ã\â¨\ÜD-\î¿Í®{+Y@†œO+\î¿$Dù‚Y@7\ê°\Â-\î¿íš\ÖY@\éb\ÓJ!\î¿B@¾„\nY@z‹‡÷\î¿u\È\ÍpY@¬\å\ÎL0î¿–±¡›ıY@\'ú|”\î¿üŞ¦?ûY@9›\0n\î¿>\Î4aûY@¢\Ñ\Ä\Î\î¿qVDMôY@“R\Ğ\í%\r\î¿\"§¯\çY@Ÿ­ƒƒ½	\î¿\"§¯\çY@Ÿ­ƒƒ½	\î¿fÙ“À\æY@\Zˆe3î¿¼\Ïñ\Ñ\âY@\Üh\0o\î¿Di\âY@Iò\\ß‡\î¿Ad‘&\ŞY@ÿ\Ïa¾¼\0î¿¯\ê¬\ØY@ƒ¢y\0‹ü\í¿ó\ÎY@/0+\éş\í¿\Ôñ˜\ÊY@\n\Ö8›\0\î¿\ÙwEğ¿Y@·{¹O\î¿ú`ºY@\Ñ<€E~ı\í¿÷Ye¦´Y@\Ø×º\Ôı\í¿\0qW¯Y@¨Œÿ\í¿¹T¥-®Y@ñ\Öù·\Ëş\í¿\ç9\"ß¥Y@vÿXˆî¿•G7Â¢Y@£\çº\î¿h“\Ã\'Y@/\Ãºî¿¼è¾œY@\Ñç£Œ¸\0\î¿E×…œY@ğ¦[vˆÿ\í¿^gCş™Y@\Õw~Q‚ş\í¿±\Ûg•™Y@-%\ËI(ı\í¿\Ğ(]ú—Y@aŠriü\í¿\ÒÅ¦•Y@fh<\Äù\í¿\í¼ÍY@@KW°ø\í¿ºKâ¬ˆY@5]Ot]ø\í¿À\"¿~ˆY@ˆŸÿ¼ö\í¿Â¤øø„Y@\æÏ·Kõ\í¿ö˜HiY@C\0p\ì\Ùó\í¿\ê’qŒdY@•F\Ì\ìó\í¿\ëÆ»#cY@i5$\î±ô\í¿.\Şs`Y@­ùñ—õ\í¿¹U]Y@t#,*\âô\í¿AG«ZY@˜M€aùó\í¿	¦šYY@ú¸6TŒó\í¿‹PlMY@¸¯@ô\í¿\nGJY@\Ü)¬ÿó\í¿]\Z¿ğJY@\ÈÒ‡.¨\ï\í¿ønó\ÆIY@\È\êV\ÏI\ï\í¿dY0ñGY@~‹N–Z\ï\í¿\Ãai\àGY@P\à|z\ì\í¿1\Îß„BY@\ß3¡\ì\í¿:u\å³<Y@|˜½l;\í\í¿4œ27Y@–—üOş\î\í¿°:r¤3Y@)>>!;\ï\í¿}•|\ì.Y@/Á©$\ï\í¿sƒ¡+Y@2g—\ï\í¿ı¡™\'Y@q=\n×£ğ\í¿\à\Õrg&Y@\ÅrK«!ñ\í¿½\â©G\ZY@=ºñ\í¿½\â©G\ZY@=ºñ\í¿'),('K07','Kecamatan Nanggalo',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\é\0\0\0~«u\ârY@„+ POì¿ª|\ÏH„Y@Ï¢w*\àì¿€&Â†Y@\r§\Ì\Í7\"\ì¿%\Õ?ˆY@ò\nDO\Ê$\ì¿d!:Y@¦¹\Âj,ì¿—\Æ/¼’Y@cc^G2ì¿ˆHM»˜Y@µûU€\ï6\ì¿?\æY@O\èõ\'ñ9\ì¿e¡Y@ÁoCŒ\×<ì¿†¯¯u©Y@\Î8\rQ…?ì¿¬ŒF>¯Y@;ÅªA\ì¿<Mf¼­Y@\rÄ²™C\ì¿iÿ¬Y@Q\Üñ&¿E\ì¿OGÉ«Y@x\ìg±I\ì¿Z€¶Õ¬Y@kIG9˜M\ì¿U÷\È\æªY@\0\ã4ôO\ì¿\âeS®Y@Ÿ\"‡ˆ›Sì¿‘C\ÄÍ©Y@\î—OVWì¿¶Mñ¸¨Y@ˆ„\ïı\rZ\ì¿{iŠ\0§Y@i\Å7>[\ì¿şaK¦Y@\àŸR%\Ê^\ì¿Zœ¡Y@[\"œÁ_\ì¿+~©ŸY@ß¿yqb\ì¿Kº Y@\ì¾cx\ìg\ì¿÷™Y@;4,F]k\ì¿Q…?Ã›Y@\ãn­m\ì¿}\Îİ®—Y@,¹Š\Åo\ì¿\Êk%t—Y@^œøjGq\ì¿\Ïôc™Y@HPüsì¿´‘ë¦”Y@\ŞqŠ\är\ì¿\"şaKY@@\İ@wr\ì¿\ÖÈ®´ŒY@hB“Ä’r\ì¿\Ñ?ÁÅŠY@\Õv|\Ót\ì¿YÁoCŒY@©i\ÓLw\ì¿TœˆY@(›r…wì¿µÜ™	†Y@²²,˜x\ì¿0e\à€Y@{h+x\ì¿1y\Ì|Y@¡>x\ì¿Á9#J{Y@;‹Ş©€{\ì¿8j…\é{Y@QúB\Èy\ì¿~\È[®~Y@Xc\'¼„\ì¿Hm\â\ä~Y@\'f½Ê‰ì¿¿D„Y@š\í\n}°Œ\ì¿N^d~Y@\ä{\ì¿1E¹4~Y@zTü\ß•\ì¿m‘´}Y@\Ã`ş\n™\ì¿eRC€Y@\Ş8)\Ì{œ\ì¿\íœfY@o.\Z2ì¿¦\',ñ€Y@”-’v£\ì¿sŸˆY@°\ä*¿©\ì¿Ë‚‰?ŠY@ôş?N˜°\ì¿\éµ\ÙX‰Y@\Æ\íñBº\ì¿À\"¿~ˆY@\ä\È\"M¼\ì¿…$³zY@Nd\æ—\Ç\ì¿Y‡£«tY@Rb\×öv\Ë\ì¿6\å\n\ïrY@Ä”H¢—\Ñì¿‹ÁÃ´oY@p\"úµõ\Ó\ì¿\ÏL0œkY@µ4·B\Ø\ì¿óV]‡jY@\ÚYôN\Ü\ì¿q\Æ0\'hY@ó&\Z¤\à\ì¿x·²DgY@XU/¿\Ó\ä\ì¿XË™`Y@ºk	ù \ç\ì¿N¹Â»\\Y@^\rP\Z\ê\ì¿„%ZY@µnƒ\Úo\í\ì¿\Ä\é$[]Y@A\r\ßÂºñì¿‡O:‘`Y@×¦±½ôì¿š^Y@ª™µö\ì¿şœ0aY@&Œfeû\ì¿U/¿\ÓdY@$B#Ø¸ş\ì¿D\ŞrõcY@—\Ép<Ÿ\í¿»Õ”dY@‰&P\Ä\"\í¿HqhY@À\"¿~\í¿ıN“oY@`<ƒ†ş	\í¿AEÕ¯tY@r\Şÿ\Ç	\í¿-[ë‹„Y@¥†6\0\í¿…\í\'c|Y@”\Ã\Õ\í¿\áR)vY@˜‡Lù\í¿UMuY@H4\"\í¿k{¡€Y@#Ø¸ş]\í¿Y¾.\ÃY@\É\å?$\í¿¬\äcwY@VDMôù(\í¿«–t”ƒY@@¦µil/\í¿¦*mqY@¾öÌ’\05\í¿“r0›Y@A\ï!\08\í¿\àH Á¦Y@qu\0\Ä]=\í¿\ÛÜ˜°Y@…A™F\í¿\Öå”€˜Y@€cÏ\ËT\í¿NG\07‹Y@·›\à›¦O\í¿Ab»{€Y@4øû\ÅlI\í¿»\Ñ\Ç|@Y@_˜LŒJ\í¿‘ğ½¿AY@;¬p\ËGR\í¿¯\éAA)Y@³\×\ÜQ\í¿\ìW\\Y@q:\ÉV—S\í¿À²Ò¤Y@KZñ\r…O\í¿\ÓN\Í\åY@¨şš¬Q\í¿ˆdÈ±õY@a¤µûU\í¿KqU\ÙY@“ß¢“¥V\í¿¼Ì°Q\ÖY@\ìú»a[\í¿4+Û‡¼Y@Rd­¡\Ô^\í¿ı0Bx´Y@“\È>È²`\í¿Fy\æ\å°Y@NA~6r]\í¿\ÅrK«Y@\á·!\Æk^\í¿°ª^~§Y@@x\î=\\\í¿”\í*¤Y@ê²˜\Ø|\\\í¿ğr¥Y@S>U£W\í¿^gCş™Y@`±†‹\ÜS\í¿€J•Y@ü6\ÄxM\í¿ôş?N˜Y@k#ò]J\í¿<Y¤Y@›ş\ìGŠH\í¿^\ÕY-°Y@À•\ì\ØD\í¿p&¦±Y@hwH1@\í¿sGÿËµY@_&Š:\í¿\È\ïmú³Y@MJA·—4\í¿·\ìÿ°Y@<k·]h.\í¿D\ÃbÔµY@\Ä#ñòt.\í¿mp\"úµY@ƒi>\"&\í¿v\ãİ‘±Y@üÈ­I·%\í¿?QÙ°Y@©…’É©\í¿> Ğ™´Y@ğÁk—6\í¿hÍ¿´Y@\Æ‚\í¿Q¿[³Y@amŒğ\í¿d’‘³Y@o»\Ğ\\§\í¿rÂ„Ñ¬Y@X\Îüj\í¿­½OU¡Y@\Ö\æÿUG\í¿\Ä`ş\n™Y@C±l\æ\í¿N˜0š•Y@¿D„\í¿2¿F’Y@\Æûqû\å\í¿½8ñÕY@/\İ$\í¿ù„ì¼Y@\Ä^(`;\í¿_²ñ`‹Y@)\í\r¾0\í¿!\çıY@p\ì\Ùs™\Z\í¿\ì4\ÒRyY@c}“\í¿\Å °rhY@1Ğµ/ \í¿c+hZbY@p\ì\Ùs™\Z\í¿³~31]Y@œ¤ùcZ\í¿õ¡\ê[Y@4\Ûú`\í¿\Ï,	PSY@ŒKU\Ú\â\Z\í¿X®·\ÍTY@2V›ÿW\í¿š\ÚRY@!\ÍX4\í¿˜2p@KY@_&Šº\í¿i\â\àIY@«‘]i\í¿\ë;¿(AY@™ò!¨\Z\í¿\Ê`\æ;Y@œ¤ùcZ\í¿\Ö\ã¾\Õ:Y@	S”K\ã\í¿ºLM‚7Y@–vj.7\í¿b*\ß3Y@†¯¯u©\í¿øı›\'Y@ofô£\á\í¿\ê³®+Y@ƒP\Ş\Ç\Ñ\í¿\Ä>#Y@Ÿ¯Y.\í¿¬«µY@K‘|%\í¿D„Y@\İ\ïP\è\í¿yYY@\â¦Óº\r\í¿ù£¨3÷Y@$Dù‚\í¿l#öY@I†[\Ï\í¿\İ@wòY@Püs\×\í¿<Û£7\ÜY@CYøúZ\í¿\0X9\ÒY@Ÿˆ‚\í¿nø\İt\ËY@ôQF\\\0\Z\í¿K±£q¨Y@\ã§qoş\ì¿QN´«Y@\ÎÂvø\ë\ì¿„Y@¼S”K\ãì¿¾IÓ Y@T÷<\Ú\ì¿Öª]\ÒY@B!¡\Ê\ì¿Uh –\ÍY@k`«‹\Ã\ì¿öyŒò\ÌY@\Û1uWvÁ\ì¿_\í(\ÎY@¢\Õ\ÉŠ»\ì¿\á$\Í\ÓY@+P‹ÁÃ´\ì¿2;‹\ŞY@S\ÌA\ĞÑª\ì¿\çş\êq\ßY@iü\Â+I\ì¿j\İµ\ßY@ 3iSu\ì¿ß¥\Ô%\ãY@m\ìMŒ\ì¿×¿\ëY@\ßùE	ú‹ì¿¨ÿ¬ùñY@™*•Ô‰\ì¿Ä°Ã˜ôY@-\Ğ\îb€\ì¿\éñ{›şY@\íğ\×dz\ì¿\É8F²GY@²¸ÿ\Èth\ì¿=\ÓKŒeY@\èƒel\èf\ì¿ô§\êtY@Y\"§¯g\ì¿aıŸ\Ã|Y@t	‡\Şb\ì¿/\ÃºY@]j„~¦^\ì¿ÁV	‡Y@–@J\ì\Ú^ì¿§’ ŠY@\"³\ìI`ì¿ƒˆÔ´‹Y@¸:\0\â®^\ì¿\Öå”€˜Y@¤\ãjdWZ\ì¿*«\éz¢Y@D¨R³Zì¿³—m§­Y@\îf…\"]\ì¿nŠ\ÇEµY@\Åpu\0\Ä]\ì¿\Û\ß\Ù½Y@Z!«[\ì¿]p¿Y@x\ÎZ\ì¿\ng·–\ÉY@•ºd#Y\ì¿=­N\ÎY@ùHJzZì¿‚\ï\ä\ÓY@¤û9ùY\ì¿\Éÿ\ä\ï\ŞY@\0:Ì—`\ì¿	m9—\âY@\Ãc\Ò_ì¿¯“\â\ãY@\â\ç¿¯]\ì¿x`\0\áY@$\Ù@ºXì¿‰•\Ñ\È\çY@\"\àªT\ì¿J´\äñY@O­¾º*Pì¿®Ö‰\ËñY@—g)YN\ì¿\Ô\ÖüøY@j1x˜öM\ì¿\Ú<ƒùY@½6+1O\ì¿+/ùŸüY@ú_®EP\ì¿kœMG\0Y@l$	\ÂP\ì¿\nø5’Y@¾ù\r\rR\ì¿ù¿b\rY@/¾hR\ì¿9³]¡Y@@øP\ì¿\äÖ¤\ÛY@\Æ\Ä\æ\ã\ÚPì¿ö”œY@O•\ï‰P\ì¿\ËeY@ˆƒ„(_P\ì¿Õ”dY@¹\ãM~‹N\ì¿\çoB!Y@ò\Ñ\âŒaN\ì¿#ùJ %Y@r \nfL\ì¿bfŸ\Ç(Y@5Ó½N\êK\ì¿}•|\ì.Y@A›>\éD\ì¿=_³\\6Y@lµ‡½P@\ì¿L\Æ1’=Y@¹\áw\Ó-;ì¿‰}(FY@2\0Ç=\ì¿\'\Ù\êrJY@L\à\Ö\İ<ì¿¥]PY@ƒk\î\è9\ì¿\×Q\ÕQY@iT\àd8\ì¿\ÉU,~SY@,+MJA7\ì¿\å\ì\ÑVY@9a\ÂhV6\ì¿H›VY@L\Z£uT5\ì¿À®&OYY@\'…y3\ì¿]7¥¼VY@zoÀ1ì¿Šc\îZY@]5\Ïù.\ì¿aŒHZY@\ã\â¨\ÜD-\ì¿Eõ\ÖÀVY@lË€³”,\ì¿d­¡\Ô^Y@\â\\\Ã\'\ì¿}ZEhY@”™€_#\ì¿~«u\ârY@„+ PO\ì¿~«u\ârY@„+ PO\ì¿~«u\ârY@„+ PO\ì¿'),('K08','Kecamatan Padang Barat',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0š\0\0\0\\\ætYLY@y\ËÕ\Í\î¿D‡À‘@Y@/O\çŠ\Òî¿Ï€z3Y@²Z}u\Õî¿Ky Y@ À;ùô\Øî¿gY@\î#·&\İ\î¿\'½o|\íY@•»\Ïñ\Ñ\â\î¿\â’\ãN\éY@¿+‚ÿ­\ä\î¿en¾\İY@é·¯\ç\î¿ı„³[\ËY@°p’\æ\éî¿¾.\ÃºY@ç¨£\ã\ê\î¿c*ı„³Y@+Ã¸D\ë\î¿°V\íšY@@\ÜÕ«\È\èî¿ pvk™Y@|\í™%\ê\î¿\Ş>«Ì”Y@V¸\å#)\éî¿¢\ïne‰Y@W=`2\å\î¿g×½‰Y@\Ìa÷\Ã\ã\î¿üT\ZˆY@~\Çğ\Ø\Ï\â\î¿]\â\È‘Y@Ì¶\ÓÖˆ\àî¿Ÿ\"‡ˆ›Y@\ŞW\åB\å\ß\î¿Î©d\0¨Y@*ª~¥ó\á\î¿ôR±1¯Y@P\Çc*\ã\î¿õñ\Ğw·Y@\Ğ\ëO\â\î¿\ÏH„F°Y@)’¯R\â\î¿ux\ã§Y@´ª%\å\à\î¿\\\Ëd8Y@y±0DN\ß\î¿k}‘Ğ–Y@Aó9w»\Ş\î¿\É\Ì.Y@¥]P\ß\î¿9\ïÿ\ã„Y@¹ıòÉŠ\á\î¿#I®€Y@W\ÏI\ï\ßî¿—r¾\Ø{Y@‰x\ëü\Û\î¿§wñ~Y@\Ç,{\Ø\î¿RewƒY@ó\ì£S\×î¿®(	‰Y@}Xo\Ô\n\Ó\î¿4iSuY@{÷\Ç{\Õ\Ê\î¿Ùµ½İ’Y@\ÛÜ˜°\Äî¿ŠÊ†5•Y@P”i4¹\î¿/3l”Y@\ÇF ^×¯\î¿c}“Y@-—\Îù©\î¿uX\á–Y@J\n,€©\î¿\Ì\í^\î“Y@Ê¤†6\0›\î¿8Ø›’Y@¶eÀYJ–î¿ˆ÷XY@}w+Kt–\î¿d!:Y@Sy=˜”î¿€¸«W‘Y@=Ô¶a”\î¿\àÚ‰’Y@°Víš\î¿ut\\Y@q>?Œ\î¿\ÄC?Y@…ì¼Í\î¿t$—ÿY@^Ÿ9\ëS\î¿\å¶}Y@B@¾„Š\î¿éÁŠY@†q7ˆÖŠ\î¿û&7ŠY@\Ó0|DL‰\î¿\à\Ô)Y@5´Ø€ˆ\î¿@1²dY@#h\Ì$\ê…î¿œ’“‰Y@« ºö…\î¿S\"‰Y@qW¯\"£ƒî¿¾l;mY@qW¯\"£ƒî¿•\rk*‹Y@IG9˜M€\î¿>’’†Y@q¬‹\Ûh€\î¿¼¯Ê…Y@ü\Äôû~\î¿,¹ŠY@­ú\\m\Å~\î¿µ\ßÚ‰Y@p>u¬Rz\î¿zŞ…Y@\è…;Fz\î¿	kc\ì„Y@\Ó\Ù\É\à(yî¿„ğh\ãˆY@\È^\ïşx\î¿sŸˆY@]~p>u\î¿ÏºFËY@\Õ^D\Û1u\î¿v‰ê­Y@!‰—§s\î¿,óV]‡Y@ú\Ğõ-s\î¿\åF‘µ†Y@\ÓÀj\Øo\î¿Xp?\àY@«[=\'½o\î¿jõ\ÕUY@HÅ«¬m\î¿	Q¾ …Y@À\\‹ mî¿ªb*ı„Y@˜LŒJjî¿”ˆğ/‚Y@!\Âøi\î¿ü\ZI‚Y@¡J\Íh\î¿Q1\Îß„Y@¡J\Íh\î¿@Ì˜‚Y@©¼\á´`î¿¥ó\áY‚Y@?8Ÿ:V\î¿\Ó÷\Z‚Y@ù„ì¼Mî¿3M\Ø~Y@\â\ä~‡¢@\î¿J\ï_{Y@“nK\ä‚3î¿¯\Î1 {Y@’’†V\'\î¿]ûzY@X9\Ò\î¿ósCSvY@¦^·\î¿1(\ÓhrY@B>\èÙ¬ú\í¿&p\ënY@¶HÚ>\æ\í¿\ÓP£dY@-	PS\Ë\Ö\í¿‹¤\İ\ècY@h\é\n¶\Ï\í¿\ãS\0ŒgY@\İ%qVD\Í\í¿\Õ@ó9wY@e\Æ\ÛJ¯\Í\í¿\Õ@ó9wY@¢\ïne‰\Î\í¿6\å\n\ïrY@\ÊTÁ¨¤\Î\í¿³\ìI`sY@>$|\ïo\Ğ\í¿óYwY@µSs¹Á\Ğ\í¿(µ\ÑvY@¡‚\Ã\"\Ò\í¿\×övKrY@ğLh’X\Ò\í¿Tşµ¼rY@?ªa¿\'\Ö\í¿S–!uY@µÿÖª\İ\í¿\Ó–xY@\Z§!ªğ\ç\í¿DL‰$zY@ñ€²)Wø\í¿=\r$}Y@ñ€²)Wø\í¿gº\×I}Y@.«°\à\í¿+ˆ®}Y@[%X\Î\í¿¾-XªY@y\ËÕ\Í\í¿\ËM\Ô\Ò\ÜY@f,š\Î\Î\í¿ÊŠ\á\ê\0Y@¡×Ÿ\Ä\ç\Î\í¿8h¯>Y@¨Š©ô\Î\í¿\ZOqY@d\ë\Â1\Ë\í¿\Æ5>“ıY@in…°\Z\Ë\í¿en¾\İY@³µ¾Hh\Ë\í¿„~¦^·Y@ó>\æ\È\Ê\í¿^M²šY@\Ñ\\§‘–\Ê\í¿ıky\åzY@\Ì	\Ú\äğ\É\í¿J\ì\Ú\ŞnY@|\'f½\Ê\í¿!YÀnY@»S”\Ë\í¿\ß€cY@€J•({\Ë\í¿iE,bY@E+÷³\Â\í¿8J^cY@ˆ*üŞ¬\í¿\àLLbY@…b\ÙÌ¡\í¿²J\é™^Y@#i7ú˜\í¿k#ò]Y@Àw›7NŠ\í¿—o}XoY@\äL¶ŸŒ\í¿	7U†Y@YLl>®\í¿i­hsœY@ó\èu\í¿<3Áp®Y@\ßùE	ú‹\í¿\ÈTÆ¿Y@®Ö‰\ËñŠ\í¿’L\à\ÖY@\íGŠÈ°Š\í¿¶€\ĞzøY@ı .R(‹\í¿ƒ5Î¦#Y@\Îp>?Œ\í¿p]1#Y@j¿µ¥\í¿ Nyt#Y@¾‰!9™¸\í¿óSt$Y@?;\àºb\Æ\í¿<š$Y@‡nùH\Ê\í¿ 4\Ô($Y@¿~ˆ\r\Î\í¿8h¯>Y@¨Š©ô\Î\í¿¦_\"\Ş:Y@\í×\î<q\î¿\Û2\à,Y@\Ê\İ\çøhq\î¿\ÏJZñ\rY@5\ï8EGr\î¿\Å8\nY@Kvl\âu\î¿FaEY@k»	¾iz\î¿:\èY@O \ì«†\î¿\ç¦\Í8\rY@„f×½‰\î¿0¡‚\ÃY@t{Ic´\î¿p\\\ÆM\rY@W—Sb’\î¿]‰@õY@m\áy©Ø˜\î¿>\"¦DY@ò´üÀUî¿Ÿ\Éşy\ZY@\ï\ç\äg£\î¿Ó¥I*Y@l³±ó¬\î¿~ı,Y@öF­0}¯î¿½6+1Y@e¸u·\î¿s ‡\Ú6Y@fJ\ëo	À\î¿6:\ç§8Y@usñ·=Á\î¿\ã\â¨\ÜDY@:“6U÷\È\î¿\\\ætYLY@y\ËÕ\Í\î¿'),('K09','Kecamatan Padang Utara',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ó\0\0\0\ÄwbÖ‹Y@6uÿw\ì¿ö\Îh«’Y@8‚TŠ\ì¿û<Fy\æY@\nœlw\ì¿l#öY@¬Ê¾+‚\ì¿Ä°Ã˜ôY@-\Ğ\îb€ì¿¨ÿ¬ùñY@™*•Ô‰\ì¿×¿\ëY@\ßùE	ú‹\ì¿ß¥\Ô%\ãY@m\ìMŒ\ì¿j\İµ\ßY@ 3iSu\ì¿\çş\êq\ßY@iü\Â+I\ì¿2;‹\ŞY@S\ÌA\ĞÑª\ì¿\á$\Í\ÓY@+P‹ÁÃ´\ì¿_\í(\ÎY@¢\Õ\ÉŠ»\ì¿öyŒò\ÌY@\Û1uWvÁ\ì¿Uh –\ÍY@k`«‹\Ã\ì¿Öª]\ÒY@B!¡\Êì¿¾IÓ Y@T÷<\Ú\ì¿„Y@¼S”K\ã\ì¿QN´«Y@\ÎÂvø\ë\ì¿K±£q¨Y@\ã§qoş\ì¿nø\İt\ËY@ôQF\\\0\Z\í¿\0X9\ÒY@Ÿˆ‚\í¿<Û£7\ÜY@CYøúZ\í¿\İ@wòY@Püs\×\í¿l#öY@I†[\Ï\í¿ù£¨3÷Y@$Dù‚\í¿yYY@\â¦Óº\r\í¿D„Y@\İ\ïP\è\í¿¬«µY@K‘|%\í¿\Ä>#Y@Ÿ¯Y.\í¿\ê³®+Y@ƒP\Ş\Ç\Ñ\í¿øı›\'Y@ofô£\á\í¿b*\ß3Y@†¯¯u©\í¿ºLM‚7Y@–vj.7\í¿\Ö\ã¾\Õ:Y@	S”K\ã\í¿\Ê`\æ;Y@œ¤ùcZ\í¿i\â\àIY@«‘]i\í¿˜2p@KY@_&Šº\í¿X®·\ÍTY@2V›ÿW\í¿\Ï,	PSY@ŒKU\Ú\â\Z\í¿õ¡\ê[Y@4\Ûú`\í¿³~31]Y@œ¤ùcZ\í¿c+hZbY@p\ì\Ùs™\Z\í¿\Å °rhY@1Ğµ/ \í¿\ì4\ÒRyY@c}“\í¿!\çıY@p\ì\Ùs™\Z\í¿_²ñ`‹Y@)\í\r¾0\í¿½8ñÕY@/\İ$\í¿2¿F’Y@\Æûqû\å\í¿N˜0š•Y@¿D„\í¿\Ä`ş\n™Y@C±l\æ\í¿­½OU¡Y@\Ö\æÿUG\í¿rÂ„Ñ¬Y@X\Îüj\í¿d’‘³Y@o»\Ğ\\§\í¿Q¿[³Y@amŒğ\í¿hÍ¿´Y@\Æ‚\í¿> Ğ™´Y@ğÁk—6\í¿?QÙ°Y@©…’É©\í¿v\ãİ‘±Y@üÈ­I·%\í¿mp\"úµY@ƒi>\"&\í¿D\ÃbÔµY@\Ä#ñòt.\í¿·\ìÿ°Y@<k·]h.\í¿\È\ïmú³Y@MJA·—4\í¿sGÿËµY@_&Š:\í¿p&¦±Y@hwH1@\í¿^\ÕY-°Y@À•\ì\ØD\í¿<Y¤Y@›ş\ìGŠH\í¿ôş?N˜Y@k#ò]J\í¿€J•Y@ü6\ÄxM\í¿^gCş™Y@`±†‹\ÜS\í¿ğr¥Y@S>U£W\í¿”\í*¤Y@ê²˜\Ø|\\\í¿°ª^~§Y@@x\î=\\\í¿\ÅrK«Y@\á·!\Æk^\í¿Fy\æ\å°Y@NA~6r]\í¿ı0Bx´Y@“\È>È²`\í¿4+Û‡¼Y@Rd­¡\Ô^\í¿á¶¶ğ¼Y@\ìûpe\í¿\ÅS4¸Y@6l±\Ûg\í¿mscz\ÂY@o\ï\Zt\í¿®HLP\ÃY@\ÛO\Æø0{\í¿\Ş\Ì\èG\ÃY@Ï ¡‚\í¿ÿ ’!\ÇY@›r…w¹ˆ\í¿ø\á !\ÊY@\áA³\ëŞŠ\í¿W#»\ÒY@Ø›’“‰\í¿p}Xo\ÔY@kF¹‹\í¿óuş\ÓY@\ÆPN´«\í¿;§Y \İY@®-</›\í¿™Gş`\àY@‰&PÄ¢\í¿Y÷…\èY@¸Z\'.Ç«\í¿GXT\Ä\éY@“o+½¶\í¿[|\n€ñY@\ã\ã²ó¶\í¿]Ot]øY@Grù\é·\í¿\á²\n›Y@’\é\Ğ\éy·\í¿ğM\ÓgY@\rÁq7µ\í¿›q\Z¢\nY@¬U»&¤µ\í¿Š \Î\Ã	Y@ûÊƒô¹\í¿\î—OVY@F\í~\à»\í¿š#+¿Y@b÷\Ãc¿\í¿ö”œY@PVWÀ\í¿^ô¤Y@€¶Õ¬3¾\í¿’\Ì\êY@BÈ—PÁ\í¿U3k) Y@ÁX\ßÀ\ä\Æ\í¿%•)\æ Y@¥¡F!\É\í¿²Ÿ\ÅR$Y@>yX¨5\Í\í¿G\å&Y@i¬ı\í\Ñ\í¿8kğ¾*Y@`±†‹\Ü\Ó\í¿\ÉW)Y@[´\0m«\Ù\í¿1\ì0&Y@¾h\Ò\á\í¿ˆ\Ø`\á$Y@Ô‚}\é\í¿½\â©G\ZY@=ºñ\í¿‚şBY@S®ğ.ñ\í¿zTü\ßY@m­/\Úò\í¿\İzMY@ö•\é)ò\í¿\\\â\ÈY@ƒNô\í¿e¨Š©ôY@\Ñ\æ8·	÷\í¿±£q¨\ßY@pÎˆ\Ò\Ş\à\í¿Ãºñ\î\ÈY@ÁX\ßÀ\ä\Æ\í¿ª\rND¿Y@W@¡¾\í¿\àK\áA³Y@ÿ‚\0º\í¿‚¨û\0¤Y@Šø¬¸\í¿6Vb•Y@q\Ê\Ü|#º\í¿c@özY@,,¸ğÀ\í¿N\Óg\\Y@Ğ™´©º\Ç\í¿T§YOY@Z-°\ÇD\Ê\í¿<š$Y@‡nùH\Ê\í¿óSt$Y@?;\àºb\Æ\í¿ Nyt#Y@¾‰!9™¸\í¿p]1#Y@j¿µ¥\í¿ƒ5Î¦#Y@\Îp>?Œ\í¿\å^`V(Y@\Âj,amŒ\í¿š”‚n/Y@Š”fó8Œ\í¿©/K;5Y@q­ö°Š\í¿\Â\Ü\î\å>Y@µ‰“ûŠ\í¿\â\È‘EY@gïŒ¶*‰\í¿PR`LY@•\×J\è.‰\í¿ù¿#*TY@aTR\' ‰\í¿\r\ä\Ù\å[Y@œŠT[ˆ\í¿`u\äHgY@\î´5\"‡\í¿9µ3LmY@û­(	‰\í¿\ì4\ÒRyY@¼‘y\ä†\í¿K %vmY@\ëTù‘ˆ\í¿õ¾ñµgY@-&6×†\í¿Š¾¢[Y@÷rŸˆ\í¿\çT2\0TY@ \ÅR$_‰\í¿\â\È‘EY@´tÛˆ\í¿\æ\Ìv…>Y@UN{JÎ‰\í¿bi\àG5Y@\'f½Ê‰\í¿¾„\n/Y@@M-[\ë‹\í¿÷\ÉQ€(Y@SweŒ\í¿Ö©ò=#Y@Û¦x\\T‹\í¿¸sa¤Y@1$\'·Š\í¿Ş«V&üY@ú}ÿ\æÅ‰\í¿ƒ¾ôö\çY@\Ó0|DL‰\í¿3¸<\ÖY@KP\áˆ\í¿\Î{/¾Y@õIî°‰\í¿Ô·\Ì\é²Y@ª›‹¿\í‰\í¿&S£Y@\á)\äJ=‹\í¿$š@‹Y@„ûPŒ\í¿\í¶\ÍuY@’we¨Š\í¿•œ{hY@ùe0F$Š\í¿jj\ÙZ_Y@Ö¸\ÇÒ‡\í¿\\\0qWY@ı†‰)x\í¿nQfƒLY@“6U÷\Èf\í¿\Ù\Ğ\Íş@Y@\ã©G\Z\ÜV\í¿k-\ÌB;Y@\È$#gaO\í¿?\ÇG‹3Y@8 ¥+\ØF\í¿[A\Ó+Y@\ÌE|\'f=\í¿\Ş\èc> Y@V-2\í¿¿~ˆ\rY@„,&ş(\í¿T«¯®\nY@Š®?8\í¿N^ôY@f6\\\í¿¶*‰\ìY@\ãqQ-\"\n\í¿HŒ[\èY@y\åz\ÛL\í¿¨üky\åY@9\Ö\Åm4\0\í¿\Ñ[<¼\çY@$—ÿ~û\ì¿V\Õ\Ë\ïY@¨9y‘	ø\ì¿O?üY@¼\"ø\ßJö\ì¿ò\Ï\âY@š@‹ö\ì¿:\èY@G\r6õì¿§\"\ÆY@{¾f¹lôì¿µ‰“ûY@YÄ°Ã˜ô\ì¿\Ğ	¡ƒ.Y@‹\Â.Šø\ì¿4M\Ø~2Y@±‰\Ì\\\àò\ì¿\í·v¢$Y@ƒö\ê\ã¡\ï\ì¿@ÁÅŠ\ZY@\èÙ¬ú\\\íì¿¼@IY@\r\Ğ\Ò\ì\ì¿o\×KSY@\î±ô¡\ê\ì¿Í‘•_Y@‰@£t\é\ì¿\\kFY@\æ=\Î4\á\ì¿E\ç\áY@µ\ÑvL\İ\ì¿:–w\ÕY@_\í(\Î\Ñ\ì¿\Îß„BY@|—w\Ê\ì¿\à0\Ñ Y@»\íBs\Æ\ì¿\ë\Ä\åxY@Lˆ¹¤j»ì¿ª\ïü¢Y@:;%¯\ì¿\È¨pY@ø¯=³¤\ì¿±ŸY@Lÿ’T¦˜\ì¿kœMG\0Y@\î\n}°Œì¿º‡„\ïıY@\'£\Ê0\î†\ì¿=Ô¶aY@« ºö…\ì¿\ëÆ»#Y@@÷\å\Ìv…\ì¿\Ğ\Òl#Y@è†¦\ìôƒ\ì¿\ê³®+Y@!u;ûÊƒ\ì¿\ÙÍŒ~4Y@,¸ğÀ€ì¿>Y@vT5A\Ô}\ì¿jj\ÙZY@ô‹ôz\ì¿x\î=\\rY@(\'\ÚUHy\ì¿\ÄwbÖ‹Y@6uÿw\ì¿\ÄwbÖ‹Y@6uÿw\ì¿\ÄwbÖ‹Y@6uÿw\ì¿'),('K11','Kecamatan Koto Tangah',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Æ\0\0\Õ\è\Õ\0¥ Y@ª›‹¿m\é¿†:¬p Y@	4\Ø\Ôy\é¿36t³? Y@`\å\Ğ\"\Ûyé¿Š\0§wñY@%!‘¶q\é¿\\\Ëd8Y@Z¸¬\Âf€é¿…%P6Y@d\Ì]KÈ‡\é¿…Ì•AY@hv\İ[‘˜\é¿>°\ã¿@Y@ÀŸ\é¿š²\ÓY@.9(a¦é¿#½¨Y@¶¼r½m¦\é¿x\Ò\ÂeY@\æ\ØG§®\é¿\Z\İA\ìLY@B\Îûÿ¸é¿\ìJ\ËHY@«\ëPMI\Ö\é¿I¼<+Y@G\ãP¿\Ûé¿ˆ®}Y@\Ä\ê0\Øé¿Ÿ6\ç\àY@°WXp?\àé¿¦	\ÛO\ÆY@QMI\Ö\á\èé¿ªCn†Y@W@¡>\ê¿\Ğw.Y@™g%­ø\ê¿6«>W[Y@ªa¿\'\Ö)\ê¿j¾J>vY@\åñ´üÀUê¿±\ß\ëTY@õei§\ær\ê¿\é\n¶OY@¹oµN\\\ê¿\×h9\ĞCY@ 5?şÒ¢\ê¿/\İ$Y@\ërJ@L\Â\ê¿3\ÂÛƒY@Ì¸©\æó\ê¿oò[tY@Ä°Ã˜ô÷ê¿¹Œ›\ZhY@\Ì&À°ü\ê¿ÿÍ‹_Y@¯B\ÊOªı\ê¿öa½Q+Y@^0¸\æşê¿¬\Å9\êY@¬\â\Ì#ÿ\ê¿x³\ï«Y@\Ï\ÜC\Â÷şê¿¥¢±öwY@Hm\â\äş\ê¿“©‚QY@÷Ye¦´ş\ê¿M.\ÆÀ:Y@\Õw~Q‚şê¿‘œL\Ü*Y@&rÁüı\ê¿\í·v¢$Y@şo\Ö\àı\ê¿k\'JB\"Y@³	0,ÿ\ê¿g\\S Y@&\å`6\ë¿Éª7Y@¯˜\Şë¿©¾ó‹Y@&s,\ïªë¿¯\'º.üY@m\È?3ˆ\ë¿oºe‡øY@°V\íšë¿“Ä’r÷Y@µ\ßÚ‰\ë¿N€aùóY@õ9D\Ü\ë¿Ô›QóY@ŠY/†r\"ë¿…=\íğY@\á\ï³%+\ë¿b¡\Ö4\ïY@\Øô  -ë¿¯>ú\îY@\rS[\ê /\ë¿8À\ÌwğY@+½6+1\ë¿w.ŒôY@ò¶\Òk³1ë¿$A¸Y@—ª´\Å5ë¿œ\Ü\ïPY@€ó\â\ÄW;ë¿‹¨‰>Y@/¤\ÃC?\ë¿NŸt\"Y@[\ï7\ÚqC\ë¿\Û;\á%Y@şrÛ¾G\ë¿VÒŠo(Y@1[²*\ÂM\ë¿vS\Êk%Y@e\Ä Që¿•˜g%Y@aŒHZVë¿œÅ‹…!Y@\Ç,{X\ë¿ş,–\"ùY@ı.l\ÍV^\ë¿HŒ[\èY@_EF$a\ë¿?\Åq\à\ÕY@\ÎTˆG\âe\ë¿{ô†û\ÈY@!\Âøi\ë¿Ñ°u­Y@/l\ÍV^r\ë¿ò|Ô›Y@£\Î\ÜC\Âwë¿‡†Å¨kY@µÆ B‡\ë¿3Š\å–VY@\r\'‚8\ë¿f/\ÛNY@$›:\ë¿#„GGY@\â¯\É\Zõ\ë¿rl=CY@|œi\Âö“ë¿‹\á\íAY@\Ë2g—ë¿ ˆE;Y@,(\Ê4š\ë¿ßŠ\Ä5Y@|Ô—¥\ë¿-&ş(Y@‰–<–Ÿë¿¦ñ¯$Y@’<\×÷\á \ë¿k\r¥ö\"Y@,)wŸ\ã£ë¿ƒOsò\"Y@\Ëh\äóŠ§\ë¿\ä.\ÂY@1zn¡«\ë¿ÿËµhY@€òwï¨±\ë¿4¼Yƒ÷\ZY@\ê®\ì‚Áµ\ë¿d\Ëò\ZY@\ê®\ì‚Áµ\ë¿ ˜£\Ç\ï\ZY@5\Ñç£Œ¸\ë¿.È–\å\ë\ZY@ \â8ğj¹\ë¿\Z¤\à)\ä\ZY@¤5ºë¿›\É7\Û\Ü\ZY@ \\7¥¼\ë¿\nB®\Ô\ZY@©\Ş\Z\Ø*Á\ë¿\'L\Í\Ê\ZY@²„µ1v\Â\ë¿\ÑŠX\Ä\ZY@ú}ÿ\æ\Å\ë¿}ªF¯\ZY@b»{€\î\Ë\ë¿wç¨£\ZY@p´\ã†\ß\Í\ë¿\Çg²\ZY@‚\0:v\Ğë¿¡c•\ZY@\ÖÈ®´Œ\Ôë¿„¹\İ\Ë}\ZY@\Ã\Ó+e\â\ë¿be4òy\ZY@‹RB°ª\Ş\ë¿oò[t\ZY@‹RB°ª\Ş\ë¿\È\'d\çm\ZY@”ø\Ü	ö\ß\ë¿\"\nœl\ZY@P3¤Š\â\ë¿O>=¶e\ZY@\ßp¹5\éë¿Ÿ‘`\ZY@‹ş\ĞÌ“\ë\ë¿IJzZ\ZY@‹©ô\Î\î\ë¿¥„`U\ZY@õ\"r\ì\ë¿%#gaO\ZY@>”\è\ë¿r£\ÈZC\ZY@Æ‰¯v\ç\ë¿\é¶D.8\ZY@\ï ûr\æ\ë¿ß¤iP4\ZY@\á\Ğ[<¼\ç\ë¿K\0ş)\ZY@9\ì¾cx\ì\ë¿}x– #\ZY@øo^œø\ê\ë¿\Ş®\Õ\ZY@»FË\ê\ë¿\ìL¡ó\Z\ZY@­ø†\Âg\ë\ë¿\Î\à\ï\ZY@aü4\î\ë¿ÿ\è›4\r\ZY@\Ò\å\Í\áZ\í\ë¿-\è½1\ZY@‹ m5\ë\ë¿\í”\ÛöY@¢µ¢\Íq\î\ë¿\ê<*ş\ïY@ú%\â­ó\ï\ë¿\İ	ö_\çY@J›ª{dó\ë¿Zd;\ßY@n\İ\ÍSò\ë¿QJV\ÕY@\Âú?‡ùòë¿¡\Ó,\ĞY@€)´ô\ë¿ñğ\ËY@(d\çmlö\ë¿zUgµÀY@›p¯\Ì[õ\ë¿\â°4ğ£Y@\ÒS\äqóë¿ºh\Èx”Y@F`¬o`ò\ë¿bN\Ğ&‡Y@İ³®\Ñò\ë¿6\èKoY@+ømˆñ\ë¿|)<hvY@\çT2\0Tñ\ë¿*´tY@œ27ßˆ\î\ë¿F±\Ü\ÒjY@\ì1‘\Ò\ì\ë¿%]3ùfY@h×¿\ë\ë¿:Ì—`Y@qªµ0\í\ë¿\ä„	£YY@\ê\"…²ğ\ë¿#‡ˆ›SY@½\Şıñ\ë¿3\ßÁOY@=\'½o|\í\ë¿÷ \äKY@9\Ô\ï\Â\Ö\ìë¿¼<+JY@\î\\\éE\í\ë¿ÿ\\4d<Y@+‡\Ù\Î÷\ë¿ö•\é)Y@ò[t²\Ôú\ë¿\å\'\Õ>Y@—s)®*û\ë¿r¥Y@\çmlv¤ú\ë¿O\ë6¨ıY@z\äû\ë¿z4Õ“ùY@\Í‚9züë¿«an÷Y@¯B\ÊOªıë¿Ÿ>øY@“¦A\Ñ<\0ì¿•,\'¡ôY@ªš \ê>\0\ì¿\àö‰\íY@ƒ5Î¦#\0\ì¿Nc{-\èY@\éóQF\\\0ì¿¨\È!\â\æY@³@»CŠ\ì¿\î&ø¦\éY@M-[\ë‹ì¿‡ùò\ìY@D2\ä\Øz\ì¿\Ì\Ï\rM\ÙY@GÉ«s\ì¿\é}\ãk\ÏY@·\'Hlw\ì¿\Æ\ÛJ¯\ÍY@C«“3\ì¿ÿ\ìGŠ\ÈY@\ëTù\ì¿h\Ğ\Ğ?ÁY@FĞ˜I\Ô\ì¿T¬\Z„¹Y@„)Ê¥ñ\ì¿¤ı°Y@5\nIfõ\ì¿\Å\ËÓ¹¢Y@\ê=•Ó\ì¿\Òs]‰Y@x·²Dg\ì¿\"\Ç\Ö3„Y@øŒDh\ì¿vŠUƒY@B¯?‰\Ïì¿ª|\ÏH„Y@Ï¢w*\à\ì¿~«u\ârY@„+ PO\ì¿}ZEhY@”™€_#\ì¿d­¡\Ô^Y@\â\\\Ã\'\ì¿Eõ\ÖÀVY@lË€³”,\ì¿aŒHZY@\ã\â¨\ÜD-ì¿Šc\îZY@]5\Ïù.\ì¿]7¥¼VY@zoÀ1\ì¿À®&OYY@\'…y3\ì¿H›VY@L\Z£uT5\ì¿\å\ì\ÑVY@9a\ÂhV6\ì¿\ÉU,~SY@,+MJA7\ì¿\×Q\ÕQY@iT\àd8ì¿¥]PY@ƒk\î\è9\ì¿\'\Ù\êrJY@L\à\Ö\İ<ì¿‰}(FY@2\0Ç=\ì¿L\Æ1’=Y@¹\áw\Ó-;\ì¿=_³\\6Y@lµ‡½P@\ì¿}•|\ì.Y@A›>\éD\ì¿bfŸ\Ç(Y@5Ó½N\êK\ì¿#ùJ %Y@r \nfL\ì¿\çoB!Y@ò\Ñ\âŒaN\ì¿Õ”dY@¹\ãM~‹N\ì¿\ËeY@ˆƒ„(_Pì¿ö”œY@O•\ï‰P\ì¿\äÖ¤\ÛY@\Æ\Ä\æ\ã\ÚP\ì¿9³]¡Y@@øP\ì¿ù¿b\rY@/¾hR\ì¿\nø5’Y@¾ù\r\rR\ì¿kœMG\0Y@l$	\ÂP\ì¿+/ùŸüY@ú_®EP\ì¿\Ú<ƒùY@½6+1O\ì¿\Ô\ÖüøY@j1x˜öMì¿®Ö‰\ËñY@—g)YN\ì¿J´\äñY@O­¾º*Pì¿‰•\Ñ\È\çY@\"\àªT\ì¿x`\0\áY@$\Ù@ºXì¿¯“\â\ãY@\â\ç¿¯]\ì¿	m9—\âY@\Ãc\Ò_\ì¿\Éÿ\ä\ï\ŞY@\0:Ì—`ì¿‚\ï\ä\ÓY@¤û9ùY\ì¿=­N\ÎY@ùHJzZ\ì¿\ng·–\ÉY@•ºd#Y\ì¿]p¿Y@x\ÎZ\ì¿\Û\ß\Ù½Y@Z!«[\ì¿nŠ\ÇEµY@\Åpu\0\Ä]ì¿³—m§­Y@\îf…\"]\ì¿*«\éz¢Y@D¨R³Z\ì¿\Öå”€˜Y@¤\ãjdWZì¿ƒˆÔ´‹Y@¸:\0\â®^ì¿§’ ŠY@\"³\ìI`\ì¿ÁV	‡Y@–@J\ì\Ú^\ì¿/\ÃºY@]j„~¦^\ì¿aıŸ\Ã|Y@t	‡\Şb\ì¿ô§\êtY@Y\"§¯g\ì¿=\ÓKŒeY@\èƒel\èf\ì¿\É8F²GY@²¸ÿ\Èth\ì¿\éñ{›şY@\íğ\×dz\ì¿l#öY@¬Ê¾+‚\ì¿û<Fy\æY@\nœlw\ì¿ö\Îh«’Y@8‚TŠ\ì¿\ÄwbÖ‹Y@6uÿw\ì¿x\î=\\rY@(\'\ÚUHy\ì¿jj\ÙZY@ô‹ôzì¿>Y@vT5A\Ô}\ì¿\ÙÍŒ~4Y@,¸ğÀ€\ì¿\ê³®+Y@!u;ûÊƒ\ì¿\Ğ\Òl#Y@è†¦\ìôƒ\ì¿\ëÆ»#Y@@÷\å\Ìv…ì¿º‡„\ïıY@\'£\Ê0\î†\ì¿m¡õğY@r75\Ğ|\ì¿Grù\éY@s/0+i\ì¿9ñÕ\âY@|	^\ì¿?\Æ\ÜY@t]øÁùT\ì¿d\éC\ÔY@š¶e¥I\ì¿¼vi\ÃY@|~!<ì¿‰\ÓI¶ºY@\ã8ğj¹3ì¿ƒù+d®Y@8\Úq\Ã\ï&ì¿‡à¸Œ›Y@8Ø›’\ì¿\Ãò\çÛ‚Y@Rh\ì¿?rk\ÒmY@P6\å\n\ï\ë¿9~¨4bY@VñF\æ\ë¿\Üôg?RY@¯&OYM\×\ë¿v\Ä!HY@£>+\Î\ë¿X<Y@ø¨¿^aÁ\ë¿U†q7Y@Š\É`\æ»\ë¿A€;Y@h\é\n¶\ë¿Ujö@Y@P\ÂLÛ¿²\ë¿JA·—4Y@Ê¦\\\á]®\ë¿{Cr2Y@t\ë5=(¨\ë¿\ÅuŒ+.Y@ıL½n˜\ë¿=)“\ZY@›r…w¹ˆ\ë¿\nIfõY@¾ƒŸ8€~ë¿¶€\ĞzøY@ğùa„ğh\ë¿h’XR\îY@Ë†5•Ea\ë¿\\-\Ë\×Y@O@a\ÃS\ë¿nø\İt\ËY@B!¡Jë¿«$²²Y@‹‹£r5ë¿·~úÏšY@E>‘\'ë¿Œ,™cyY@=C8f\Ùë¿¹oµN\\Y@Á\äF‘µ\ë¿ÚŒ\ÓUY@¡¸\ãMş\ê¿ezˆFY@À²Ò¤ô\ê¿ò@d‘&Y@ÖŒr\á\ê¿mŒğY@ù&3\Ş\Öê¿©„\'ôúY@e¸u\Ê\ê¿Ã#½Y@œ¦\Ï¸®\ê¿0×¢hY@{„ò>ê¿€²eùY@¸\æş—kê¿­N\ÎP\ÜY@T¬\Z„¹]ê¿—‹øN\ÌY@\ÍX\äW\ê¿Ä´o\î¯Y@h>\çn\×K\ê¿E7§Y@ù.¥.G\ê¿W\\•›Y@¢C\àH Aê¿ Š·˜Y@N\Ğ&‡O:\ê¿øSã¥›Y@±ÀWt\ë5\ê¿ iQŸY@™¹À\å1\ê¿0h!£Y@À%\0ÿ”*ê¿¯\\o›©Y@U¾g$B#\ê¿/Q½5°Y@\ébg\n\ê¿övÃ¶Y@¹\Ş6S!\ê¿u\æ¾Y@\ÓJ!Kê¿¦¸ª\ì»Y@–\ËF\çü\ê¿øŠn½Y@\\¬¨Á4\ê¿]Á6\â\ÉY@#½¨İ¯\ê¿\rTÆ¿\ÏY@Ÿ\é%\Æ2ıé¿µ?Q\ÙY@÷³B‘\î\é¿\äK¨\àY@›\Zh>\çé¿œ\Zh>\çY@!\äK¨\à\é¿3k) \íY@\ÏÀ\ÈËš\Øé¿ª\Ò\×øY@K\äõ`\Òé¿¸<ÖŒY@˜6\Êú\Íé¿•´\âY@\Ìñ\nDO\Ê\é¿-&ş(Y@ka\Ú9\Í\é¿ùõCY@I-”L\Î\é¿\Ïø¾¸TY@\ÈTÆ¿\Ï\é¿d°\âTkY@µ¨Or‡\Í\é¿o›©Y@‰ÿ\"h\Ì\é¿\\•›¨Y@§\Ä$\\\È\é¿\×1®¸Y@ó\èFXT\Ä\é¿)\èö’\ÆY@qu\0\Ä]½\é¿RG\Ç\Õ\ÈY@±RAEÕ¯\é¿\é}\ãk\ÏY@[A\Ó«\é¿8 ¥+\ØY@st´ª\é¿,I\ëûY@\ê\ê\Å6©\é¿\Î’Z(Y@ı†K®\é¿S£’:Y@nQfƒL²\é¿\0\å\ï\ŞQY@­0}¯!¸\é¿ÇŸ¨lXY@}\è‚ú–¹é¿…\Í\0dY@fô£á”¹\é¿\ZQ\Ú|Y@¨(ğN¾\é¿6Vb•Y@0…Ì•Á\é¿D¦|ªY@\ì¢èÁ\é¿jl¯½Y@j\ÓL÷º\é¿\ÑŠX\ÄY@´Ë·>¬·\é¿\Æø0{\ÙY@o\×KS¸\é¿¶ƒûY@À{G	±é¿§<ºY@\r¨7£\æ«é¿¼Î†ü3Y@˜N\ë6¨\é¿øq4GVY@p–’\å¤\é¿T\äqsY@\Õ{*§=¥\é¿iY@¦{Ô—¥\é¿y\"‡Y@¨\Ã\n·|¤é¿¦˜ƒ £Y@Y\à+ºõšé¿­\Ú5!­Y@½\0û\èÔ•\é¿(F–\ÌY@K:\ÊÁl‚\é¿!\Ì\í^\îY@ö\rLnY\é¿IZ\ÖıY@F˜¢\\\Z?\é¿ ¸\ÊY@\Ãô½†\à8é¿¦\Ô%\ãY@(E+÷3\é¿T^-Y@	\ÂP¨\'\é¿•ñ\ï3Y@;:®Fv%\é¿\ì1‘\ÒlY@›u\Æ÷\Å%\é¿RewƒY@b†\ÆA\é¿üü÷\àµY@aÿun\Úé¿œ¢#¹üY@®Ô³ ”÷\è¿Öª]Y@%!‘¶ñ\è¿\à\Õrg&Y@Wzm6V\â\è¿¶J°8Y@gğ÷‹\Ù\è¿4\Ø\ÔyTY@2\È]„)\Ê\è¿û•Î‡gY@uÛˆ\'»\è¿Z¡H÷sY@ñI\'Lµè¿¯½7†Y@>^H‡‡°è¿’®™|³Y@ó:\â\r¤\è¿w¢$$\ÒY@(CUL¥Ÿè¿‹4ñğY@Ho¸Üšè¿¨m\Ã(Y@•›¨¥¹•\è¿/¾hY@	Q¾ …„\è¿\ïSUh Y@aR||Bvè¿¸\\ı\Ø$Y@qÿ‘\é\Ği\è¿‚”0Y@€d:tz^è¿®¸8*7Y@³$@M-[\è¿\\\Ì\Ï\rMY@\ÏØ—l<X\è¿ÊŒ·•^Y@5A\Ô}\0R\è¿\'3\ŞVzY@…µ1v\ÂK\è¿\İ\Ó\Õ‹Y@Ÿ9\ëSI\è¿\â°4ğ£Y@\í}ª\n\rD\è¿:!t\ĞY@?RD†U<\è¿\Ù\ë\İ\ïY@§\ê\Ù\\5\è¿Va3ÀY@\Å\æ\ã\ÚP1\è¿Tü\ßY@\ßR\Î{/\è¿*A*Y@‹\ßV*è¿®ò\ÂNY@—¤¤‡!\è¿-Í­VY@ùgñ\è¿t|´8cY@_¸sa¤\è¿û²´SsY@>Àx\r\è¿Y¾.\ÃY@¼yªCn\è¿ \ÑŠY@iÀ\"¿ş\ç¿\à\Ô)Y@\åz\ÛL…ø\ç¿Ø›’“Y@x³\ï«ò\ç¿s0›\0\ÃY@Ì·>¬7\ê\ç¿\Ä\Ë\ÓY@ÿwD…\ê\æ\ç¿fÙ“À\æY@Ò§Uô‡\æç¿…]=ğY@\Ô\ï\Â\Öl\å\ç¿0ò²&\ZY@x\ï¨1!\æ\ç¿5µl­/\ZY@ds\Õ<G\ä\ç¿\è¥bc^\ZY@#½¨\İç¿œ\á|~\ZY@¥	¦š\Ù\ç¿1³\Ïc”\ZY@ò?ù»w\Ô\ç¿Ç=—©\ZY@‰ğ/‚\Æ\Ì\ç¿e®¹\ZY@7İ²Cü\Ã\ç¿-\ìi‡¿\ZY@š\Í\ã0˜¿\ç¿\ãk\Ï,	Y@\åD»\n)¿\ç¿QiY@\Ïh«’È¾\ç¿n1?74Y@»\ÔıL½\ç¿jg˜\ÚRY@¨p©»\ç¿\î\Î\ÚmY@Ç„˜Kª¶ç¿´tÛˆY@\äh¬ü²ç¿±\ÄÊ¦Y@L8 ¥«ç¿¶¡bœ¿Y@™E(¶‚¦\ç¿u\é_’\ÊY@Št?§ \ç¿[\\\ã3\ÙY@¬:«ö˜ç¿ºg]£\åY@)¯•\Ğ]’\ç¿\éºğƒóY@EKOË\ç¿ôÂY@\Ã\××ºÔˆ\ç¿\Ñ!p$Y@L5³–‚\ç¿ñ)\0\Æ3Y@Eôk\ë§\ç¿\×h9\ĞCY@0Hú´Š~\ç¿u\Çb›TY@c\0={\ç¿d­¡\Ô^Y@~Œ¹k	yç¿º÷p\ÉqY@i\àG5\ìwç¿ POY@ MŸt\ç¿ÿA$CY@¹lt\ÎOqç¿’v£ùY@ª)\É:]\ç¿\È\éğY@(¶‚¦%V\ç¿<\Ú8b-Y@FšxxR\ç¿\ã\Å\Â9Y@/¾hR\ç¿_\í(\ÎQY@&jj\ÙZ\ç¿\ç6\á^Y@3Pÿ>c\ç¿l\èf Y@¸\å#)\éa\ç¿[Î¥¸ªY@\ÒQf`\ç¿\0;7m\ÆY@@¼®_ç¿“[\ìY@e®\Ò]\ç¿@‡ùòY@S\"‰^ç¿½\â©G\ZY@\Ú\ç6\á^\ç¿\Ê2Ä±.Y@“\à\riT`ç¿˜Št?Y@4€·@‚b\ç¿6ZôPY@¤§\È!bç¿¾¯YY@¾³^eç¿°\è\ÖkzY@<¢Busq\ç¿5·BXY@{iŠ\0§wç¿ª¶›\à›Y@¡ô…ó~\ç¿ù¾¸T¥Y@\'ø¦é³ƒ\ç¿ND¿¶Y@ºJw\×Ù\ç¿f\Ë-­Y@1\Ñ O¡ç¿\"k\r¥Y@¦\',ñ€²ç¿¾½kĞ—Y@\êŸ\æ\ä\Å\ç¿\æ\å°ûY@¨\àğ‚ˆ\Ô\ç¿-x\ÑWY@[\ìöY\åç¿­5”Ú‹Y@Miı-ø\ç¿ôûşÍ‹Y@p”¼:\Ç\0\è¿OGÉ«Y@‹2d’\è¿\Ğğf\r\ŞY@U¥-®ñ\è¿IØ·“ˆY@2*A*\è¿:\è½Y@x\ÑWf,\è¿1A\r\ß\ÂY@.s±/\è¿1\ïq¦	 Y@Ui‹k|&\è¿z\ßø\Ú3 Y@Šs\Ô\Ñq5è¿—\á?\İ@ Y@º½¤1ZG\è¿ \î\êU Y@\Òû\Æ×Y\è¿\áÎ…‘^ Y@4¾/.Ui\è¿g€²e Y@…\ëQ¸…\è¿òA\Ïf Y@\İy\â9[À\è¿3&c Y@´pY…\Í\è¿IJzZ Y@ö@+0dõ\è¿Yü¦°R Y@\n×£p=\n\é¿\Ï,	PS Y@8\Ù\î@é¿‹jQ Y@C\Èyÿ\'é¿ºq Y@ğ†4*p2\é¿ş\rÚ« Y@Zœ¡8\é¿7§’ Y@p]1#<\é¿Xs€` Y@¿\'Ö©ò=\é¿òy\ÅS Y@”ö_˜L\é¿\Õ\è\Õ\0¥ Y@ª›‹¿m\é¿\0\0\0\0\0\0\0\0\0Ks+„\ÕY@ñ˜õ\â\é¿\Û¦¶\ÔY@	¤Ä®\í\íé¿“6U÷\ÈY@®*û®ş\é¿,¸ğÀY@\Å\Ú\Ç\nş\é¿\ä\×±ÁY@@KW°ø\é¿N\ï\âı¸Y@´­fñé¿\Û/Ÿ¬Y@•\Ô	h\"\ì\é¿\Ûn‚ošY@†U¼‘y\äé¿€\nGY@1²d\å\İ\é¿uXá–Y@‡¥\Õé¿¬Rz¦—Y@¡×Ÿ\Ä\ç\Î\é¿!!\Ê´Y@vOj\Í\é¿W³\Îø¾Y@‚V`\È\ê\Ö\é¿Ks+„\ÕY@ñ˜õ\â\é¿\0\0\0\0\0\0\n\0\0\0fffffY@\ÇfGª\ï|\ë¿ ·_>YY@“r0›€\ë¿d\è\ØAY@³)Wx—‹ë¿¤¦]L3Y@[&\Ãñ|†\ë¿ş\î5&Y@SÍ¬¥€\ë¿?ªa¿\'Y@D?{s\ë¿\Õ{*§=Y@y ²Ho\ë¿R\×\ÚûTY@Mh’XRn\ë¿\06 B\\Y@\ë§ÿ¬ùq\ë¿fffffY@\ÇfGª\ï|\ë¿');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id_hotel` varchar(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `contact` bigint(13) DEFAULT NULL,
  `geom` geometry DEFAULT NULL,
  PRIMARY KEY (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('HTL001','hotel1 baru','jalan hotel1 baru',1111111112,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=i¤u\ÂY@æ– \ï\æ\ì¿=i¤\Ñ\ÏY@v~>\İø\ì¿=i¤Á\îY@Ã§TP\Çğ\ì¿=i¤y\ÜY@›^Ô›\à\ì¿=i¤u\ÂY@æ– \ï\æ\ì¿'),('HTL002','hotel2','jalan hotel2',222222222222,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡\ÆCDY@!1!ºî¿‡\Æ\Ã\áY@\0²AŒ™î¿‡\Æƒ\ÖY@b~+«»\á\í¿‡\Æ\ÃZY@œ/ø›ò\í¿‡\ÆCDY@!1!º\î¿'),('HTL003','hotel3','jalan hotel3',333333333333,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡\Æ‹ŸY@\çW\Ï3\Ô?\í¿‡\Æ£´Y@D­Hº\Òl\í¿‡\Æ›\ZY@ª„¶qW\í¿‡\ÆK\îY@N\Â£x2\í¿‡\Æ‹ŸY@\çW\Ï3\Ô?\í¿');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_gallery`
--

DROP TABLE IF EXISTS `hotel_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_gallery` (
  `id_item` varchar(5) NOT NULL,
  `id_hotel` varchar(6) NOT NULL,
  `gallery_hotel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_item`,`id_hotel`),
  KEY `id_hotel` (`id_hotel`),
  CONSTRAINT `hotel_gallery_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_gallery`
--

LOCK TABLES `hotel_gallery` WRITE;
/*!40000 ALTER TABLE `hotel_gallery` DISABLE KEYS */;
INSERT INTO `hotel_gallery` VALUES ('1','HTL001','HTL0011.jpg');
/*!40000 ALTER TABLE `hotel_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_point`
--

DROP TABLE IF EXISTS `object_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_point` (
  `no_urut` varchar(2) NOT NULL,
  `id_package` varchar(6) NOT NULL,
  `objek` varchar(4) DEFAULT NULL,
  `id_restaurant` varchar(6) DEFAULT NULL,
  `id_worship_place` varchar(6) DEFAULT NULL,
  `id_souvenir` varchar(6) DEFAULT NULL,
  `id_hotel` varchar(6) DEFAULT NULL,
  `id_tourism` varchar(6) DEFAULT NULL,
  `lama_perjalanan` varchar(100) NOT NULL,
  `estimasi_waktu` varchar(100) NOT NULL,
  PRIMARY KEY (`no_urut`,`id_package`),
  KEY `id_package` (`id_package`),
  KEY `object_point_ibfk_2` (`id_restaurant`),
  KEY `object_point_ibfk_3` (`id_worship_place`),
  KEY `object_point_ibfk_4` (`id_souvenir`),
  KEY `object_point_ibfk_5` (`id_hotel`),
  KEY `object_point_ibfk_6` (`id_tourism`),
  CONSTRAINT `object_point_ibfk_1` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`),
  CONSTRAINT `object_point_ibfk_2` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`),
  CONSTRAINT `object_point_ibfk_3` FOREIGN KEY (`id_worship_place`) REFERENCES `worship_place` (`id_worship_place`),
  CONSTRAINT `object_point_ibfk_4` FOREIGN KEY (`id_souvenir`) REFERENCES `souvenir` (`id_souvenir`),
  CONSTRAINT `object_point_ibfk_5` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`),
  CONSTRAINT `object_point_ibfk_6` FOREIGN KEY (`id_tourism`) REFERENCES `tourism` (`id_tourism`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_point`
--

LOCK TABLES `object_point` WRITE;
/*!40000 ALTER TABLE `object_point` DISABLE KEYS */;
INSERT INTO `object_point` VALUES ('1','PKT028','1',NULL,NULL,'SVR004',NULL,NULL,'dfwe','234dsdf'),('1','PKT029','1',NULL,NULL,'SVR004',NULL,NULL,'sdf','sdf'),('1','PKT031','4',NULL,NULL,NULL,NULL,'TRM004','345','345'),('1','PKT034','5',NULL,NULL,NULL,'HTL001',NULL,'',''),('1','PKT035','4',NULL,NULL,NULL,NULL,'tou001','',''),('1','PKT036','4',NULL,NULL,NULL,NULL,'TRM003','asd','asd'),('2','PKT028','1',NULL,NULL,'SVR003',NULL,NULL,'jkasdb','sdkgfsd'),('2','PKT031','4',NULL,NULL,NULL,NULL,'TRM003','345','345'),('2','PKT034','5',NULL,NULL,NULL,'HTL002',NULL,'',''),('2','PKT035','4',NULL,NULL,NULL,NULL,'TRM002','',''),('2','PKT036','4',NULL,NULL,NULL,NULL,'TRM004','asd 10','10'),('3','PKT034','5',NULL,NULL,NULL,'HTL003',NULL,'',''),('3','PKT036','4',NULL,NULL,NULL,NULL,'TRM004','asd 10','10 menit kita disini ges');
/*!40000 ALTER TABLE `object_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `id_package` varchar(6) NOT NULL,
  `id_user` varchar(6) NOT NULL,
  `name` varchar(15) NOT NULL,
  `price` int(11) NOT NULL,
  `itinerary` varchar(200) NOT NULL,
  PRIMARY KEY (`id_package`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES ('PKT001','usr005','Paket1',1111111111,'ini paket1'),('PKT002','usr005','asdf',1231,'sdf'),('PKT003','usr005','souvenir3',2342,'asdassdfsdsd'),('PKT004','usr005','sdf',23452,'sdfsd'),('PKT005','usr005','sdfsd',2345325,'sdfsdf'),('PKT006','usr005','dfgdf',234234,'dfgdf'),('PKT007','usr005','ertert',1234,'erter'),('PKT008','usr005','sdsdf',1234,'sdfsdf'),('PKT009','usr005','jiio',34534,'345'),('PKT010','usr005','asdas',234234,'asdasd'),('PKT011','usr005','asdasd',24234,'asdasd'),('PKT012','usr005','sdfsd',23423,'sdfsd'),('PKT013','usr005','sdf',234,'sdf'),('PKT014','usr005','sdfsd',23423,'sdfsdf'),('PKT015','usr005','sdsdf',42332,'sdfsd'),('PKT016','usr005','dsfs',2342,'sdfs'),('PKT017','usr005','asdf',23424,'sdfsd'),('PKT018','usr005','dfg',324,'dfg'),('PKT019','usr005','dfg',345,'dfg'),('PKT020','usr005','sdf',345345,'sdf'),('PKT021','usr005','baru',1,'baru'),('PKT022','usr005','sdf',45,'sdf'),('PKT023','usr005','baru woi',1234,'baru'),('PKT024','usr005','sdsdf',2345,'sdfsdf'),('PKT025','usr005','dfgdfg',435345,'dfgdf'),('PKT026','usr005','dfgdf',34532,'dfgdf'),('PKT027','usr005','dfgdf',34534,'dfgdf'),('PKT028','usr005','sdfsd',23423,'sdfsd'),('PKT029','usr005','dsfs',234,'sdf'),('PKT030','usr005','paket1',10000,'ini paket1'),('PKT031','usr005','dfgdf',34534,'dfgdfg'),('PKT032','usr005','new hotel',2131,'asdasd'),('PKT033','usr005','dfd',435,'dfg'),('PKT034','usr005','sdfs',34535,'sdf'),('PKT035','usr005','tourism',234234,'asdas'),('PKT036','usr005','new',2342,'sdf'),('PKT037','usr005','asdas',234,'sad');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_gallery`
--

DROP TABLE IF EXISTS `package_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_gallery` (
  `id_item` varchar(5) NOT NULL,
  `id_package` varchar(6) NOT NULL,
  `gallery_package` varchar(20) NOT NULL,
  PRIMARY KEY (`id_item`,`id_package`),
  KEY `id_package` (`id_package`),
  CONSTRAINT `package_gallery_ibfk_1` FOREIGN KEY (`id_package`) REFERENCES `package` (`id_package`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_gallery`
--

LOCK TABLES `package_gallery` WRITE;
/*!40000 ALTER TABLE `package_gallery` DISABLE KEYS */;
INSERT INTO `package_gallery` VALUES ('1','PKT001','PKT0011.jpg'),('1','PKT034','PKT0341.jpg');
/*!40000 ALTER TABLE `package_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id_restaurant` varchar(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `open` time DEFAULT NULL,
  `close` time DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `geom` geometry DEFAULT NULL,
  PRIMARY KEY (`id_restaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES ('RST001','Restaurant1','Jalan resotaurant1','01:00:00','12:00:00','Ini restaurant1',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ÕĞ¤e\ÇY@x`}¡‚\î¿\ÕĞ¤\Í\ÈY@i\à\Îtş†\î¿\ÕĞ¤\ã\ĞY@´}”–…\î¿\ÕĞ¤\Õ\ÏY@x`}¡‚\î¿\ÕĞ¤e\ÇY@x`}¡‚\î¿');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_gallery`
--

DROP TABLE IF EXISTS `restaurant_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_gallery` (
  `id_item` varchar(5) NOT NULL,
  `id_restaurant` varchar(6) NOT NULL,
  `gallery_restaurant` varchar(20) NOT NULL,
  PRIMARY KEY (`id_item`,`id_restaurant`),
  KEY `id_restaurant` (`id_restaurant`),
  CONSTRAINT `restaurant_gallery_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_gallery`
--

LOCK TABLES `restaurant_gallery` WRITE;
/*!40000 ALTER TABLE `restaurant_gallery` DISABLE KEYS */;
INSERT INTO `restaurant_gallery` VALUES ('1','RST001','RST0011.jpg');
/*!40000 ALTER TABLE `restaurant_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` varchar(2) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('A','Admin'),('B','Travel Agent'),('C','Tourist');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souvenir`
--

DROP TABLE IF EXISTS `souvenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `souvenir` (
  `id_souvenir` varchar(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `open` time DEFAULT NULL,
  `close` time DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `geom` geometry DEFAULT NULL,
  PRIMARY KEY (`id_souvenir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souvenir`
--

LOCK TABLES `souvenir` WRITE;
/*!40000 ALTER TABLE `souvenir` DISABLE KEYS */;
INSERT INTO `souvenir` VALUES ('SVR001','Souvenir1','Jalan SOuvenir1','01:00:00','12:00:00','Ini Souvenir1',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0o¡z‡KY@¿–Mı%÷ğ¿o¡zJ=Y@¿–Mı%÷ğ¿o¡zJ=Y@*Q$¼ô¿o¡zHY@Š\ç<@\Òó¿o¡z·HY@¿\n3ÁJ÷¿o¡z\Î@Y@¸\å\äø)÷¿o¡z.;Y@ ‚?÷¿o¡z :Y@MŒ\ÒÏ”9ù¿o¡z‡KY@¿–Mı%÷ğ¿'),('SVR002','Souvenir Pauh','Pauh','01:00:00','12:00:00','Di Pauh',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00Œ\ë>µ\ZY@‘-{V\İ\Ö\í¿0Œë®½\ZY@0¼lÙ¿\Ç\í¿0Œ\ë\Æ\Ò\ZY@\ÏTŠ™!\Ï\í¿0Œ\ëª\Ğ\ZY@\0$FJE\Ø\í¿0Œ\ë>µ\ZY@‘-{V\İ\Ö\í¿'),('SVR003','souvenir3','pauh','01:00:00','12:00:00','ini di pauh',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\à*±Y@Ğ°‹¾x\í¿\à*\Ñ\àY@Ã m\í¿\à*¡\ãY@¨I„\í9‘\í¿\à*­\×Y@™cXNÛ£\í¿\à*±Y@Z@6«¦\í¿\à*iXY@3ñLBC¥\í¿\à*)zY@\å«oo\í¿\à*±Y@Ğ°‹¾x\í¿'),('SVR004','souvenir4','pauh','01:00:00','12:00:00','ini baru di pauh',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À†\Z\çY@şKÅ¿\İs\í¿À†švY@v’V¸¾t\í¿À†šW Y@ ƒ¼u\ru\í¿À†Z\0!Y@¨\éıt\í¿À†\Z\çY@şKÅ¿\İs\í¿');
/*!40000 ALTER TABLE `souvenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souvenir_gallery`
--

DROP TABLE IF EXISTS `souvenir_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `souvenir_gallery` (
  `id_item` varchar(5) NOT NULL,
  `id_souvenir` varchar(6) NOT NULL,
  `gallery_souvenir` varchar(20) NOT NULL,
  PRIMARY KEY (`id_item`,`id_souvenir`),
  KEY `id_souvenir` (`id_souvenir`),
  CONSTRAINT `souvenir_gallery_ibfk_1` FOREIGN KEY (`id_souvenir`) REFERENCES `souvenir` (`id_souvenir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souvenir_gallery`
--

LOCK TABLES `souvenir_gallery` WRITE;
/*!40000 ALTER TABLE `souvenir_gallery` DISABLE KEYS */;
INSERT INTO `souvenir_gallery` VALUES ('1','SVR001','SVR0011.jpg');
/*!40000 ALTER TABLE `souvenir_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourism`
--

DROP TABLE IF EXISTS `tourism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourism` (
  `id_tourism` varchar(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `open` time DEFAULT NULL,
  `close` time DEFAULT NULL,
  `ticket` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `geom` geometry DEFAULT NULL,
  PRIMARY KEY (`id_tourism`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourism`
--

LOCK TABLES `tourism` WRITE;
/*!40000 ALTER TABLE `tourism` DISABLE KEYS */;
INSERT INTO `tourism` VALUES ('tou001','tourism1baruu','tempat1baru','01:00:00','14:00:00',100001,'ini description baru',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡\Æ-\âY@vPIA¸\í¿‡\Æ\àY@ùœö\Å\í¿‡\ÆaùY@ùœö\Å\í¿‡\ÆùY@j\èV·\í¿‡\Æ-\âY@vPIA¸\í¿'),('TRM002','tourism2','tempat2','01:00:00','13:00:00',60,'ashdaks;lasd',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡\Æ{7Y@Q(Î˜\×\ã\í¿‡\Æ{7Y@¤¾aU“\ë\í¿‡\Æ\ËPY@GP„[\ß\ê\í¿‡\Æ\ËPY@¨2û\Õ\Ï\Ü\í¿‡\Æ{7Y@Q(Î˜\×\ã\í¿'),('TRM003','Wisata Kampus','unand','01:00:00','12:00:00',10000,'ini di kampus\r\n',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ÿ/\Ú_Y@C>İ¶j\í¿Ÿ/vxY@Ü†$’™\í¿Ÿ/\İY@…Àğ›‚‹\í¿Ÿ/\Î\ÅY@b0\ì\Éc\í¿Ÿ/\Ú_Y@C>İ¶j\í¿'),('TRM004','Tourism Simp Pasir','SImp Pasir','01:00:00','13:00:00',1999,'ini simp pasir',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‡Æ‹\í\çY@b¤p\Ög¡\í¿‡\Æ§\êY@ –7¥\í¿‡\ÆcòY@7ZÌ¢\í¿‡Æ‹\í\çY@b¤p\Ög¡\í¿');
/*!40000 ALTER TABLE `tourism` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourism_gallery`
--

DROP TABLE IF EXISTS `tourism_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourism_gallery` (
  `id_item` varchar(5) NOT NULL,
  `id_tourism` varchar(6) NOT NULL,
  `gallery_tourism` varchar(20) NOT NULL,
  PRIMARY KEY (`id_item`,`id_tourism`),
  KEY `id_tourism` (`id_tourism`),
  CONSTRAINT `tourism_gallery_ibfk_1` FOREIGN KEY (`id_tourism`) REFERENCES `tourism` (`id_tourism`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourism_gallery`
--

LOCK TABLES `tourism_gallery` WRITE;
/*!40000 ALTER TABLE `tourism_gallery` DISABLE KEYS */;
INSERT INTO `tourism_gallery` VALUES ('1','tou001','tou0011.jpg'),('1','TRM002','TRM0021.jpg'),('1','TRM003','TRM0031.jpg'),('1','TRM004','TRM0041.jpg'),('2','tou001','tou0012.jpg'),('3','tou001','tou0013.jpg');
/*!40000 ALTER TABLE `tourism_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` varchar(6) NOT NULL,
  `role_id` varchar(2) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('usr001','C','malik1','malik1','malik.lubis@gmail.com','pisang1',1111111111),('usr003','A','admin1','admin1','admin1','Rumah admin1 baru',1111111111),('usr004','A','admin2','admin2','admin2@min.com','rumah admin2',222222222222),('usr005','B','agen1','agen1','harrycopter19@gmail.com','Rumah Agen1',111111111),('usr006','B','agen2','agen2','agen2@agen.com','Kantor Agen2',82222222222),('usr007','C','malik2','malik2','malik2@tourist.com','rumah malik',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worship_place`
--

DROP TABLE IF EXISTS `worship_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worship_place` (
  `id_worship_place` varchar(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `geom` geometry DEFAULT NULL,
  PRIMARY KEY (`id_worship_place`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worship_place`
--

LOCK TABLES `worship_place` WRITE;
/*!40000 ALTER TABLE `worship_place` DISABLE KEYS */;
INSERT INTO `worship_place` VALUES ('WOR001','Masjid1','Jalan Masjid1','Ini Masjid1',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¥Û©Z¬Y@†0?ıî¿¥Û©Z¬Y@]ó\åeî¿¥Û©ı®Y@b\Å6„!î¿¥Û©*¯Y@º\æî¿¥Û©Z¬Y@†0?ı\î¿');
/*!40000 ALTER TABLE `worship_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worship_place_gallery`
--

DROP TABLE IF EXISTS `worship_place_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worship_place_gallery` (
  `id_item` varchar(5) NOT NULL,
  `id_worship_place` varchar(6) NOT NULL,
  `gallery_worship_place` varchar(20) NOT NULL,
  PRIMARY KEY (`id_item`,`id_worship_place`),
  KEY `id_worship_place` (`id_worship_place`),
  CONSTRAINT `worship_place_gallery_ibfk_1` FOREIGN KEY (`id_worship_place`) REFERENCES `worship_place` (`id_worship_place`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worship_place_gallery`
--

LOCK TABLES `worship_place_gallery` WRITE;
/*!40000 ALTER TABLE `worship_place_gallery` DISABLE KEYS */;
INSERT INTO `worship_place_gallery` VALUES ('1','WOR001','WOR0011.jpg');
/*!40000 ALTER TABLE `worship_place_gallery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-02  0:15:17
