--[ VII ] DDL, DCL, DML

-- SQL = DDL(���̺� ����, ����, ��������, ���̺� ����������)   DEFINITION
--     + DML (SELECT, INSERT, UPDATE, DELETE)             MANIPULATION
--     + DCL (����ڰ�������, ����ڿ��� ���� �ο�, ���� ��Ż, Ʈ�����Ǹ�ɾ�[�Ѳ����� ��Ƽ� ����])   CONTROL

--�ڡڡ� DDL (DATA DEFINITIONLANGUAGE) (���̺� ����, ����, ��������, ���̺� ����������)  �ڡڡ�--
--1. ���̺� ���� (CREATE TABLE)              --���̺� �̸� ���ڷ� ����x �����ڷ� ���� o  / (field name, type)
CREATE TABLE BOOK(
    BOOKID    NUMBER(4),    --������ȣ
    BOOKNAME  VARCHAR2(20), --�����̸�                    --���� 20BYTE
    PUBLISHER VARCHAR2(20), --���ǻ�
    RDATE     DATE,         --������
    PRICE     NUMBER(8),    --����
    PRIMARY KEY(BOOKID)    --���̺� �� ��Ű(PRIMARY KEY) = ����, NOT NULL
);          
DROP TABLE BOOK; --BOOK ���̺� ����
CREATE TABLE BOOK(
    BOOKID    NUMBER(4) PRIMARY KEY,
    BOOKNAME  VARCHAR2(20),     --VARCHR2  2000byte �ۿ��ȵ�
    PUBLISHER VARCHAR2(20),
    RDATE     DATE,
    PRICE     NUMBER(8)
);
SELECT * FROM BOOK;
-- EMP�� ������ EMP01 : EMPNO(NUMBER4), ENAME( ����-20) SAL*(����7,2)]
CREATE TABLE EMPNO1(
    EMPNO NUMBER (4),
    ENAME VARCHAR2(20),
    SAL NUMBER(7,2)
    );
    
SELECT * FROM EMP01;
DESC EMP01;

--DEPT01 -DEPTNO(����2), DNAME(����14), LOC(����13)
CREATE TABLE DEPT01(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);
SELECT * FROM DEPT01;

--���������� �̿��� ���̺� ����
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP; --�������� ����� EMP02(���������� ������)
SELECT * FROM EMP02;
INSERT INTO EMP02(EMPNO, ENAME, DEPTNO) VALUES(7369, 'HONG', 90); --

--EMP03; ���̺��� EMPNO,ENAME,DEPTNO�� ����
CREATE TABLE EMP03
    AS
    SELECT  EMPNO,ENAME,DEPTNO FROM EMP;
SELECT * FROM EMP03;

--EMP03; EMP ���̺��� 10�� �μ��� ����
CREATE TABLE EMP04
    AS
    SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP04;

--EMP05: EMP���̺��� ������ ����
CREATE TABLE EMP05
    AS
    SELECT * FROM EMP WHERE 1=0;      -- �о���� �����Ͱ� DEPTNO=10 '��'�̸� ������, �ƴϸ� �ȳ����� --WHERE���� ������ 
                                      -- 1=0�� ������ F�̱� ������ �ƹ������� �ȳ����� ������ ����
SELECT * FROM EMP05;                        

--2. ���̺� ���� ���� (ALTER TABLE)
-- ALTER TABLE ���̺� ��
-- ADD || MODIFY || DROP ~
--(1) �ʵ� �߰� (ADD)
SELECT * FROM EMP03;
ALTER TABLE EMP03 ADD (JOB VARCHAR2(10), SAL NUMBER(7,2));  --�����ͻ����� �ݿ�
SELECT * FROM EMP03;
ALTER TABLE EMP03 ADD(MGR NUMBER(4));
--(2) �ʵ� Ÿ�� ���� (MODIFY)
ALTER TABLE EMP03 MODIFY(EMPNO VARCHAR2(5)); --���ڵ����Ͱ� ����ִ� ����   (EMPNO���ڵ����Ͱ� ����ֱ⿡ ����Ÿ������ ������ �� ����)
ALTER TABLE EMP03 MODIFY(JOB VARCHAR2(5));   --JOB���� NULL�ۿ� ��� ���氡�� 
DESC EMP03;
ALTER TABLE EMP03 MODIFY(ENAME VARCHAR2(200));
ALTER TABLE EMP03 MODIFY(ENAME VARCHAR2(5)); -- 6BYTE �ڷᰡ �ֱ� ������    5�ڸ��� ����Ұ�

