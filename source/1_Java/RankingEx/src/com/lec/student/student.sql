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
INSERT INTO MAJOR VALUES (4, '����Ʈ������');
INSERT INTO MAJOR VALUES (5, '�ΰ�������');

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


--2.   1    	���켺(2021001)     ��������      	90      ���� ���� ��
SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE
    FROM MAJOR M, STUDENT S
    WHERE M.mNO = S.mNO AND mNAME= '��������'
    ORDER BY SCORE DESC;   --FROM���� �� ��������
    
SELECT ROWNUM RANK, S.*
    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE
    FROM MAJOR M, STUDENT S
    WHERE M.mNO = S.mNO AND mNAME= '��������'
    ORDER BY SCORE DESC) S; -- �ڹ�2���� �� ���� 

--3�� ���
SELECT ROWNUM RANK, S.*
    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE
    FROM MAJOR M, STUDENT S
    WHERE M.mNO = S.mNO AND sEXPEL=0
    ORDER BY SCORE DESC) S; -- �ڹ�3���� �� ���� 
    
--4�� 
SELECT ROWNUM RANK, S.*
    FROM(SELECT sNAME || '(' || sNO || ')'sNAME, mNAME, SCORE
    FROM MAJOR M, STUDENT S
    WHERE M.mNO = S.mNO AND S.sEXPEL=1
    ORDER BY SCORE DESC) S;


    
COMMIT;

