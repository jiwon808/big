-- [X] View, In-Line View, TOP-N
-- 1.VIEW: ������ ���̺� (1) �ܼ���, (2)���պ�
-- EMPv0�̶�� VIEW =EMP���̺� �Ϻ� �ʵ带 ���� ������ ���̺�  (���⼭ ������ �ʵ��� ���� �� �� ����)
CREATE OR REPLACE VIEW EMPv0                         
    AS SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP;
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES (1111,'ȫ','IT',40); --VIEW�� INSERT
SELECT * FROM EMPv0; --�������̺� (������ ������ ���� EMP���̺�)
SELECT * FROM EMP;
SELECT * FROM EMP WHERE EMPNO=1111;
UPDATE EMPv0 SET JOB = 'ANALYST' WHERE EMPNO=1111;
DELETE FROM EMPv0 WHERE EMPNO=1111;
-- EMPv0�̶�� VIEW = EMP�� 30�� �μ��ุ 
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO=30;
SELECT * FROM USER_VIEWS; --�����͵�ųʸ��並 Ȯ��
SELECT * FROM EMPv0;
DESC EMPv0;
--40�� �μ� �Է��� �����ϳ� ������ ���� 
INSERT INTO EMPv0 VALUES(1111,'ȫ',NULL,NULL,NULL,NULL,NULL,30);
INSERT INTO EMPv0 VALUES (1112,'ȫ',NULL,NULL,NULL,NULL,NULL,40);
SELECT * FROM EMPv0; --1111(30�� �μ���)
SELECT * FROM EMP; --1111,1112
DELETE FROM EMPv0 WHERE EMPNO<1113; --30�� �μ��� ������  
DELETE FROM EMP WHERE EMPNO<1113;
COMMIT;
-- EMP ���̺� 30�� �μ��� �������� ���̺� (30�� �μ��� INSERT����)
CREATE OR REPLACE VIEW EMPv0
    AS SELECT * FROM EMP WHERE DEPTNO=30
    WITH CHECK OPTION; --VIEW�� ��������  (INSERT,UPDATE �� 30�� �μ���)
SELECT * FROM EMPv0;
INSERT INTO EMPv0 VALUES (1111,'ȫ', NULL,NULL,NULL,NULL,NULL,30);
--WITH CHECK OPTION �������� ������ 30�� �μ��� INSERT ����  
INSERT INTO EMPv0 VALUES (1111,'ȫ', NULL,NULL,NULL,NULL,NULL,40);
DELETE FROM EMPv0 WHERE EMPNO=1111;

--(2)���պ�
CREATE OR REPLACE VIEW EMPv1
    AS SELECT EMPNO, ENAME, JOB, DNAME FROM DEPT D, EMP E
        WHERE E.DEPTNO = D.DEPTNO;
SELECT * FROM EMPv1; --��� �޸𸮿��� ����. �����͵�ųʸ����� ���ǵ� 
INSERT INTO EMPv1 VALUES (1111,'ȫ','SALESMAN','RESEARCH');

--���պ� ���� DML��ɾ ��� ����� �� ���� ��� (INSERT��,UPDATE,DELETE�Ұ�)
CREATE OR REPLACE VIEW EMPv2
    AS SELECT EMPNO, ENAME, DEPTNO FROM EMP
    WITH READ ONLY; --�б� ���� VIEW 
SELECT * FROM EMPv2;
SELECT EMPNO,ENAME,DNAME FROM EMPv2 E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
INSERT INTO EMPv2 VALUES (1111,'ȫ',40);
-- EMP(�̸�, �޿�)
CREATE OR REPLACE VIEW EMPv3
    AS SELECT ENAME, SAL FROM EMP;
SELECT * FROM EMPv3;
INSERT INTO EMPv3 VALUES ('ȫ',9000); --EMPNO��PRIMARY KEY. PK���� NULL�� ���� �ȵ�
SELECT * FROM EMP;
DESC EMPv3;
--EMP (���, �̸�, ����=SAL*12)
--���������� �ʵ�� Ư�����ڰ� ���� ���  1.�ʵ忡 �ٷ� ��Ī 
CREATE OR REPLACE VIEW EMPv3
    AS SELECT EMPNO, ENAME, SAL*12 ���� FROM EMP; --WITH CHECK OPTION�� WHERE�� �ɷ���������. �� WHERE���� �־�� ��밡��
--EMP (���, �̸�, ����=SAL*12)
--���������� �ʵ�� Ư�����ڰ� ���� ��� 2.��Ī�� ����
CREATE OR REPLACE VIEW EMPv3 (EMPNO,NAME, ����)
    AS SELECT EMPNO, ENAME, SAL*12 FROM EMP;
SELECT * FROM EMPv3;
--VIEW������ �ʵ忡 ������ ������ INSERT�Ұ� 
INSERT INTO EMPv3 VALUES (1115, 'ȫ',12000); 
--VIEW������ �ʵ忡 �Լ��� ����� ��� INSERT�Ұ�
    --EMP(���,�̸�,�ݿø��� SAL)
