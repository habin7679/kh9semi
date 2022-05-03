drop table member cascade CONSTRAINTS;
create table member(
member_id varchar2(20) primary key check(regexp_like(member_id, '^[a-z][a-z0-9]{7,19}$')),
member_pw varchar2(16) not null 
check(regexp_like(member_pw, '[a-z]+') and regexp_like(member_pw, '[A-Z]+')
			and regexp_like(member_pw, '[0-9]+') and regexp_like(member_pw, '[!@#$]+')),
member_name varchar2(21) not null check(regexp_like(member_name,'^[가-힣]{2,7}$')),
member_nick varchar2(30) not null unique check(regexp_like(member_nick, '^[가-힣]{3,10}$')),
member_phone char(11) not null check(regexp_like(member_phone, '^010[1-9][0-9]{7}$')),
member_email varchar2(100),
member_birth char(10) not null,
member_post varchar2(6),
member_basic_address varchar2(300),
member_detail_address varchar2(300),
member_point number default 2000 not null check(member_point >= 0),
member_grade varchar2(12) default '일반회원' not null check(member_grade in ('일반회원', '우수회원', '관리자','vip')),
member_joindate date default sysdate not null
);


create table product(
product_no number primary key,
product_name varchar2(100) not null,
product_sort varchar2(50) check(product_sort in ('정기배송','닭가슴살','샐러드','소고기','간식','도시락')) ,
product_price number not null,
product_stock number not null,
prduct_company varchar2(30) not null,
product_made date not null,
product_expire date not null,
product_event char(1) check(product_event in ('0','1')),
product_kcal number not null,
product_protein number not null,
product_carbohydrate number not null,
product_fat number not null,
product_info varchar2(100) not null,
product_img varchar2(90) not null
);
create sequence product_no_seq;