drop table member cascade CONSTRAINTS;
create table member(
member_id varchar2(20) primary key check(regexp_like(member_id, '^[a-z][a-z0-9]{7,19}$')),
member_pw varchar2(16) not null 
check(regexp_like(member_pw, '[a-z]+') and regexp_like(member_pw, '[A-Z]+')
			and regexp_like(member_pw, '[0-9]+') and regexp_like(member_pw, '[!@#$]+')),
member_name varchar2(21) not null check(regexp_like(member_name,'^[가-힣]{2,7}$')),
member_nick varchar2(30) not null unique check(regexp_like(member_nick, '^[가-힣]{3,10}$')),
member_phone number(11) not null check(regexp_like(member_phone, '^010[1-9][0-9]{7}$')),
member_email varchar2(100),
member_birth date not null,
member_post number,
member_basic_address varchar2(300),
member_detail_address varchar2(300),
member_point number default 2000 not null check(member_point >= 0),
member_grade varchar2(12) default '일반회원' not null check(member_grade in ('일반회원', '우수회원', '관리자','vip')),
member_joindate date default sysdate not null
);