drop table customer;
create table customer(
customer_id varchar2(20) primary key check(regexp_like(member_id, '^[a-z][a-z0-9]{7,19}$')),
customer_pw varchar2(16) not null 
check(regexp_like(member_pw, '[a-z]+') and regexp_like(member_pw, '[A-Z]+')
			and regexp_like(member_pw, '[0-9]+') and regexp_like(member_pw, '[!@#$]+')),
customer_name varchar2(21) not null check(regexp_like(customer_name,'^[가-힣]{2,7}$')),
customer_birth char(10) not null,
customer_nick varchar2(30) check(regexp_like(customer_nick, '^[가-힣]{3,10}$')),
customer_emai varchar2(100),
customer_phone char(11) not null check(regexp_like(member_phone, '^010[1-9][0-9]{7}$')),
customer_post varchar2(6),
customer_basic_adress varchar2(300),
customer_detail_adress varchar2(300) not null,
customer_point number default 2000 not null check(member_point>=0),
customer_grade varchar2(12) default '일반회원' not null check(member_grade in('일반회원','우수회원','vip','관리자')),
customer_made_date date default sysdate not null
);