--(3) �ʵ� ���� (DROP)
SELECT * FROM EMP03;
ALTER TABLE EMP03 DROP COLUMN JOB;
ALTER TABLE EMP03 DROP COLUMN DEPTNO; --������ ���� �Ұ�
SELECT * FROM EMP03;
-- �������� Ư�� �ʵ带 ���� ���ϵ��� (��)
ALTER TABLE EMP03 SET UNUSED(SAL);
SELECT * FROM EMP03;
-- �������� ���� �Ұ��ߴ� �ʵ带 ���� (����)
ALTER TABLE EMP03 DROP UNUSED COLUMNS; --������ ������ ���̺� �׼��� �Ұ� 
SELECT * FROM EMP03;

--3. ���̺� ����(DROP TABLE)
DROP TABLE EMP01;
SELECT * FROM EMP01;
DROP TABLE DEPT; --�ٸ� ���̺��� �����ϴ� �����Ͱ� ���� ��� DROP�Ұ�  (EMP ���̺��� ��� �����ϰ� �־ ������)

--4. ���̺� ���� ������ �� �� ���� (TRUCATE TABLE)
SELECT * FROM EMP02;
TRUNCATE TABLE EMP02; --DDL��ɾ�� ��� �Ұ�

--5.���̺� �̸� ���� (ENAME)
SELECT * FROM EMP03;
RENAME EMP03 TO EMP3; --EMP03�� EMP3���� ���̺� �̸� ����
SELECT * FROM EMP3;

--6. �����͵�ųʸ�(���ٺҰ�) --> �����͵�ųʸ��� (����� ���ٿ�)
    --DBA_TABLES, DBA_INDEXES, DBA_CONSTRAINTS,DBA_VIEWS;
    --USER_TABLES, USER_INDEXES, USER_CONSTRAINTS,USERS_VIEWS;
    --ALL_TABLES, ALL_INDEXES, ALL_CONSTRAINTS,ALL_VIEWS;
-- USER_xxx; SCOTT�� ������ ��ü (���̺�,�ε���,..) ���� ��ȸ 
SHOW USER;   --USER�� 'SCOTT'. �Ʒ� �� 'SCOTT'�̼���
SELECT * FROM USER_TABLES;   --�ý����� �������� ��
SELECT * FROM USER_INDEXES; --INDEX�� �ִ� ����: ���� ã��
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_VIEWS;
DROP TABLE BOOK;
CREATE TABLE BOOK(
    BOOKID     NUMBER(4)CONSTRAINT BP PRIMARY KEY,
    BOOKNAME   VARCHAR2(100),
    PUBLISHER  VARCHAR2(100),
    RDATE      DATE,
    PRICE    NUMBER(8)
);
--DBA_xxx; DBA������ ���� ����ڸ� ���� ������ ��ü ����
SELECT TABLE_NAME,OWNER FROM DBA_TABLES;
SELECT * FROM DBA_INDEXES;
SELECT * FROM DBA_CONSTRAINTS;
SELECT * FROM DBA_VIEWS;
--ALL_xxx; SCOTT�� ������ ��ü�� ������ �ο��� ��ü 
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_CONSTRAINTS;
SELECT * FROM ALL_INDEXES;
SELECT * FROM ALL_VIEWS;

--�ڡڡ� DML �ڡڡ�--
--7. DML; SELECT, INSERT, UPDATE, DELETE
--(1) INSERT INTO ���̺��̸� (�ʵ��1, �ʵ��2, ..)
--                VALUES(��1,��2,...);
--    INSERT INTO ���̺��̸� VALUES (��1, ��2, ...);
SELECT * FROM DEPT01;
INSERT INTO DEPT01 (DEPTNO, DNAME,LOC) 
    VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT01 (DNAME,LOC,DEPTNO)
    VALUES ( 'SALES','BOSTON',20);
-- NULL�� �Է��� �Է����� ������ NULL�� �ڵ� �Է� 
INSERT INTO DEPT01 (DEPTNO, DNAME,LOC) 
    VALUES(30,'IT',NULL);
INSERT INTO DEPT01 (DEPTNO,DNAME) VALUES (40,'OPERATION');
SELECT * FROM DEPT01;
--INSERT������ �ʵ�� ������ �ݵ�� 3�� �ʵ尪�� �� �;���.  ---DDL�� ��� �Ұ�������, DML�� ��� ����
INSERT INTO DEPT01 VALUES (50, '����','����');
SELECT * FROM DEPT01;
DESC DEPT01; --PRIMARY KEY ���� ����  �׷��� �ߺ��� ������ �� �� �ִ� 

