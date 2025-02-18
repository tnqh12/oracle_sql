-- CODES 테이블 생성
CREATE TABLE CODES(
   CODE VARCHAR2(100) NOT NULL,
   PARENT_CODE VARCHAR2(100),
   CODE_NAME VARCHAR2(100),
   PRIMARY KEY (CODE)
);

-- USERS 테이블 생성
CREATE TABLE USERS (
    U_ID VARCHAR2(50) NOT NULL,
    U_PW VARCHAR2(100) NULL,
    U_NAME VARCHAR2(50) NULL,
    U_PHONE VARCHAR2(50) NULL,
    U_ADD VARCHAR2(100) NULL,
    U_PROFILE VARCHAR2(100) NULL,
    U_EMAIL VARCHAR2(100) NOT NULL,
    U_CERTIFIED VARCHAR2(50) NULL,
    U_CDATE TIMESTAMP NOT NULL,
    U_EDATE TIMESTAMP NULL,
    U_ACTIVATE VARCHAR2(10) NULL,
    U_RENUM NUMBER NULL,
    U_CODE VARCHAR2(50) NULL,
    MAIN_COMPLETE VARCHAR2(50) NULL,
    U_DSTATUS VARCHAR2(50) NOT NULL,
    U_DREASON VARCHAR2(100) NULL,
    U_DDATE TIMESTAMP NULL,
    U_NICKNAME VARCHAR2(30) NULL, -- 닉네임
    U_ITD VARCHAR2(20) NULL, -- 한 줄 소개
    U_BIRTHDAY TIMESTAMP NULL, -- 생일
    U_GENDER VARCHAR2(20) NULL, -- 성별
    AUTH_TOKEN VARCHAR2(10),
    TOKEN_EXPIRY TIMESTAMP,
    PRIMARY KEY (U_ID)
);
ALTER TABLE USERS ADD DEACTIVATED_BY VARCHAR(10);

-- STORY 테이블 생성
CREATE TABLE STORY (
    ST_NUM NUMBER NOT NULL,
    ST_TITLE VARCHAR2(100) NULL,
    ST_CRDATE TIMESTAMP NOT NULL,
    ST_EDDATE TIMESTAMP NULL,
    ST_VIEWNUM NUMBER NULL,
    ST_TYPECODE VARCHAR2(50) NOT NULL,
    ST_GENRECODE VARCHAR2(50) NOT NULL,
    ST_SUGNUM NUMBER NULL,
    ST_COVER VARCHAR2(100) NULL,
    ST_DSTATUS VARCHAR2(50) DEFAULT 'N' NOT NULL,
    ST_DREASON VARCHAR2(100) NULL,
    ST_DDATE TIMESTAMP NULL,
    U_ID VARCHAR2(50) NOT NULL,
    END_CODE VARCHAR2(50) NULL, -- 엔딩 코드 필드 추가
    ST_RENUM NUMBER DEFAULT 0,
    INITIAL_MONEY NUMBER(5) DEFAULT 0, -- 초기 돈 필드 추가
    INITIAL_HP NUMBER(5) DEFAULT 100,  -- 초기 체력 필드 추가
    PRIMARY KEY (ST_NUM),
    FOREIGN KEY (U_ID) REFERENCES USERS(U_ID)
);


-- SCENE 테이블 생성
CREATE TABLE SCENE (
    SC_NUM NUMBER NOT NULL,
    ST_NUM NUMBER NOT NULL,
    PARENT_SC_NUM NUMBER NOT NULL,
    SC_LEVEL NUMBER NOT NULL,
    SC_TEXT VARCHAR2(500) NULL,
    SC_ILLUS VARCHAR2(200) NULL,
    MONEY NUMBER NULL,
    HP NUMBER NULL,
    END_CODE VARCHAR2(50) NULL,
    SOUND_CODE VARCHAR2(50) NULL,
    PRIMARY KEY (SC_NUM, ST_NUM, PARENT_SC_NUM, SC_LEVEL),
    FOREIGN KEY (ST_NUM) REFERENCES STORY(ST_NUM) ON DELETE CASCADE
);

