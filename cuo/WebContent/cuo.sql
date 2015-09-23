CREATE TABLE board(
    postNum NUMBER,
	boardTitle VARCHAR2(50),
	postTitle VARCHAR2(50),
	postContent VARCHAR2(4000) NOT NULL,
	postReadcount NUMBER DEFAULT 0,
	postWriter VARCHAR2(12),
	postRegistTime TIMESTAMP(6) NOT NULL,
	ref NUMBER,
	re_step NUMBER,
	re_level NUMBER,
	ip VARCHAR2(20),
	id VARCHAR2(20) PRIMARY KEY,
	FOREIGN KEY (id) REFERENCES member (id) on delete cascade
)

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
	menuNum NUMBER PRIMARY KEY,
	menuName VARCHAR2(20),
	menuAddress VARCHAR2(100),
	menuBhours VARCHAR2(100),
	menuEhours VARCHAR2(100),
	menuDel CHAR(1), 
	menuPack CHAR(1),
	menuImage VARCHAR2(12),
	menuMap VARCHAR2(12),
	menuKey VARCHAR2(10)
)

CREATE TABLE message(
	messageName VARCHAR2(50),
	messageList VARCHAR2(20),
	messageContent VARCHAR2(2000),
	id VARCHAR2(20) PRIMARY KEY,
	FOREIGN KEY (id) REFERENCES member (id) on delete cascade
)

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
