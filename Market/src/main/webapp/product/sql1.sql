show tables;	-- 테이블 정보
desc member;	-- 테이블의 컬럼 정보

insert into member values(100, '홍길동', '1235');
insert into member(name, passwd) values('홍길동', '1235');

select * from member where id=1;
select * from member order by passwd desc;

update member set name='홍홍홍' where name='홍길석';

delete from member where id=1;
delete from member;

select * from member;

drop table member;

create table member(
	id 		int 			not null,
	name 	varchar(50)		not null,
	pw 		varchar(50) 	not null,
	primary key(id)
);

------------------------------------------------------------------------------------------------------------

create table product(
	productID 		varchar(50)		 ,
	pname 			varchar(50)		 ,
	unitPrice 		int 			 ,
	description 	varchar(50)		 ,
	menufacturer	varchar(50)		 ,
	category 		varchar(50)		 ,
	unitInStock 	int 			 ,
	conditionn 		varchar(50)		 ,
	countt			int				 ,
	img				varchar(50)
);

insert into product values('1', '아', 1400000, 'iphne!!!', 'Apple', 'SmartPhone', 111, '새상품', 1, '아이폰.png');
insert into product values('2', '갤', 1200000, 'Galaxy!!!', 'Samsung', 'SmartPhone', 222, '새상품', 1, '갤럭시.png');
insert into product values('3', '그', 1500000, 'Gram!!!', 'LG', 'Notebook', 333, '새상품', 1, '그램.png');
insert into product values('4', '구', 1200000, 'Galaxy!!!', 'Samsung', 'SmartPhone', 222, '새상품', 1, '구름.png');
insert into product values('5', '꽃', 1200000, 'Galaxy!!!', 'Samsung', 'SmartPhone', 222, '새상품', 1, '꽃.png');

select * from product;
select countt from product where pname='아';

update product set productID='2', pname='2', unitPrice=2, description='2', menufacturer='2', category='2', unitInStock=2, conditionn='2', countt=2, img='아이폰.png' where pname='아';
update product set countt=0 where pname='아';

delete from product;
drop table product;

------------------------------------------------------------------------------------------------------------

create table cart(
	productID 		varchar(50)		 ,
	pname 			varchar(50)		 ,
	unitPrice 		int 			 ,
	countt			int				 
);

select * from cart;
delete from cart;
delete from cart where pname='아';
drop table cart;