--DEPT01���̺� DEPT���̺� 10~30���μ����� ������ INSERT
INSERT INTO DEPT01 SELECT * FROM DEPT WHERE DEPTNO<40;
SELECT * FROM DEPT01;

--BOOK���̺� 11��, '����������', �Ѽ�����, ������ ����, ������ 90000
SELECT * FROM BOOK;
INSERT INTO BOOK (BOOKID, BOOKNAME, PUBLISHER,RDATE,PRICE)
    VALUES (11,'����������','�Ѽ�����',SYSDATE ,90000);
INSERT INTO BOOK
    VALUES (11,'����������','�Ѽ�����',SYSDATE ,90000);
COMMIT; --DML��ɾ�� Ʈ����� ������ ����. �� Ʈ�������� �۾��� �ݿ� 
ROLLBACK; --Ʈ������ �ȿ� �ִ� DML ��ɾ ��� 

--PPT P2 ��������--
CREATE TABLE SAM01(
    EMPNO NUMBER(4),        --CONSTRAINT C_SAM PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB   VARCHAR2(9),
    SAL   NUMBER(7,2),
    PRIMARY KEY (EMPNO));                               --****�߿�*****

INSERT INTO SAM01
    VALUES(1000, 'APPLE', 'POLICE', 10000);
INSERT INTO SAM01
    VALUES(1010, 'BANANA','NURSE',15000);
INSERT INTO SAM01
    VALUES(1020, 'ORANGE','DOCTOR',25000);
INSERT INTO SAM01
    VALUES(1030, 'VERY',NULL,25000);
INSERT INTO SAM01
    VALUES(1040, 'CAT',NULL,2000);
INSERT INTO SAM01 
    SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;   --******�߿�****

SELECT * FROM SAM01;


--(2)UPDATE ���̺��̸� SET �ʵ��1=��1[, �ʵ��2=��2, ...] [WHERE ����];
DROP TABLE EMP01;

CREATE TABLE EMP01
    AS SELECT * FROM EMP;
SELECT * FROM EMP01;
--�μ���ȣ�� 30���� ����
UPDATE EMP01 SET DEPTNO = 30;
SELECT *  FROM EMP01;
--��� ������ �޿��� 10% �λ��Ͻÿ� 
UPDATE EMP01 SET SAL=SAL*1.1;
SELECT * FROM EMP01;
COMMIT;
-- Ư�� ���� �����͸� �����ϰ��� �� ���� WHERE �� �߰� 
-- 10�� �μ� ������ �Ի����� ���÷� ����, �μ���ȣ�� 30�� �μ��� ���� 
UPDATE EMP01 SET HIREDATE=SYSDATE, DEPTNO=30
    WHERE DEPTNO=10;
SELECT * FROM EMP01;
--SAL�� 3000�̻��� ����� �޿��� 10%�λ��Ͻÿ�
UPDATE EMP01 SET SAL=SAL*1.1
    WHERE SAL>=3000;
-- 'DALLAS'�� �ٹ��ϴ� �������� �޿��� 1000�λ�. 
UPDATE EMP01 SET SAL= SAL+1000       ---***********************�� DEPTNO***********
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
--SCOTT����� �μ���ȣ�� 20���� JOB�� MANAGER�� �����ϴ� SQL
UPDATE EMP01 SET DEPTNO = 20, JOB='MANAGER'
    WHERE ENAME = 'SCOTT';
SELECT * FROM EMP01 WHERE ENAME='SCOTT'; 
-- SCOTT����� �Ի����� ���÷�, �޿��� 50, COMM�� 400 ���� 
UPDATE EMP01 SET HIREDATE= SYSDATE, SAL=50, COMM=400
    WHERE ENAME = 'SCOTT';
--���������� �̿��� UPDATE��
--DEPT01���� 20������ �������� 40�� �μ��� ���������� ����
SELECT * FROM DEPT01;
UPDATE DEPT01 SET LOC='����'
    WHERE DEPTNO=40;

--DEPT01���� 20������ �������� 40�� �μ��� �μ���, ���������� ����
UPDATE DEPT01 SET (DNAME,LOC)=(SELECT DNAME,LOC FROM DEPT01 WHERE DEPTNO=40)
    WHERE DEPTNO=20;
SELECT * FROM DEPT01
    WHERE DEPTNO IN (20,40);
--EMP01���̺��� '��� ����� �޿��� �Ի縦 'KING'�� �޿��� �Ի��Ϸ� ���� 
UPDATE EMP01 SET (SAL,HIREDATE) = (SELECT SAL, HIREDATE FROM EMP01
                                    WHERE ENAME = 'KING'); 
                                    
    --UPDATE ���̺�� SET �ʵ�� = ��, �ʵ��=�� ...
