CREATE TABLE `boardLike` (
  `BOARDLIKE_ID` int NOT NULL AUTO_INCREMENT COMMENT '고유 번호',
  `bid` int NOT NULL COMMENT '게시글 번호',
  `likeWho` varchar(500) NOT NULL COMMENT '좋아요 누른 사람',
  PRIMARY KEY (`id`),
  CONSTRAINT `1` FOREIGN KEY (`bid`) REFERENCES `boardtbl` (`bid`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`likeWho`) REFERENCES `membertbl` (`mid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

SELECT * FROM boardLike;
SELECT * FROM boardLike ORDER BY id DESC;
SELECT * FROM boardLike WHERE bid = 12;
DELETE FROM boardLike;
DROP TABLE boardLike;

INSERT INTO boardLike(bid, likeWho) VALUES(12, 'a');
INSERT INTO boardLike(bid, likeWho) VALUES(12, 'b');
INSERT INTO boardLike(bid, likeWho) VALUES(12, 'c');
INSERT INTO boardLike(bid, likeWho) VALUES(12, 'd');
INSERT INTO boardLike(bid, likeWho) VALUES(11, 'd');

INSERT INTO boardLike(bid, likeWho) VALUES(3, 'a');
INSERT INTO boardLike(bid, likeWho) VALUES(4, 'b');