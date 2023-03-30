CREATE TABLE `noti` (
  `notiid` int NOT NULL AUTO_INCREMENT,
  `getid` varchar(20) NOT NULL,
  `putid` varchar(20) NOT NULL,
  `notice` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  `read_at` date DEFAULT NULL,
  PRIMARY KEY (`notiid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

SELECT * FROM noti;
DELETE FROM noti;
DROP TABLE noti;