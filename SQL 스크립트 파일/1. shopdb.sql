-- 데이터베이스(스키마) 생성 : shopdb 
create schema shopdb;
-- *************************************************************************
-- members 테이블 생성 및 구조 조회
create table members
      ( member_id int primary key,
		member_name varchar(8) not null,
		birth date not null,
		job varchar(20),
		phone varchar(20) unique,
		address varchar(80) );
        
desc members;
-- *************************************************************************
-- products 테이블 생성 및 구조 조회
create table products
      ( prod_id int primary key,
		prod_name varchar(20) not null,
		price int check (price > 0),
		make_date date,
		company varchar(10) not null );
        
desc products;
-- *************************************************************************
-- now() 함수 : 현재 날짜와 시간을 반환해 주는 함수
select now()
from dual;
-- *************************************************************************
-- orders 테이블 생성 및 구조 조회
create table orders
     ( order_num int,
		member_id int,
		prod_id int,
		order_date datetime default now(),
		primary key(order_num),
		foreign key(member_id) references members(member_id),
		foreign key(prod_id) references products(prod_id) );
        
desc orders;
-- *************************************************************************
-- stu20 테이블 생성 및 구조 조회
-- auto_increment 속성 : insert 시 자동으로 1부터 시작해서 1씩 증가하는 값을 반환해주는 속성
-- 	            		primary key 또는 unique 제약조건이 지정된 컬럼만 활용 가능
--                      숫자 형식의 데이터 타입에만 활용 가능
create table stu20
     (stu_id int auto_increment primary key,
      stu_name varchar(5) not null,
      age int check (age > 19));
      
desc stu20;
-- *************************************************************************
-- members 테이블에 데이터 삽입
-- 테이블명 뒤에 컬럼명 생략 시에는 values절에 기본 컬럼 순서대로 모든 값이 나열되어 있어야 함.
insert into members
values (100, '홍길동', '1991-12-30', '학생', '010-1111-1111', '부산 부산진구 부전동');

-- 테이블명 뒤에 컬럼명이 작성된 경우에는 values절에 값 리스트와 짝이 맞아야 함.
-- 생략된 컬럼에는 자동으로 null값이 삽입됨.
-- 수동으로 null값 삽입 시에는 null이라고 작성하면 됨.
insert into members(member_id, member_name, birth, phone)
values (101, '김민수', '1990-03-05', '010-2222-2222');

insert into members(member_id, member_name, birth, phone, address)
values (102, '최아영', '1987-11-23', '010-3333-3333', '서울 강남구 선릉로');

insert into members(member_id, member_name, birth, job, phone)
values (103, '홍길동', '1988-05-10', '회사원', '010-4444-4444');

insert into members(member_id, member_name, birth, job)
values (104, '강주영', '1998-08-09', '대학생');

insert into members(member_id, member_name, birth, job, phone, address)
values (105, '고승현', '1995-07-10', '트레이너', '010-5555-5555', '경기도 부천시 원미구');

insert into members
values  (106, '정유빈', '1970-02-04', '회사원', '010-6666-6666', null),
		(107, '이영수', '1988-12-06', null, '010-7777-7777', null),
        (108, '김철수', '1999-01-15', null, '010-8888-8888', '부산 해운대구 센텀로'),
        (109, '최승현', '1995-04-22', '간호사', '010-9999-9999', '서울 강북고 수유동'),
        (110, '한주연', '2001-08-24', '승무원', '010-1010-1010', '대구 수성구 수성로');
-- *************************************************************************
-- members 테이블의 데이터 조회
select *
from members;
-- *************************************************************************
-- products 테이블에 데이터 삽입
insert into products
values (10, '냉장고', 500, null, '삼성');

insert into products
values (20, '컴퓨터', 150, '2022-01-13', '애플'),
	   (30, '세탁기', 250, '2020-03-10', 'LG'),
       (40, 'TV', 200, '2021-09-30', 'LG'),
       (50, '전자렌지', 50, '2019-06-20', '삼성'),
       (60, '건조기', 300, '2021-07-09', 'LG');
-- *************************************************************************
-- products 테이블의 데이터 조회       
select *
from products;
-- *************************************************************************
-- orders 테이블에 데이터 삽입
insert into orders
values (1, 101, 20, '2022-02-01');

insert into orders
values (2, 107, 40, '2022-02-05 17:51');

-- now() 함수를 활용한 데이터 삽입
insert into orders
values (3, 106, 50, now());

-- default 값이 선언된 컬럼은 insert 작업 시 생략되면 자동으로 기본값이 삽입됨.
insert into orders(order_num, member_id, prod_id)
values (4, 103, 10);

-- default 값이 선언된 컬럼에 수동으로 기본값 삽입 방법
insert into orders
values (5, 108, 50, default);

insert into orders
values (6, 103, 30, default);

insert into orders
values (7, 105, 60, default);

insert into orders
values (8, 110, 40, '2021-12-30 10:30:45'),
	   (9, 107, 30, default),
       (10, 101, 60, now());
-- *************************************************************************
-- orders 테이블의 데이터 조회       
select *
from orders;
-- *************************************************************************
-- stu20 테이블에 데이터 삽입
-- auto_increment 속성이 지정된 컬럼은 insert 작업 시 null값을 지정하면 자동으로 값이 입력됨.
-- auto_increment 속성의 기본값 : 1부터 시작해서 1씩 증가하는 값이 자동 반환됨.
insert into stu20
values (null, '김온달', 28);

insert into stu20
values (null, '이평강', 24);

select *
from stu20;

-- auto_increment 속성의 시작값 변경 방법
-- 시작값만 변경되며, 증가 사이즈는 기본적으로 1씩 증가됨.
alter table stu20 auto_increment=100;

insert into stu20
values (null, '최찬미', 29);

insert into stu20
values (null, '김동희', 31);

select *
from stu20;

-- auto_increment 속성의 증가 사이즈 변경 방법
set @@auto_increment_increment=5;

insert into stu20
values (null, '박혜경', 22);

insert into stu20
values (null, '문진원', 27);

select *
from stu20;
-- *************************************************************************