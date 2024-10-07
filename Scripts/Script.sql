--CREATE TABLE PERSON(
--	PNAME VARCHAR2(100),
--	PAGE NUMBER
--);
--
--INSERT INTO PERSON(PNAME, PAGE)VALUES ('홍길동',20);
--SELECT * FROM PERSON;
--
--TRUNCATE TABLE PERSON ;
--
--SELECT pname, page FROM PERSON;
--
--
--
--CREATE TABLE board(
--	bid NUMBER PRIMARY KEY,
--	btitle varchar2(2000)NOT NULL,
--	bcontent varchar2(4000),
--	bregdate timestamp
--);
--
--
--CREATE SEQUENCE bid_seq;
--
--SELECT * FROM board;
--
--DROP SEQUENCE bid_seq;
--
--CREATE TABLE bankaccount(
--	baid NUMBER PRIMARY KEY,
--	baname varchar2(20) NOT NULL,
--	bamoney NUMBER DEFAULT 0
--);
--
--INSERT INTO bankaccount(baid, baname, bamoney)VALUES (1,'홍길동',1000);
--INSERT INTO bankaccount(baid, baname, bamoney)VALUES (2,'강감찬',0);
--
--SELECT * FROM bankaccount;



CREATE  TABLE userinfo(

	username varchar2(20),
	identifier NUMBER PRIMARY KEY,
	firstname varchar2(20),
	lastname varchar2(20)
);

--SELECT(찾는다) *(모두) FROM(어디서) 

SELECT * FROM userinfo;


CREATE TABLE TODO(
	TDID number PRIMARY KEY,
	TDCONTENT VARCHAR2(2000),
	TDCOMPLETE CHAR(1) DEFAULT 'N',
	TDREGDATE TIMESTAMP
);

CREATE SEQUENCE TODO_SEQ;

SELECT * FROM TODO; THEN










