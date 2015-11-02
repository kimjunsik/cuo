CREATE TABLE board(
    postNum NUMBER PRIMARY KEY,
	boardTitle VARCHAR2(50),
	postTitle VARCHAR2(50),
	postContent VARCHAR2(4000),
	postReadcount NUMBER DEFAULT 0,
	postWriter VARCHAR2(12),
	postRegistTime TIMESTAMP(6) NOT NULL,
	ref NUMBER,
	re_step NUMBER,
	re_level NUMBER,
	ip VARCHAR2(20),
	id VARCHAR2(20), 
	FOREIGN KEY (id) REFERENCES member (id) on delete cascade
)
Select * from board;
drop table board;
drop sequence board_seq;
CREATE SEQUENCE board_seq;

CREATE TABLE comments(
	commentNum NUMBER,
	commentContent VARCHAR2(4000) NOT NULL,
	commentWriter VARCHAR2(12),
	commentRegistTime TIMESTAMP(6) NOT NULL,
	id VARCHAR2(20) PRIMARY KEY,
	FOREIGN KEY (id) REFERENCES member (id) on delete cascade
)

CREATE SEQUENCE comments_seq;

CREATE TABLE menu(
   menuNum NUMBER,
   menuName VARCHAR2(20),
   menuAddress VARCHAR2(100), --주소
   menuBhours VARCHAR2(100), --
   menuEhours VARCHAR2(100),
   menuDel CHAR(1), 
   menuPack CHAR(1),
   menuImage VARCHAR2(12),
   menuMap VARCHAR2(12),
   menuKey VARCHAR2(10),
   menu1 VARCHAR2(50),
   menu2 VARCHAR2(50),
   menu3 VARCHAR2(50),
   menu4 VARCHAR2(50),
   menu5 VARCHAR2(50),
   menu6 VARCHAR2(50),
   menu7 VARCHAR2(50),
   menu8 VARCHAR2(50),
   menu9 VARCHAR2(50),
   menu10 VARCHAR2(50),
   menu11 VARCHAR2(50),
   menu12 VARCHAR2(50),
   id VARCHAR2(20) PRIMARY KEY,
   FOREIGN KEY (id) REFERENCES member (id) on delete cascade
)

CREATE TABLE message(
   id VARCHAR2(20),
    menuKey VARCHAR2(30),
    menuName VARCHAR2(50),
   messageMenu VARCHAR2(50),
   messageQty VARCHAR2(20),
   messageContent VARCHAR2(2000),
   messageCurrent VARCHAR2(100) DEFAULT '미응답' 
   --id VARCHAR2(20) PRIMARY KEY,
   --FOREIGN KEY (id) REFERENCES member (id) on delete cascade
)
SELECT * FROM menu;
SELECT * FROM message;

insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(1, 'oo반점', '집', '0900', '1000', 'o', 'o', '1', '1', '중식', '자장면', '탕수육', '치킨', '', null, null, null, null, null, null, null, null, bbb)
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12") values(2, 'xx치킨', '집', '0900', '1000', 'o', 'o', '1', '1', '치킨', '자장면', '탕수육', '치킨', '', null, null, null, null, null, null, null, null)
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(3, 'oo족발', 'a', 'a', 'a', 'o', 'o', '1', '1', '족발', '양념', '후라이드', null, null, null, null, null, null, null, null, null, null, 'ccc')
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(4, 'oo보쌈', 'a', 'a', 'a', 'o', 'o', '1', '1', '보쌈', '양념', '후라이드', null, null, null, null, null, null, null, null, null, null, 'ddd')
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(5, 'oo분식', 'a', 'a', 'a', 'o', 'o', '1', '1', '분식', '양념', '후라이드', null, null, null, null, null, null, null, null, null, null, 'eee')
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(6, 'oo일식', 'a', 'a', 'a', 'o', 'o', '1', '1', '일식', '양념', '후라이드', null, null, null, null, null, null, null, null, null, null, 'xxx')
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(7, 'oo족발', 'a', 'a', 'a', 'o', 'o', '1', '1', '족발', '양념', '후라이드', null, null, null, null, null, null, null, null, null, null, 'nnn')
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(8, 'oo족발', 'a', 'a', 'a', 'o', 'o', '1', '1', '족발', '양념', '후라이드', null, null, null, null, null, null, null, null, null, null, 'mmm')
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(9, 'oo족발', 'a', 'a', 'a', 'o', 'o', '1', '1', '족발', '양념', '후라이드', null, null, null, null, null, null, null, null, null, null, 'kkk')
insert into "JAVA"."MENU" ("MENUNUM", "MENUNAME", "MENUADDRESS", "MENUBHOURS", "MENUEHOURS", "MENUDEL", "MENUPACK", "MENUIMAGE", "MENUMAP", "MENUKEY", "MENU1", "MENU2", "MENU3", "MENU4", "MENU5", "MENU6", "MENU7", "MENU8", "MENU9", "MENU10", "MENU11", "MENU12", "ID") values(10, 'oo족발', 'a', 'a', 'a', 'o', 'o', '1', '1', '족발', '양념', '후라이드', null, null, null, null, null, null, null, null, null, null, 'lll')
drop TABLE message;
drop TABLE menu;
drop TABLE comments;
drop TABLE board;
drop TABLE member;

CREATE TABLE member(
	id VARCHAR2(20) PRIMARY KEY,
	name VARCHAR2(12),
	passwd VARCHAR2(12) NOT NULL,
	addr VARCHAR2(100),
	birthday DATE,
	grade VARCHAR2(12)
)

SELECT * FROM member;