CREATE OR REPLACE VIEW EMPv3
    AS SELECT EMPNO, ENAME, ROUND(SAL,-2) SAL FROM EMP;
SELECT * FROM EMPv3;
INSERT INTO EMPv3 VALUES (1115,'ȫ',1000); --VIEW�ʵ忡 �Լ����� 
 -- �μ���ȣ, �ּұ޿�, �ִ�޿�, �μ������ ������ DEPTv1 ����� 
CREATE OR REPLACE VIEW DEPTv1 (DEPTNO, MINSAL, MAXSAL,AVGSAL)
    AS SELECT DEPTNO, MIN(SAL), MAX(SAL), ROUND(AVG(SAL),1) 
        FROM EMP GROUP BY DEPTNO;
SELECT * FROM DEPTv1;
--�μ���ȣ, �μ���, �ּұ޿�, �ִ�޿�, �μ���� 
SELECT DEPT.DEPTNO, DNAME, MINSAL, MAXSAL,ROUND(AVGSAL) 
    FROM DEPTv1, DEPT 
    WHERE DEPTv1.DEPTNO= DEPT.DEPTNO;
DESC DEPTv1;
INSERT INTO SEPTv1 VALUES (40,700,9000,4000);  --VIEW������ �ʵ忡 �Լ��� ����ؼ� ����Ұ�
SELECT COUNT(*) FROM EMPNO;
    --EMP(�ߺ��� ���ŵ� JOB, DEPTNO)
SELECT DISTINCT JOB,DEPTNO FROM EMP ORDER BY JOB; --��������
    
CREATE OR REPLACE VIEW EPMPv3
    AS SELECT DISTINCT JOB, DEPTNO FROM EMP ORDER BY JOB;
SELECT * FROM EMPv3;
INSERT INTO EMPv3 VALUES ('CLEAR',10); --DISTINCT������ VIEW

-- 2.INLINE VIEW (FROM���� ��������): SQL�� �����ϴ� ������ ��ɾ���� ������ �� 
-- SELECT FROM���־��
-- SELECT �ʵ�1, �ʵ�2, (��������),...
-- FROM EMP E, (��������)S          --S�� ������ ��. 
-- WHERE ���� (��������)
-- �޿��� 2000�� �ʰ��ϴ� ����� ��ձ޿�
SELECT AVG(SAL) FROM EMP WHERE SAL>2000;
SELECT AVG(SAL) FROM (SELECT SAL FROM EMP WHERE SAL>2000);

--�̸�, �޿�, �μ���ȣ, �ش����� �μ���ձ޿� (SELECT�� �������� �̿�)
SELECT ENAME, SAL, DEPTNO, (SELECT ROUND(AVG(SAL),1) 
                                    FROM EMP WHERE DEPTNO=E.DEPTNO)
    FROM EMP E;
--�̸�, �޿�, �μ���ȣ, �ش����� �μ���ձ޿� (INLINE VIEW �̿�)
SELECT ENAME, SAL, DEPTNO FROM EMP; -- (1)
SELECT DEPTNO, ROUND(AVG(SAL)) FROM EMP GROUP BY DEPTNO; --(2)
SELECT ENAME, SAL, E.DEPTNO,S.DEPTNO,S.AVGSAL 
    FROM EMP E, (SELECT DEPTNO, ROUND (AVG(SAL)) AVGSAL
                    FROM EMP GROUP BY DEPTNO) S
    WHERE E.DEPTNO = S.DEPTNO;
--�̸�, �޿�, �μ���ȣ, �ش����� �μ���� (�μ���� ���� ���� ���� ������) 
SELECT ENAME, SAL, E.DEPTNO, AVGSAL
    FROM EMP E, (SELECT DEPTNO, AVG(SAL) AVGSAL FROM EMP
                    GROUP BY DEPTNO) S
    WHERE E.DEPTNO = S.DEPTNO AND SAL >AVGSAL;
--3. TOP-N ���� (TOP 1~10��, TOP 11~20�� TOP6~10��)
--RONUM: EMP���̺��� ������ ���� (��¾ȵ� �ֵ� �ѹ����ȵ�). ���̺��� ���� ������ ��� ����  
SELECT ROWNUM, ENAME, SAL FROM EMP;  --EMP���̺��� �ϳ��� �ϳ��� ������ ���� 
SELECT ROWNUM, ENAME, SAL FROM EMP ORDER BY SAL;
SELECT ROWNUM, ENAME, SAL FROM (SELECT * FROM EMP ORDER BY SAL); --�䰡 ��� ���� --������ ���� sal������ ���� ū�ŷ�ŷ
SELECT ROWNUM, ENAME, SAL FROM (SELECT * FROM EMP ORDER BY SAL)
    WHERE ROWNUM<6; -- TOP 1~5��
