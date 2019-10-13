CREATE TABLE body_type(
user_body_type VARCHAR2(20) primary key
);
/*drop table user_s;*/

CREATE table usertable(
user_id VARCHAR2(20) PRIMARY key,
user_body_type varchar2(20) CONSTRAINT usertable_user_body_type_fk references body_type not null,
user_pw VARCHAR2(20) not NULL,
user_mail VARCHAR2(20) not null,
blacklist char(1) default 'F' not null
);

CREATE TABLE mastertable(
master_id VARCHAR2(20) primary key,
master_pw varchar2(20) not null
);

create table genre(
genre_name VARCHAR2(20) primary key,
user_body_type varchar2(20) CONSTRAINT genre_user_body_type_fk references body_type not null
);
create sequence genre_num nocache;
/*drop SEQUENCE genre_num;*/

CREATE TABLE recommeddress(
recommed_num VARCHAR2(20) primary key,
genre_name varchar2(20) constraint recommeddress_genre_name_fk references genre not null,
recommed_photo_name VARCHAR2(200) not null
);
create sequence recommed_num nocache;
/*drop SEQUENCE recommed_num;*/

create table brand(
brand_name VARCHAR2(20) primary key
);
/*drop table brand;*/

CREATE TABLE top(
top_num VARCHAR2(20) primary key,
brand_name varchar2(20) constraint top_brand_name_fk references brand not null,
genre_name varchar2(20) constraint top_genre_name_fk references genre not null,
top_photo_name varchar2(200) not null
);
create sequence top_num nocache;
/*drop SEQUENCE top_num;*/

create table bottom(
bottom_num varchar2(20) primary key,
brand_name varchar2(20) CONSTRAINT bottom_brand_name_fk references brand not null,
genre_name varchar2(20) constraint bottom_genre_name_fk references genre not null,
bottom_photo_name varchar2(200) not null
);
create sequence bottom_num nocache;
/*drop SEQUENCE bottom_num;*/

create table outers(
outer_num varchar2(20) primary key,
brand_name varchar2(20) constraint outers_brand_name_fk references brand not null,
genre_name varchar2(20) constraint outers_genre_name_fk references genre not null,
outer_photo_name varchar2(200) not null
);
create sequence outer_num nocache;
/*drop SEQUENCE outer_num;*/

create table shoes(
shoes_num varchar2(20) primary key,
brand_name varchar2(20) constraint shoes_brand_name_fk references brand not null,
genre_name varchar2(20) constraint shoes_genre_name_fk references genre not null,
shoes_photo_name varchar2(200) not null
);
create sequence shoes_num nocache;
/*drop SEQUENCE shoes_num;*/

create table selected(
select_num varchar2(20) primary key,
user_id VARCHAR2(20) constraint selected_user_id_fk references usertable not null,
top_num varchar2(20) constraint selected_top_num_fk references top not null,
bottom_num  varchar2(20) constraint selected_bottom_num_fk references bottom not null,
outer_num varchar2(20) constraint selected_outer_num_fk references outers not null,
shoes_num varchar2(20) constraint selected_shoes_num_fk references shoes not null
);
create sequence select_num nocache;
/*drop sequence select_num;*/

create table stats(
stats_num varchar2(20) primary key,
stats_date date default sysdate not null,
user_body_type varchar2(20) constraint stats_user_body_fk references body_type not null,
changeable_name varchar2(20) not null,
selected_count varchar2(20) default 1 not null
);
create sequence stats_num nocache;
/*drop sequence stats_num;*/

CREATE TABLE stats_instar(
stats_instar_num varchar2(20) primary key,
stats_instar_date date default sysdate not null,
changeable_name varchar2(20) not null,
like_count varchar2(20) default 0 not null
);
create sequence stats_instar_num nocache;
/*drop SEQUENCE stats_instar_num;*/

/*drop table board;*/
create table board(
board_num varchar2(20) primary key,
user_id varchar2(20) constraint board_user_id_fk references usertable not null,
board_name varchar2(20) not null,
board_content varchar2(2000) not null,
board_date date default sysdate not null,
view_count varchar2 (20) default 0 not null,
like_count varchar2(20) default 0 not null,
top_num varchar2(20) constraint board_top_num_fk references top not null,
bottom_num varchar2(20) constraint board_bottom_num_fk references bottom not null,
outer_num varchar2(20) constraint board_outer_num_fk references outers not null,
shoes_num varchar2(20) constraint board_shoes_num_fk references shoes not null
);
create sequence board_num nocache;
/*drop SEQUENCE board_num;*/

create table comments(
comment_num varchar2(20) primary key,
board_num varchar2(20) constraint comments_board_num_fk references board not null,
user_id varchar2(20) constraint comments_user_id_fk references usertable not null,
comments_content varchar2(20) not null,
comments_date date default sysdate
);

create sequence comment_num nocache;
/*drop sequence comment_num;*/

insert into 