-- CHOICE 테이블 생성
CREATE TABLE CHOICE (
    CHOICE_NUM NUMBER NOT NULL,
    SC_NUM NUMBER NOT NULL,
    ST_NUM NUMBER NOT NULL,
    PARENT_SC_NUM NUMBER NOT NULL,
    SC_LEVEL NUMBER NOT NULL,
    CHOICE_NAME VARCHAR2(255),
    CHOICE_CONTENT VARCHAR2(4000),
    MONEY NUMBER,
    HP NUMBER,
    PRIMARY KEY (CHOICE_NUM, SC_NUM, ST_NUM, PARENT_SC_NUM, SC_LEVEL),
    FOREIGN KEY (SC_NUM, ST_NUM, PARENT_SC_NUM, SC_LEVEL) REFERENCES SCENE(SC_NUM, ST_NUM, PARENT_SC_NUM, SC_LEVEL) ON DELETE CASCADE
);
-- CHOICE 테이블에 NEXT_SC_NUM 필드 추가
ALTER TABLE CHOICE ADD NEXT_SC_NUM NUMBER;
ALTER TABLE CHOICE MODIFY NEXT_SC_NUM NUMBER NOT NULL;
ALTER TABLE CHOICE MODIFY NEXT_SC_NUM NUMBER NULL;




-- PLAYER 테이블 생성
CREATE TABLE PLAYER (
    PLAYER_NUM NUMBER NOT NULL,
    ST_NUM NUMBER NOT NULL,
    U_ID VARCHAR2(50) NOT NULL,
    RECOMMENDED VARCHAR2(1) DEFAULT 'N' NOT NULL,
    PRIMARY KEY (PLAYER_NUM),
    FOREIGN KEY (ST_NUM) REFERENCES STORY(ST_NUM) ON DELETE CASCADE,
    FOREIGN KEY (U_ID) REFERENCES USERS(U_ID) ON DELETE CASCADE
);

-- REPORT 테이블 생성
CREATE TABLE REPORT (
    RE_NUM NUMBER NOT NULL,
    ST_NUM NUMBER NOT NULL,
    RE_TYPECODE VARCHAR2(50) NOT NULL,
    RE_TEXT VARCHAR2(200) NOT NULL,
    RE_DATE TIMESTAMP NOT NULL,
    U_ID VARCHAR2(50) NOT NULL,
    RE_RP VARCHAR2(200) NULL,
    PRIMARY KEY (RE_NUM),
    FOREIGN KEY (ST_NUM) REFERENCES STORY(ST_NUM) ON DELETE CASCADE,
    FOREIGN KEY (U_ID) REFERENCES USERS(U_ID) ON DELETE CASCADE
);

-- NOTICE 테이블 생성
CREATE TABLE NOTICE (
    NT_NUM NUMBER NOT NULL,
    NT_TYPECODE VARCHAR2(50) NOT NULL,
    NT_TITLE VARCHAR2(100) NOT NULL,
    NT_TEXT VARCHAR2(200) NOT NULL,
    NT_CRDATE TIMESTAMP NOT NULL,
    NT_EDDATE TIMESTAMP NULL,
    U_ID VARCHAR2(50) NOT NULL,
    PRIMARY KEY (NT_NUM),
    FOREIGN KEY (U_ID) REFERENCES USERS(U_ID) ON DELETE CASCADE
);

