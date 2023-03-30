CREATE TABLE `membertbl` (
  `mid` varchar(20) NOT NULL COMMENT '회원 아이디',
  `pw` varchar(20) NOT NULL COMMENT '비밀번호',
  `email` varchar(50) DEFAULT NULL COMMENT '이메일',
  `pfp` varchar(50) DEFAULT NULL COMMENT '프로필사진',
  `phone` varchar(15) NOT NULL COMMENT '전화번호',
  `name` varchar(15) NOT NULL COMMENT '회원 이름',
  `birth` date NOT NULL COMMENT '생년월일',
  `intro` varchar(100) DEFAULT NULL COMMENT '자기소개',
  `follower` varchar(500) DEFAULT '' COMMENT '팔로워',
  `followerCount` int DEFAULT 0 COMMENT '팔로워 수',
  `isprivate` varchar(500) DEFAULT 'no' COMMENT '계정 공개 비공개',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT * FROM membertbl;
SELECT * FROM membertbl WHERE mid='d';
DELETE FROM membertbl;
DROP TABLE membertbl;
INSERT INTO membertbl(mid, pw, email, pfp, phone, name, birth, intro) VALUES('a', 'a', 'email1', 'pfp1', 'phone1', 'name1', '1993-11-24', 'intro1');
INSERT INTO membertbl(mid, pw, email, pfp, phone, name, birth, intro) VALUES('b', 'b', 'email2', 'pfp2', 'phone2', 'name2', '1993-11-24', 'intro2');
INSERT INTO membertbl(mid, pw, email, pfp, phone, name, birth, intro) VALUES('c', 'c', 'email3', 'pfp3', 'phone3', 'name3', '1993-11-24', 'intro3');
INSERT INTO membertbl(mid, pw, email, pfp, phone, name, birth, intro) VALUES('d', 'd', 'email4', 'pfp4', 'phone4', 'name4', '1993-11-24', 'intro4');

INSERT INTO membertbl(mid, pw, email, pfp, phone, name, birth, intro) VALUES('admin', '1234', 'emaileeeeee', 'pfp4', 'phone4', 'name4', '1993-11-24', 'intro4');

-- 팔로우
SELECT follower, followerCount FROM membertbl;
SELECT follower, followerCount FROM membertbl WHERE mid='b';
UPDATE membertbl SET follower = 'a' WHERE mid = 'b';
UPDATE membertbl SET followerCount = followerCount + 1 WHERE mid = 'b';