CREATE TABLE `commenttbl` (
  `commentid` int NOT NULL AUTO_INCREMENT COMMENT '댓글 번호',
  `cid` varchar(20) NOT NULL COMMENT '댓글 작성자 아이디',
  `content` varchar(100) NOT NULL COMMENT '댓글 내용',
  `birth` datetime NOT NULL DEFAULT current_timestamp() COMMENT '댓글 등록일',
  `id` int NOT NULL COMMENT '댓글 등록할 게시글 아이디',
  `likecount` int NOT NULL DEFAULT 0 COMMENT '좋아요 수',
  KEY `cid` (`cid`),
  KEY `id` (`id`),
  PRIMARY KEY (`commentid`),
  CONSTRAINT `commenttbl_FK` FOREIGN KEY (`cid`) REFERENCES `membertbl` (`mid`) ON DELETE CASCADE, 
  CONSTRAINT `commenttbl_FK_1` FOREIGN KEY (`id`) REFERENCES `boardtbl` (`bid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM commenttbl ORDER BY birth DESC;
DELETE FROM commenttbl;
DROP TABLE commenttbl;

INSERT INTO commenttbl(cid, content, id) VALUES('a', 'comment1', 19);
INSERT INTO commenttbl(cid, content, id) VALUES('b', 'comment2', 2);
INSERT INTO commenttbl(cid, content, id) VALUES('c', 'comment3', 4);
INSERT INTO commenttbl(cid, content, id) VALUES('d', 'comment4', 1);

SELECT DISTINCT C.cid, C.content, C.birth, C.likeCount, C.id
, (SELECT B.pfp FROM membertbl B WHERE C.cid=B.mid)
FROM membertbl B, commenttbl C WHERE id = 12 ORDER BY birth DESC;

SELECT * FROM commenttbl ORDER BY birth DESC;
SELECT * FROM commenttbl;

SET sql_safe_updates=0;