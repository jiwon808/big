DROP TABLE STUDENT;
DROP TABLE MAJOR;
SELECT * FROM STUDENT;
SELECT * FROM MAJOR;

CREATE SEQUENCE MAJOR_SQ
    MAXVALUE 999
    NOCYCLE
    NOCACHE;

CREATE TABLE MAJOR(
    mNO  NUMBER(2) PRIMARY KEY,
    mNAME VARCHAR2(50));

CREATE SEQUENCE STUDENT_SQ
    MAXVALUE 999
    NOCYCLE
    NOCACHE;

CREATE TABLE STUDENT(
    sNO    VARCHAR2(7) PRIMARY KEY,
    SNAME  VARCHAR2(50),
    mNO    NUMBER(2) REFERENCES MAJOR(mNO),
    SCORE  NUMBER(3) DEFAULT 0 CHECK(SCORE>=0 AND SCORE<=100),
    sEXPEL NUMBER(1)DEFAULT 0 CHECK(sEXPEL=0 OR sEXPEL=1));

--1. 입력
INSERT INTO MAJOR VALUES (1, '빅데이터학');
INSERT INTO MAJOR VALUES (2, '경영정보학');
INSERT INTO MAJOR VALUES (3, '컴퓨터공학');
INSERT INTO MAJOR VALUES (4, '소프트웨어학');
INSERT INTO MAJOR VALUES (5, '인공지능학');

INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )), 
                                '정우성',
                                (SELECT mNO FROM MAJOR WHERE mNAME = '빅데이터학'),90,0);                         
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )), 
                                '박세영',
                                (SELECT mNO FROM MAJOR WHERE mNAME = '빅데이터학'),80,0);
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )),
                            '배수지',
                            (SELECT mNO FROM MAJOR WHERE mNAME = '컴퓨터공학'),20,0);
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )),
                            '홍길동',
                            (SELECT mNO FROM MAJOR WHERE mNAME = '소프트웨어'),95,0);
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )),
                            '송혜교',
                            (SELECT mNO FROM MAJOR WHERE mNAME = '인공지능학'),100,0);                        
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )),
                            '홍철수',
                            (SELECT mNO FROM MAJOR WHERE mNAME = '소프트웨어'),20,1);   

--20210101만드는 쿼리 *************중요********** (trim넣는 이유 space제거)
SELECT TO_CHAR(SYSDATE,'YYYY') ||
    TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000'))
    FROM DUAL;

SELECT mNO FROM MAJOR WHERE mNAME = '빅데이터학';


--2.   1    	정우성(2021001)     빅데이터학      	90      점수 높은 순
SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE
    FROM MAJOR M, STUDENT S
    WHERE M.mNO = S.mNO AND mNAME= '빅데이터학'
    ORDER BY SCORE DESC;   --FROM절에 들어갈 서브쿼리
    
SELECT ROWNUM RANK, S.*
    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE
    FROM MAJOR M, STUDENT S
    WHERE M.mNO = S.mNO AND mNAME= '빅데이터학'
    ORDER BY SCORE DESC) S; -- 자바2번에 들어갈 쿼리 

--3번 기능
SELECT ROWNUM RANK, S.*
    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE
    FROM MAJOR M, STUDENT S
    WHERE M.mNO = S.mNO AND sEXPEL=0
    ORDER BY SCORE DESC) S; -- 자바3번에 들어갈 쿼리 
    
--4번 
SELECT ROWNUM RANK, S.*
    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE
    FROM MAJOR M, STUDENT S
    WHERE M.mNO = S.mNO AND S.sEXPEL=1
    ORDER BY SCORE DESC) S;


    
COMMIT;