--(3) DELETE FROM ���̺�� WHERE����;
COMMIT;

SELECT * FROM EMP01;
DELETE FROM EMP01;
ROLLBACK;

--EMP01���̺��� 30�� �μ� ������ ����
DELETE FROM EMP01 WHERE DEPTNO=30;
--SAM01���̺��� JOB�� �������� �ʴ� ����� ����
SELECT * FROM SAM01;
DELETE FROM SAM01 WHERE JOB IS NULL;
--EMP01���̺��� �μ����� SALES�� ����� ���� 
DELETE FROM EMP01 WHERE DEPTNO=(SELECT DEPTNO FROM DEPT 
                                    WHERE DNAME='SALES');
--EMP01���̺��� RESEARCH�μ� �Ҽ��� ��� ����
DELETE FROM EMP01 WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='RESEARCH');
SELECT * FROM EMP01;

--PPT P1--
--1. ���̺� ����
CREATE TABLE MY_DATA(
    ID     NUMBER(4),        
    NAME   VARCHAR2(10),
    USERID VARCHAR2(30),
    SALARY   NUMBER(10,2),
    PRIMARY KEY (ID));        
SELECT * FROM MY_DATA;

--2 ���� �Է�
INSERT INTO MY_DATA VALUES(1,'Sott','sscott',10000.00);
INSERT INTO MY_DATA VALUES(2,'Ford','fford',13000.00);
INSERT INTO MY_DATA VALUES(3,'Patel','ppatel',330000.00);
INSERT INTO MY_DATA VALUES(4,'Report','rreport',235000.00);
INSERT INTO MY_DATA VALUES(5,'Good','ggood',44450.00);

        --INSERT INTO MY_DATA VALUES(3,'Patel','ppatel', TO_NUMBER('33,000,00','99,999.99'));
       

--3��  2������ �Է��� �ڷḦ Ȯ�� 
SELECT * FROM MY_DATA;
        -- SELECT ID, NAME, USEID,TO_CHAR(SALARY,'99,999.00') SALARY FROM MY_DATA

--4�� �ڷḦ ���������� �����ͺ��̽��� ���
COMMIT;

--6�� ID�� 3���� ����� �޿��� 65,000.00���� �����ϰ�, �����ͺ��̽��� �ݿ�
UPDATE MY_DATA SET SALARY = 65000.00 WHERE ID=3;
COMMIT;
        --UPDATE MY_DATA SET SALARY=TO_NUMBER('65,000.00','99,999.99') WHERE ID=3;

--7�� �̸��� FORD�� ����� ���� ����
DELETE FROM MY_DATA WHERE NAME='Ford'; 

--8�� �޿��� 15,000������ ����� �޿��� 15,000�� ����
UPDATE MY_DATA SET SALARY = 15000
    WHERE SALARY <15000;

--9��   1������ ������ ���̺��� ����
DROP TABLE MY_DATA;

--�ڡڡ� ERD:����ȭ�� �����͸� �����ϱ� ���� DB�� ����ϴµ�,
--          DB�� ������ �������� �� �پ��� ����� �����ϴ� �� �ڡڡ�--
CREATE TABLE DEPT1(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME  VARCHAR2(14),
    LOC    VARCHAR2(13)
    );

SELECT * FROM DEPT1;
CREATE TABLE EMP1(  --���������� �������� ������ ���� ���� 
    EMPNO  NUMBER(4) PRIMARY KEY, --�������� 1. PRIMARY KEY 
    ENAME  VARCHAR2(10) UNIQUE,   --�������� 2. UNIQUE        --ENAME ���������� �ü� ����. unique
    JOB    VARCHAR2(9) NOT NULL,  --�������� 3. NOT NULL
    MGR    NUMBER(4),
    HIREDATE DATE DEFAULT SYSDATE, --�������� 4. DEFAULT
    SAL    NUMBER (7,2) CHECK (SAL>0), --�������� 5. CHECK
    COMM   NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT1(DEPTNO) --�������� 6.FOREIGNŰ 
);

SELECT * FROM EMP1;
INSERT INTO DEPT1 VALUES (10,'ȸ��','����');
INSERT INTO DEPT1 VALUES (20,'����','����');
INSERT INTO DEPT1 VALUES (30,'����','�̴�');
INSERT INTO DEPT1 VALUES (40,'����','����');

--EMP1�Է�
INSERT INTO EMP1 (EMPNO,ENAME,JOB,MGR,SAL,DEPTNO)
    VALUES(1111,'ȫ��','ȸ��', NULL,9000,40);
