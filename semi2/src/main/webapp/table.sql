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
product_company varchar2(30) not null,
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
drop table product;
create sequence product_no_seq;



insert into product (product_no, product_name,product_sort,product_price,
product_stock,product_company, product_made,product_expire,
product_event,product_kcal,product_protein,product_carbohydrate,
product_fat,product_info) values (product_no_seq.nextval, 
'그린샐러드','샐러드', 4000, 2, '그린푸드','2022-05-01','2022-05-10','0',400,
10,30,20,'맛있어요');




create table likep(
member_id varchar2(20) references member(member_id) on delete cascade,
product_no number references product(product_no)
);

create table cart(
member_id varchar2(20) references member(member_id) on delete cascade,
product_no number references product(product_no) on delete cascade,
cart_amount number default 1 check(cart_amount>0)
);

create sequence order_no_seq;

create table paying(
order_no number primary key, 
member_id varchar2(20) references member(member_id) on delete cascade,
paying_total number check(paying_total>0),
paying_date date, 
paying_name varchar2(21), 
paying_phone varchar2(11), 
paying_post number, 
paying_basic_address varchar2(300), 
paying_detail_address varchar2(300), 
paying_delivery_fee number, 
paying_delivery_date date,
paying_delivery_time number check(paying_delivery_time>=0 and paying_delivery_time <24),
paying_payway varchar2(15)
);

create table credit(
order_no number references paying(order_no) on delete cascade, 
member_id varchar2(20) references member(member_id), 
card_name varchar2(12) check(card_name in('상혁카드', '범식카드', '원주카드')), 
card_num number check(card_num in(1231231231, 1234123411)), 
card_pw varchar2(20) check(card_pw in('khkh', 'ezez')), 
card_price number check(card_price>0),
card_date date default sysdate
);

drop table account;

create table account(
order_no number references paying(order_no) on delete cascade, 
member_id varchar2(20) references member(member_id), 
account_bank varchar2(20) check(account_bank in('하빈은행', '다은은행', '지은은행')), 
account_no number check(account_no in(110110110, 112112112)), 
account_name varchar2(12) not null, 
account_price number check(account_price>0), 
account_check char(1) default 'x' check(account_check in('o', 'x')),
account_date date 
);

create sequence buy_no_seq;

create table buy(
buy_no number primary key, 
member_id varchar2(20) references member(member_id), 
order_no number references paying(order_no) on delete cascade, 
buy_invoice number, 
buy_status varchar2(15) check(buy_status in('입금전','결제완료','배송준비중','배송중','배송완료', '취소완료'))
);

create table orderp(
order_no number references paying(order_no) on delete cascade,
product_no number references product(product_no), 
product_price number, 
order_count number check(order_count>0), 
order_price number, 
order_review char(1) default 'x' check(order_review in('o','x'))
);
