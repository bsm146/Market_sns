CREATE TABLE `boardtbl` (
  `bid` int NOT NULL AUTO_INCREMENT COMMENT '게시글 번호',
  `content` varchar(500) NOT NULL COMMENT '게시글 내용',
  `birth` datetime NOT NULL DEFAULT current_timestamp() COMMENT '작성 날짜',
  `photo` varchar(200) DEFAULT '' COMMENT '사진 주소',
  `id` varchar(20) NOT NULL COMMENT '작성자 아이디',
  `likecount` int NOT NULL DEFAULT 0 COMMENT '좋아요 수',
  `likeWho` varchar(2000) DEFAULT '' COMMENT '좋아요 누른 사람',
  PRIMARY KEY (`bid`),
  KEY `id` (`id`),
  CONSTRAINT `boardtbl_ibfk_1` FOREIGN KEY (`id`) REFERENCES `membertbl` (`mid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

SELECT * FROM boardtbl ORDER BY birth DESC;
DELETE FROM boardtbl WHERE bid = 2;
SELECT count(*) FROM boardtbl ORDER BY birth DESC;
DELETE FROM boardtbl;
DROP TABLE boardtbl;
INSERT INTO boardtbl(content, id, photo) VALUES('아무내용2', 'a', '\\2022\\10\\17\\l20221017155832.png');
INSERT INTO boardtbl(content, id, photo) VALUES('아무내용1', 'a', '\\2022\\10\\17\\r20221017155836.png');
INSERT INTO boardtbl(content, id) VALUES('content2', 'b');
INSERT INTO boardtbl(content, id) VALUES('content3', 'c');
INSERT INTO boardtbl(content, id) VALUES('content4', 'd');


-- selectBoard
SELECT A.bid as '글번호', A.content as '글내용', A.likecount as '좋아요갯수', A.birth as '글쓴날짜', A.id as '글쓴이', A.photo as '글사진', B.pfp as '글쓴이프사', A.likeWho as '좋아요리스트',
(SELECT count(content) FROM commenttbl C WHERE A.bid = C.id) as '댓글 갯수'
FROM boardtbl A LEFT OUTER JOIN membertbl B 
ON A.id = B.mid ORDER BY A.birth DESC;

SELECT A.bid, A.content, A.likecount, A.birth, A.id, A.photo, B.pfp, A.likeWho,
(SELECT count(content) FROM commenttbl C WHERE A.bid = C.id) as '댓글 갯수'
FROM boardtbl A LEFT OUTER JOIN membertbl B 
ON A.id = B.mid ORDER BY A.birth DESC;

SELECT A.bid, A.id, B.pfp, A.likeWho,
(SELECT count(content) FROM commenttbl C WHERE A.bid = C.id) as '댓글 갯수'
FROM boardtbl A LEFT OUTER JOIN membertbl B 
ON A.id = B.mid ORDER BY A.birth DESC;




-- 게시물 상세 조회
SELECT A.bid as '게시글번호', A.content, A.likecount, A.birth, A.id, A.photo, B.pfp, B.mid
, (SELECT count(content) FROM commenttbl C WHERE C.id=A.bid) as '댓글갯수'
, (SELECT pfp FROM boardtbl A, membertbl B WHERE A.bid=6 AND A.id = B.mid) as '글쓴이프사'
FROM boardtbl A, membertbl B, commenttbl C WHERE A.bid=6 GROUP BY A.bid;

SELECT * from boardtbl WHERE bid = 6;

SELECT A.bid, A.content, A.likecount, A.birth, A.id, A.photo, B.pfp, B.mid
, (SELECT pfp FROM boardtbl A, membertbl B WHERE A.bid=2 AND A.id = B.mid) as '프사'
FROM boardtbl A, membertbl B WHERE A.bid=6 GROUP BY A.bid;

SELECT DISTINCT C.cid as '댓글쓴이', C.content, C.birth, C.likeCount, C.id as '게시글 번호'
, (SELECT B.pfp FROM membertbl B WHERE C.cid=B.mid) as '댓글쓴이 프사'
FROM membertbl B, commenttbl C WHERE id = 6;

SELECT DISTINCT C.cid, C.content, C.birth, C.likeCount, C.id
, (SELECT B.pfp FROM membertbl B WHERE C.cid=B.mid)
FROM membertbl B, commenttbl C;

SET sql_safe_updates=0;