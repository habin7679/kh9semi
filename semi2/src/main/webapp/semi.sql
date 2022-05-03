drop sequence board_seq;
drop sequence reply_seq;
ALTER TABLE board DROP PRIMARY KEY DROP INDEX;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE free CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE tip CASCADE CONSTRAINTS;
DROP TABLE cs CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;

commit;

create table board(
board_no number primary key,
board_head varchar2(6) check(board_head in ('공지', '자유', '문의', '팁', '후기')),
board_title varchar2(300) not null,
board_content varchar2(4000) not null,
board_time date default sysdate not null,
board_readcount number default 0 not null,
board_writer references member(member_id) on delete set null
);
create sequence board_seq;

create table reply(
reply_no number primary key,
reply_content varchar2(600) not null,
reply_time date default sysdate not null,
reply_board_no references board(board_no) on delete cascade,
reply_writer references member(member_id) on delete set null
);
create sequence reply_seq;

create table free(
free_no number primary key,
free_board_no references board(board_no) on delete set null,
free_writer references member(member_id) on delete set null
);
create table notice(
notice_no number primary key,
notice_board_no references board(board_no) on delete set null,
notice_writer references member(member_id) on delete set null
);
create table tip(
tip_no number primary key,
tip_board_no references board(board_no) on delete set null,
tip_writer references member(member_id) on delete set null
);
create table cs(
cs_no number primary key,
cs_board_no references board(board_no) on delete set null,
cs_product_no references product(product_no) on delete set null,
cs_writer references member(member_id) on delete set null
);
create table review(
review_no number primary key,
review_board_no references board(board_no) on delete set null,
review_product_no references product(product_no) on delete set null,
review_writer references member(member_id) on delete set null
);

alter table board add(
group_no number not null,
super_no number default 0 not null,
depth number default 0 not null
);