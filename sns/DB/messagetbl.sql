CREATE TABLE `messagetbl` (
  `id` varchar(20) NOT NULL COMMENT '보내는 사람',
  `rid` varchar(20) NOT NULL COMMENT '받는 사람',
  `message` varchar(100) NOT NULL COMMENT '메시지 내용',
  `birth` datetime NOT NULL DEFAULT current_timestamp() COMMENT '보낸 날짜',
  KEY `id` (`id`),
  KEY `rid` (`rid`),
  CONSTRAINT `messagetbl_ibfk_1` FOREIGN KEY (`id`) REFERENCES `membertbl` (`mid`),
  CONSTRAINT `messagetbl_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `membertbl` (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM messagetbl;
SELECT * FROM messagetbl WHERE mid='id1';
DROP TABLE messagetbl;
INSERT INTO messagetbl(mid, pw, email, phone, name, follower) VALUES('id1', 'pw', 'email1', 'phone', 'name', 'follower');
INSERT INTO messagetbl(mid, pw, email, phone, name, follower) VALUES('id2', 'pw', 'email2', 'phone', 'name', 'follower');
UPDATE messagetbl SET pw='123', phone='010' WHERE mid='id1';
DELETE FROM messagetbl;
DELETE FROM messagetbl WHERE mid='id1';
