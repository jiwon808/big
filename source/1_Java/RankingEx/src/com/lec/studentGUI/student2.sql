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

--1. �Է�
INSERT INTO MAJOR VALUES (1, '��������');
INSERT INTO MAJOR VALUES (2, '�濵������');
INSERT INTO MAJOR VALUES (3, '��ǻ�Ͱ���');
INSERT INTO MAJOR VALUES (4, '����Ʈ����');
INSERT INTO MAJOR VALUES (5, '�ΰ�������');

SELECT * FROM STUDENT;
SELECT * FROM MAJOR;

INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )), 
                                '���켺',
                                (SELECT mNO FROM MAJOR WHERE mNAME = '��������'),90,0);                         
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )), 
                                '�ڼ���',
                                (SELECT mNO FROM MAJOR WHERE mNAME = '��������'),80,0);
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )),
                            '�����',
                            (SELECT mNO FROM MAJOR WHERE mNAME = '��ǻ�Ͱ���'),20,0);
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )),
                            'ȫ�浿',
                            (SELECT mNO FROM MAJOR WHERE mNAME = '����Ʈ����'),95,0);
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )),
                            '������',
                            (SELECT mNO FROM MAJOR WHERE mNAME = '�ΰ�������'),100,0);                        
INSERT INTO STUDENT VALUES ( (TO_CHAR(SYSDATE,'YYYY') || TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000') )),
                            'ȫö��',
                            (SELECT mNO FROM MAJOR WHERE mNAME = '����Ʈ����'),20,1);   


--20210101����� ���� *************�߿�********** (trim�ִ� ���� space����)
SELECT TO_CHAR(SYSDATE,'YYYY') ||
    TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000'))
    FROM DUAL;

SELECT mNO FROM MAJOR WHERE mNAME = '��������';




-- SwingStudentMng���� �ʿ��� Query
-- 0. ùȭ�鿡 �����̸��� �޺��ڽ��� �߰�(mName) : DAO���� public Vector<String> getMNamelist()
SELECT * FROM MAJOR;

-- 1. �й��˻� (sNo, sName, mName, score) : DAO���� public StudentSwingDto sNogetStudent(String sNo)
SELECT sNO, sName, mName, score 
    FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO AND SNO ='2021001';


-- 2. �̸��˻� (sNo, sName, mName, score)  : DAO���� public ArrayList<StudentSwingDto> sNamegetStudent(String sName)
SELECT sNO, sName, mName, score 
    FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO AND sNAME = '���켺';


-- 3. �����˻� (rank, sName(sNo����), mName(mNo����), score) : DAO���� public ArrayList<StudentSwingDto> mNamegetStudent(String mName)
--- ��� : 1 ���켺(2021001) ��������(1) 90 
SELECT ROWNUM RANK, sNAME||'('||sNO||')' sName, mNAME||'('||mNO||')' mNAME, SCORE
    FROM (SELECT S.*, MNAME FROM STUDENT S, MAJOR M 
            WHERE S.mNO=m.mNO AND mNAME='��ǻ�Ͱ���'
            ORDER BY SCORE DESC);

SELECT * FROM STUDENT;
SELECT * FROM MAJOR;


-- 4. �л��Է� : DAO���� public int insertStudent(String sName, String mName, int score)
--              DAO���� public int insertStudent(StudentSwingDto dto)

INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SQ.NEXTVAL,'000')),
    '�̳���',(SELECT mNO FROM MAJOR WHERE mNAME='�濵������'), 60);
    
COMMIT;


-- 5. �л����� : DAO���� public int updateStudent(String sNo, String sName, String mName, int score)
--              DAO���� public int updateStudent(StudentSwingDto dto)


UPDATE STUDENT SET  sNAME='�̳���', 
                    mNO=(SELECT mNO FROM MAJOR WHERE mNAME='�ΰ�������'),
                    SCORE = 70 WHERE SNO='2021063';
COMMIT;


-- 6. �л���� (rank, sName(sNo����), mName(mNo����), score) : DAO���� public ArrayList<StudentSwingDto> getStudents()
-- ��� : 1 ���켺(2021001) ��������(1) 90
SELECT ROWNUM RANK, sNAME || '('||sNO || ')' sName,
    mNAME || '(' || mNo || ')' mNAME, SCORE
    FROM (SELECT S.*, mNAME  
    FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO AND sEXPEL=0
    ORDER BY SCORE DESC);
    
    SELECT S.*, mNAME  
    FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO AND sEXPEL=0
    ORDER BY SCORE DESC;  --��������
    

-- 7. ���������  (rank, sName(sNo����), mName(mNo����), score) : DAO���� public ArrayList<StudentSwingDto> getStudentsExpel()
-- ��� : 1 ������(2021004) ��ǻ�Ͱ���(3) 10
SELECT ROWNUM RANK, sNAME || '('|| sNO || ')'  sName,
    mNAME ||'(' || mNo || ')' mNAME,  SCORE 
    FROM (SELECT S.*,mNAME FROM STUDENT S, MAJOR M
     WHERE S.mNO = M.mNO  AND sEXPEL =1 
     ORDER BY SCORE DESC);

SELECT S.*,mNAME FROM STUDENT S, MAJOR M
    WHERE S.mNO = M.mNO  AND sEXPEL =1 
    ORDER BY SCORE DESC; --�������� 

-- 8. ����ó�� : DAO���� public int sNoExpel(String sNo)
UPDATE STUDENT SET sEXPEL =1 WHERE SNO= '2021059';


COMMIT;