SELECT * FROM EMP1;
INSERT INTO EMP1 (EMPNO, ENAME, JOB, MGR, SAL, DEPTNO)
    VALUES (1112,'ȫ��','����',1111,1000,30);

INSERT INTO EMP1 VALUES
    (1113,'�豺','��',1112,TO_DATE('20201230','YYYYMMDD'),8000,200,40 );    --Ʈ�����ǿ� ����;  ĿŶ���ؾ� ����Ŭ�� ����
COMMIT;


--EX.�л�����

DROP TABLE STUDENT;
DROP TABLE MAJOR; -- TABLE MAJOR�� �θ� ���̺��̹Ƿ� ������ �ڽ����̺��� ����� ���� ���� ����

CREATE TABLE MAJOR(
    major_CODE NUMERIC(2) PRIMARY KEY,
    major_NAME VARCHAR(100) NOT NULL,
    major_OFFIC_LOC VARCHAR(255) NOT NULL
);

CREATE TABLE STUDENT(
    student_CODE VARCHAR(10),
    student_NAME VARCHAR(30),
    SCORE        NUMBER(3),
    MAJOR_CODE   NUMBER(2),
    PRIMARY KEY (STUDENT_CODE),
    FOREIGN KEY (MAJOR_CODE)  REFERENCES MAJOR(MAJOR_CODE) --�������� 6.FOREIGNŰ 
);

INSERT INTO MAJOR VALUES
    (1,'�濵����','3�� �ι���');
INSERT INTO MAJOR VALUES
    (2,'����Ʈ�������','3�� �ι���');
INSERT INTO MAJOR VALUES
    (3,'������','4�� ���н�');
INSERT INTO MAJOR VALUES
    (4,'����','4�� ���н�');

SELECT * FROM MAJOR;


INSERT INTO STUDENT VALUES
    ('A01','��浿',100,1 );
INSERT INTO STUDENT VALUES
    ('A02','���浿',90,2);
INSERT INTO STUDENT VALUES
    ('A03','ȫ�浿',95,1);

SELECT * FROM STUDENT;


--EX2. BOOKCATEGORY ����

DROP TABLE BOOK;

CREATE TABLE BOOKCATEGORY(
BOOKCODE     NUMBER(4) PRIMARY KEY,
CATEGORYNAME VARCHAR2(50),
LOC          VARCHAR2(50)
);


CREATE TABLE BOOK(
    BOOKCODE NUMBER(4),
    BOOKNO VARCHAR2(50),
    BOOKNAME VARCHAR2(50) NOT NULL,
    PUBLISHER VARCHAR2(50),
    PUBYEAR NUMBER(4) DEFAULT TO_CHAR(SYSDATE,'YYYY'),  -- ���࿡PUBYEAR�� �ƹ��͵� ��ġ�� ���� ��ǻ�� �ý��ۿ� �ִ� ������ ��  
                                                        -- ����Ŭ�� �ּ��� ���ؼ� ���⼭ ���ڸ� ���ڷ� �ٲ���
    PRIMARY KEY (BOOKNO),
    FOREIGN KEY (BOOKCODE) REFERENCES BOOKCATEGORY(BOOKCODE)
);

INSERT INTO BOOKCATEGORY VALUES (100,'ö��','3�� �ι���');
INSERT INTO BOOKCATEGORY VALUES (200,'�ι�','3�� �ι���');
INSERT INTO BOOKCATEGORY VALUES (300,'�ڿ�����','3�� �ι���');
INSERT INTO BOOKCATEGORY VALUES (400,'IT','3�� �ι���');

INSERT INTO BOOK VALUES (100,'100A01','ö������ ��', '��������',2017);
INSERT INTO BOOK VALUES (400,'400A01','�̰��� DB��', '��������',2018);

SELECT * FROM BOOK;
SELECT * FROM BOOKCATEGORY;

--�ڡڡ� DCL (DATA CONTROL LANGUAGE)(����ڰ�������, ����ڿ��� ���� �ο�, ���� ��Ż, Ʈ�����Ǹ�ɾ�[�Ѳ����� ��Ƽ� ����]) �ڡڡ�--
--�����߰�
CREATE USER kim IDENTIFIED BY tiger;  --kim(����� tiger)����
--���Ѻο� 
GRANT CREATE SESSION, CREATE TABLE TO kim;
GRANT SELECT ON EMP TO kim;
SHOW USER;
--���� ��Ż
REVOKE SELECT ON EMP FROM kim;
DROP USER kim cascade;       --CASECADE: is used in conjunction with ON DELETE or ON UPDATE. the child data is either deleted or updated when the parent data is deleted or updated-








