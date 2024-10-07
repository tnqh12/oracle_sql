CREATE TABLE PRODUCT (
   PNO NUMBER PRIMARY KEY, -- 품번
   PCOMP VARCHAR2(200), -- 제조사
   PNAME VARCHAR2(200), -- 상품명
   PCOLOR VARCHAR2(200), -- 색상
   PAMT NUMBER, -- 수량
   PPRICE NUMBER, -- 가격
   PMDATE DATE -- 제조일시
);

CREATE SEQUENCE SEQ_PRODUCT;

SELECT * FROM PRODUCT;


CREATE TABLE boards (
   bid NUMBER PRIMARY KEY, -- 번호
   btitle VARCHAR2(200)NOT NULL, -- 제목
   bcontent VARCHAR2(4000), -- 내용
   bwriter VARCHAR2(200), -- 작성자
   bcount NUMBER, -- 조회수
   bregdate DATE -- 작성일시
);

CREATE SEQUENCE seq_boards;

SELECT * FROM boards;