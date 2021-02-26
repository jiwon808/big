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
INSERT INTO MAJOR VALUES (4, '소프트웨어');
INSERT INTO MAJOR VALUES (5, '인공지능학');

SELECT * FROM STUDENT;
SELECT * FROM MAJOR;

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




-- SwingStudentMng에서 필요한 Query
-- 0. 첫화면에 전공이름들 콤보박스에 추가(mName) : DAO에서 public Vector<String> getMNamelist()
SELECT * FROM MAJOR;

-- 1. 학번검색 (sNo, sName, mName, score) : DAO에서 public StudentSwingDto sNogetStudent(String sNo)
SELECT sNO, sName, mName, score 
    FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO AND SNO ='2021001';


-- 2. 이름검색 (sNo, sName, mName, score)  : DAO에서 public ArrayList<StudentSwingDto> sNamegetStudent(String sName)
SELECT sNO, sName, mName, score 
    FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO AND sNAME = '정우성';


-- 3. 전공검색 (rank, sName(sNo포함), mName(mNo포함), score) : DAO에서 public ArrayList<StudentSwingDto> mNamegetStudent(String mName)
--- 출력 : 1 정우성(2021001) 빅데이터학(1) 90 
SELECT ROWNUM RANK, sNAME||'('||sNO||')' sName, mNAME||'('||mNO||')' mNAME, SCORE
    FROM (SELECT S.*, MNAME FROM STUDENT S, MAJOR M 
            WHERE S.mNO=m.mNO AND mNAME='컴퓨터공학'
            ORDER BY SCORE DESC);

SELECT * FROM STUDENT;
SELECT * FROM MAJOR;


-- 4. 학생입력 : DAO에서 public int insertStudent(String sName, String mName, int score)
--              DAO에서 public int insertStudent(StudentSwingDto dto)

INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000')),
    '이나영',(SELECT mNO FROM MAJOR WHERE mNAME='경영정보학'), 60);
    
COMMIT;


-- 5. 학생수정 : DAO에서 public int updateStudent(String sNo, String sName, String mName, int score)
--              DAO에서 public int updateStudent(StudentSwingDto dto)


UPDATE STUDENT SET  sNAME='이나영', 
                    mNO=(SELECT mNO FROM MAJOR WHERE mNAME='인공지능학'),
                    SCORE = 70 WHERE SNO='2021063';
COMMIT;


-- 6. 학생출력 (rank, sName(sNo포함), mName(mNo포함), score) : DAO에서 public ArrayList<StudentSwingDto> getStudents()
-- 출력 : 1 정우성(2021001) 빅데이터학(1) 90
SELECT ROWNUM RANK, sNAME || '('||sNO || ')' sName,
    mNAME || '(' || mNo || ')' mNAME, SCORE
    FROM (SELECT S.*, mNAME  
    FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO AND sEXPEL=0
    ORDER BY SCORE DESC);
    
    SELECT S.*, mNAME  
    FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO AND sEXPEL=0
    ORDER BY SCORE DESC;  --서브쿼리
    

-- 7. 제적자출력  (rank, sName(sNo포함), mName(mNo포함), score) : DAO에서 public ArrayList<StudentSwingDto> getStudentsExpel()
-- 출력 : 1 김제적(2021004) 컴퓨터공학(3) 10
SELECT ROWNUM RANK, sNAME || '('|| sNO || ')'  sName,
    mNAME ||'(' || mNo || ')' mNAME,  SCORE 
    FROM (SELECT S.*,mNAME FROM STUDENT S, MAJOR M
     WHERE S.mNO = M.mNO  AND sEXPEL =1 
     ORDER BY SCORE DESC);

SELECT S.*,mNAME FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO  AND sEXPEL =1 
    ORDER BY SCORE DESC; --서브쿼리 

-- 8. 제적처리 : DAO에서 public int sNoExpel(String sNo)
UPDATE STUDENT SET sEXPEL =1 WHERE SNO= '2021059';


COMMIT;