-- INQUIRY 테이블 생성
CREATE TABLE INQUIRY (
    INQ_NUM NUMBER NOT NULL,
    INQ_TITLE VARCHAR2(100) NOT NULL,
    INQ_TEXT VARCHAR2(200) NOT NULL,
    INQ_TYPECODE VARCHAR2(50) NOT NULL,
    INQ_GENRECODE VARCHAR2(50) NULL,
    INQ_FILE VARCHAR2(100) NULL,
    INQ_CRDATE TIMESTAMP NOT NULL,
    INQ_EDDATE TIMESTAMP NULL,
    INQ_DSTATUS VARCHAR2(50) NOT NULL,
    INQ_DREASON VARCHAR2(100) NULL,
    INQ_DDATE TIMESTAMP NULL,
    U_ID VARCHAR2(50) NOT NULL,
    PRIMARY KEY (INQ_NUM),
    FOREIGN KEY (U_ID) REFERENCES USERS(U_ID) ON DELETE CASCADE
);

-- COMMENTS 테이블 생성
CREATE TABLE COMMENTS (
    CMT_NUM NUMBER NOT NULL,
    INQ_NUM NUMBER NOT NULL,
    CMT_DATE TIMESTAMP NOT NULL,
    CMT_TEXT VARCHAR2(200) NOT NULL,
    PRIMARY KEY (CMT_NUM),
    FOREIGN KEY (INQ_NUM) REFERENCES INQUIRY(INQ_NUM) ON DELETE CASCADE
);


SELECT * FROM CODES;
SELECT * FROM USERS;
SELECT * FROM STORY;
SELECT * FROM SCENE;
SELECT * FROM CHOICE;
SELECT * FROM INQUIRY;
SELECT * FROM NOTICE;
SELECT * FROM COMMENTS;
SELECT * FROM PLAYER;
SELECT * FROM REPORT;


-- SEQUENCE 생성
CREATE SEQUENCE SEQ_STORY START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_SCENE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_REPORT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE NOTICE_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_INQUIRY START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PLAYER START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_COMMENT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_CHOICE START WITH 1 INCREMENT BY 1;


-- CODES 테이블 데이터 삽입
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CA-01','CA-00','일반 회원가입');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CA-02','CA-00','카카오톡 회원가입');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CST-01','CST-00','메인스토리');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CST-02','CST-00','회원스토리');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-01','CG-00','판타지');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-02','CG-00','스릴러');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-03','CG-00','코미디');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-04','CG-00','SF');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-05','CG-00','미스터리');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-06','CG-00','로맨스');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-07','CG-00','호러');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-08','CG-00','무협');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-09','CG-00','드라마');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-10','CG-00','서부');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CG-11','CG-00','역사');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CI-05','CI-01','접수 완료');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CI-06','CI-01','처리중');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CI-07','CI-01','처리 완료');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CN-01','CN-00','업데이트');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CN-02','CN-00','일반');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CN-03','CN-00','버그수정');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CE-01','CE-00','해피엔딩');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CE-02','CE-00','새드엔딩');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CE-03','CE-00','열린결말');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CU-01','CU-00','회원');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CU-02','CU-00','관리자');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CT-01','CT-00','인기순');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CT-02','CT-00','최신순');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CS-01','CS-00','배경음악');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CS-02','CS-00','효과음');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CR-01','CR-00','회원 신고');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CR-02','CR-00','스토리 신고');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CM-01','CM-00','공지사항 관리');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CM-02','CM-00','스토리 관리');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CM-03','CM-00','사용자 관리');
INSERT INTO CODES (CODE, PARENT_CODE, CODE_NAME) VALUES ('CM-04','CM-00','신고 관리');

COMMIT;

DROP table CODES  ;
DROP table USERS  ;
DROP table STORY  ;
DROP table SCENE  ;
DROP table CHOICE  ;
DROP table PLAYER  ;
DROP table REPORT  ;
DROP table NOTICE  ;
DROP table INQUIRY  ;
DROP table COMMENTS  ;

DROP sequence SEQ_STORY  ;
DROP sequence SEQ_SCENE  ;
DROP sequence SEQ_REPORT  ;
DROP sequence NOTICE_SEQ  ;
DROP sequence SEQ_INQUIRY  ;
DROP sequence SEQ_PLAYER  ;
DROP sequence SEQ_COMMENT  ;