SELECT ROWNUM, ENAME, SAL FROM (SELECT * FROM EMP ORDER BY SAL)
    WHERE ROWNUM BETWEEN 6 AND 10; -- TOP 6~10��      --ROWNUM�� ��� 1�λ��·� �����ͼ� ����̾ȵ�  �̷���Ÿ���� TOP-N�� �ƴ�
--�Լ��� �̿��� RANK ��� 
SELECT RANK() OVER (ORDER BY SAL)RANK,
        DENSE_RANK() OVER (ORDER BY SAL) D_RANK,
        ROW_NUMBER() OVER (ORDER BY SAL) N_RANK,
        ENAME,SAL 
    FROM EMP; 
-- TOP-N����
SELECT ROWNUM "RANK", ENAME, SAL
    FROM (SELECT * FROM EMP ORDER BY SAL) --�̷��� SAL���
    WHERE ROWNUM BETWEEN 1 AND 5; -- 6~10���� �Ұ�  (1�̾ �ڲ� ������)
    
SELECT RN, ENAME, SAL 
    FROM (SELECT ROWNUM RN, ENAME, SAL 
            FROM(SELECT * FROM EMP ORDER BY SAL DESC))    --SAL������� �����ͼ� ��ŷ
    WHERE RN BETWEEN 6 AND 10; -- TOP-N ����

--�̸� ���ĺ� ������� 6~10����� ��� (�̸�,���,JOB,MGR,HIREDATE)
SELECT RN, ENAME, EMPNO,JOB,MGR,HIREDATE
    FROM (SELECT ROWNUM RN, ENAME, EMPNO,JOB,MGR,HIREDATE 
                FROM(SELECT * FROM EMP ORDER BY ENAME)) --�ݵ��RN ����. �ֳ��ϸ� �������� �ۿ��� ROWNUM�� �־�
    WHERE  RN BETWEEN 6 AND 10;


-- <�� ��������>
-- 1. �μ���� ������� ����ϴ� �뵵�� ��, DNAME_ENAME_VU �� �ۼ��Ͻÿ�
CREATE OR REPLACE VIEW DNAME_ENAME_VU
    AS SELECT DNAME, ENAME  
    FROM DEPT D, EMP E WHERE E.DEPTNO = D.DEPTNO;
SELECT * FROM DNAME_ENAME_VU;


-- 2. ������ ���ӻ������ ����ϴ� �뵵�� ��,  WORKER_MANAGER_VU�� �ۼ��Ͻÿ�
CREATE OR REPLACE VIEW WORKER_MANAGER_VU (W,M)
    AS SELECT W.ENAME, M.ENAME
    FROM EMP W, EMP M WHERE M.EMPNO=W.MGR;  --�Ŵ��� ��� = ����� �Ŵ������ 
SELECT * FROM WORKER_MANAGER_VU;

-- 3. �μ��� / �޿��հ� ����� ����Ͻÿ�(�μ���ȣ, �޿��հ�, ���) ? ģ������

SELECT ROWNUM ���, DEPTNO, SUMSAL
    FROM (SELECT DEPTNO,SUM(SAL) SUMSAL FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL)DESC);



-- 3-1. �μ��� �޿��հ� ����� 2~3���� �μ���ȣ, �޿��հ�, ����� ����Ͻÿ�.
SELECT RN ���, DEPTNO,SUMSAL
    FROM ( SELECT ROWNUM RN, DEPTNO, SUMSAL
        FROM(SELECT DEPTNO,SUM(SAL) SUMSAL FROM EMP GROUP BY DEPTNO ORDER BY SUM(SAL)DESC))
    WHERE RN BETWEEN 2 AND 3;


-- 4. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ ��� ������ �����Ͻÿ�
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP ORDER BY HIREDATE DESC;



-- 5. ������̺��� ���, �����, �Ի����� �Ի����� �ֽſ��� ������ ��� 5���� ����Ͻÿ�
SELECT EMPNO, ENAME, HIREDATE
    FROM (SELECT ROWNUM RN, EMPNO, ENAME, HIREDATE
            FROM(SELECT * FROM EMP ORDER BY HIREDATE DESC))
    WHERE RN BETWEEN 1 AND 5;
    
SELECT EMPNO, ENAME, HIREDATE
    FROM (SELECT EMPNO,ENAME, HIREDATE FROM EMP
                             ORDER BY HIREDATE DESC)
    WHERE ROWNUM BETWEEN 1 AND 5;

-- 6. ��� ���̺��� ���, �����, �Ի����� �ֽź��� ������ ������ 6��°�� ���� ������� 10��° ������� 
SELECT EMPNO, ENAME, HIREDATE
    FROM (SELECT ROWNUM RN, EMPNO, ENAME, HIREDATE
            FROM(SELECT * FROM EMP ORDER BY HIREDATE DESC))
    WHERE RN BETWEEN 6 AND 10;



