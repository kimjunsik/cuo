CREATE TABLE board(
    postNum NUMBER,
	boardTitle VARCHAR2(50),
	postTitle VARCHAR2(50),
	postContent VARCHAR2(4000) NOT NULL,
	postReadcount NUMBER DEFAULT 0,
	postWriter VARCHAR2(12),
	postRegistTime TIMESTAMP(6) NOT NULL,
	id VARCHAR2(20) PRIMARY KEY,
	FOREIGN KEY (id) REFERENCES member (id) on delete cascade
)
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

CREATE TABLE member(
	id VARCHAR2(20) PRIMARY KEY,
	name VARCHAR2(12),
	passwd VARCHAR2(12) NOT NULL,
	zip1 CHAR(3),
	zip2 CHAR(3),
	addr1 VARCHAR2(100),
	addr2 VARCHAR2(50),
	job VARCHAR2(20),
	email VARCHAR2(30),
	birthday DATE,
	gender CHAR(1),
	homepage VARCHAR2(30)
)

CREATE TABLE zipcode(
	num NUMBER PRIMARY KEY,
	do VARCHAR2(10),
	si VARCHAR2(12),
	gu VARCHAR2(12),
	dong VARCHAR2(12),
	zip VARCHAR2(7)
)