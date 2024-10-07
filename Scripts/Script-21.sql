CREATE TABLE board (
   bid NUMBER PRIMARY KEY, -- 번호
   btitle VARCHAR2(200)NOT NULL, -- 제목
   bcontent VARCHAR2(4000), -- 내용
   bwriter VARCHAR2(200), -- 작성자
   bcount NUMBER, -- 조회수
   bregdate DATE -- 작성일시
);

CREATE SEQUENCE seq_board;

SELECT * FROM board;

CREATE TABLE MEMBER(
	MID VARCHAR(200) PRIMARY KEY, 
	MPASS VARCHAR(200) NOT NULL
);

INSERT INTO MEMBER VALUES('HONG','1234');
INSERT INTO MEMBER VALUES('KANG','1234');

SELECT * FROM MEMBER;

SELECT * FROM MEMBER WHERE mid='hong';

COMMIT;


TRUNCATE TABLE BOARD;


ALTER TABLE BOARD ADD(BSORT VARCHAR2(200));

ALTER TABLE BOARD ADD(RCOUNT NUMBER);


ALTER TABLE BOARD ADD(CFN VARCHAR2(200));

ALTER TABLE BOARD 
SELECT * FROM BOARD b;

ALTER  TABLE BOARD DROP COLUMN SFN;



CREATE TABLE REPLY(
	RID NUMBER PRIMARY KEY,
	RWRITER VARCHAR2(200) NOT NULL,
	RCONTENT VARCHAR2(4000),
	RREGDATE TIMESTAMP,
	BID NUMBER,
	FOREIGN KEY (BID) REFERENCES BOARD(BID)
);

CREATE SEQUENCE SEQ_REPLY;

SELECT * FROM REPLY;


SELECT * FROM board;













