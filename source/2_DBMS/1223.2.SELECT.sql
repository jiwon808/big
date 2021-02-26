--[||] SELECT��

-- 1. SQL���� �ۼ���
SELECT * FROM TAB; -- �� ���� SCOTT�� ������ �ִ� ���̕��� 
SELECT * FROM DEPT; -- DEPT���̺��� ��� ��, ��� ��
SELECT * FROM EMP; -- EMP���̺��� ��� ��, ��� ��
-- DEPT ���̺��� ����(ORACLE)
DESC DEPT;

-- 2.SQL ���� ���� (Ư�� ���� ���)
SELECT EMPNO, ENAME,SAL,JOB FROM EMP;
SELECT EMPNO AS "���", ENAME AS "�̸�", SAL AS "�޿�", JOB AS "�۾�"
    FROM EMP;
SELECT EMPNO AS ���, ENAME AS �̸�, SAL AS �޿�, JOB AS �۾�
    FROM EMP; --���� ������(Ÿ��Ʋ ����)
SELECT EMPNO ���, ENAME �̸�,  SAL �޿�, JOB �۾�
    FROM EMP;
SELECT EMPNO NO, ENAME NAME, SAL SALARY, JOB FROM EMP;

-- 3. WHERE �� (����) �񱳿����ڸ� �̿� 
SELECT EMPNO "���", ENAME "�̸�", SAL "�޿�" FROM EMP
    WHERE SAL=3000; -- SAL�� 3000�� �ุ ��� 
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL!=3000; --�ٸ���
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL^=3000; --�ٸ���
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL<>3000; --�ٸ���
-- 10�� �μ��� ����� ��� �ʵ带 ���
SELECT * FROM EMP WHERE DEPTNO=10;
-- ENAME�� 'FORD'�� ������ ��� �ʵ带 ��� 
SELECT * FROM EMP WHERE ENAME='FORD';
select * from emp where ename='ford';--�����ʹ� ��ҹ��� ����

-- 4. �������� �޿��� 2000�̻� 3000�̸��� ������ ��� �ʵ带 ��� 
SELECT * FROM EMP
    WHERE SAL>=2000 AND SAL<3000;
-- �񱳿����� ����, ����, DATE�� ��� ���� 
SELECT * FROM EMP WHERE ENAME < 'F'; --'A' 'B' 'C' 'D' 'E'�� �����ϴ�
SELECT * FROM EMP WHERE HIREDATE < '81/01/01';
-- 82�⿡ �Ի��� ������ ��� �ʵ� ���
SELECT * FROM EMP 
    WHERE HIREDATE >= '82/01/01' AND HIREDATE<= '82/12/31';
-- ��¥ ǥ��� ���� (RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
SELECT * FROM EMP;
-- ������ 2400�̻��� ������ ENAME,SAL,���� ��� (����=SAL *12)
SELECT ENAME �̸�, SAL �޿�, SAL*12 ���� FROM EMP  --SINGLE QUOTATION --> DATA
    WHERE SAL*12>2400
    ORDER BY ����; -- WHERE������ ���� ��� �Ұ�, ORDER BY���� ���� ��� ����
    
-- 5. ���ǥ����
SELECT ENAME, SAL, SAL+300 UPGRADESAL FROM EMP;
-- ��� ����� �����, ����(SAL), ����(SAL*12+COMM)
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM,0) FROM EMP;
-- ��������� ����� null�� �����ϸ� �����NULL ->NVL(NULL
--      ->NUL(NULL�� ���� �ִ� �ʵ��, ��ġ��),  �ʵ��(���⼭ COMM),��ġ��(���⼭ 0)�� Ÿ���� ���ƾ���, ���⼭ �ʵ��NUMBER�̴� 
DESC EMP;
-- ��� ����� �����, ����, COMM, ����(SAL*12+COMM) COMM��NULL�̸� 0
SELECT ENAME, SAL, NVL(COMM,0), SAL*12+NVL(COMM,0) FROM EMP;
-- �����(ENAME), ����� ���(MGR) ��簡 ������CEO���
SELECT ENAME, NVL(MGR,0) FROM EMP;

-- 6. ���Ῥ���� (||); ���̳� ���ڸ� ����
SELECT * FROM EMP;
SELECT ENAME||'��'||JOB||'�̴�' FROM EMP;
-- "SMITH IS CLEAR"�� ��µǰ� TITLE EMPLOYEES��� ��� ���� ��� 
SELECT ENAME || 'IS'||JOB EMPLOYEES FROM EMP;

--7.�ߺ� ����(DISTINCT)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT MGR FROM EMP;

-- �߰� ���� ����
--1. emp ���̺��� ���� ���
DESC EMP;
--2. emp ���̺��� ��� ������ ��� 
SELECT * FROM EMP;
--3. �� scott �������� ��밡���� ���̺� ���
SELECT * FROM TAB;
--4. emp ���̺��� ���, �̸�, �޿�, ����, �Ի��� ���
SELECT EMPNO, ENAME, SAL,JOB,HIREDATE FROM EMP;
--5. emp ���̺��� �޿��� 2000�̸��� ����� ���, �̸�, �޿� ���
SELECT EMPNO,ENAME,JOB,HIREDATE,SAL FROM EMP 
    WHERE SAL<2000;
--6. �Ի����� 81/02���Ŀ� �Ի��� ����� ���, �̸�, ����, �Ի��� ���
SELECT EMPNO,ENAME,JOB,HIREDATE FROM EMP
    WHERE HIREDATE >='81/02/01';
--7. ������ SALESMAN�� ����� ��� �ڷ� ���
SELECT * FROM EMP
    WHERE JOB = 'SALESMAN';
--8. ������ CLERK�� �ƴ� ����� ��� �ڷ� ���
SELECT * FROM EMP
    WHERE JOB!='CLERK';
--9. �޿��� 1500�̻��̰� 3000������ ����� ���, �̸�, �޿� ���
SELECT EMPNO,ENAME,SAL FROM EMP
    WHERE SAL>=1500 AND SAL<=3000;
--10. �μ��ڵ尡 10���̰ų� 30�� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
    WHERE DEPTNO=10 OR DEPTNO=30; 
--11. ������ SALESMAN�̰ų� �޿��� 3000�̻��� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO,ENAME,JOB,DEPTNO FROM EMP
    WHERE JOB='SALESMAN' OR SAL>=3000;
--12. �޿��� 2500�̻��̰� ������ MANAGER�� ����� ���, �̸�, ����, �޿� ���
SELECT EMPNO,ENAME,JOB,SAL FROM EMP
    WHERE SAL>=250 AND JOB='MANAGER';
--13.��ename�� XXX �����̰� ������ XX�١� ��Ÿ�Ϸ� ��� ���(������ SAL*12+COMM)
SELECT ENAME || '�� '||JOB||'�����̰� ������'
    ||(SAL*12+NVL(COMM,0))||'�̴�'         --��ȣ�ʿ�
    FROM EMP;

-- 8.SQL������ (BETWEEN, IN, LIKE, IS NULL)
-- SAL�� 1500�̻��̰� 3000������ ���,�̸�,�޿�
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL>=1500 AND SAL<=3000;
--�ʵ��  BETWEEN A AND B (A~B����, A��B ����)
 SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL BETWEEN 1500 AND 3000;   --'����'�϶��� ��밡��. ������ '�̸�'�϶� ����ϸ� �ȵ�
--82�⵵ �Ի��� ������ ��� �ʵ带 ���
SELECT * FROM EMP
    WHERE HIREDATE>='82/01/01' AND HIREDATE<='82/12/31';
SELECT * FROM EMP
    WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
-- �̸��� A~C�� �����ϴ� ���
SELECT * FROM EMP 
    WHERE ENAME BETWEEN 'A' AND 'D'
    AND ENAME!='D'; --D�� ���Ծȵ�     BETWEEN�� ����,����,��¥�� �� ��밡�� /������ �տ����� ū�� �ڿ��;� �Ѵ�

--�μ���ȣ(DEPTNO)�� 10,20�� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE DEPTNO=10 OR DEPTNO=20;
SELECT * FROM EMP WHERE DEPTNO IN(10,20);  -- �� IN(list): list�� �� �� ��� �ϳ��� ��ġ�Ѵ�
SELECT * FROM EMP WHERE DEPTNO NOT IN(10,20);
--EMPNO�� 7902,7788,7566�� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE EMPNO IN (7902, 7788,7566);

-- �̸��� M���� �����ϴ� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE ENAME LIKE 'M_%';  --  %: 0���� �̻�  / _�ѱ���     �� LIKE: �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� pattern�� ��ġ�ϴ����� �˻�
-- �̸��� N�� ���� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE ENAME LIKE '%N%';
--�̸���S�� ������ ����� ��� �ʵ� 
SELECT * FROM EMP WHERE ENAME LIKE'%S';
--�̸��� %�� ���� ����� ��� �ʵ� 
INSERT INTO EMP VALUES(9999,'A%',NULL,NULL,NULL,9000,9000,40);  --40���μ� 
SELECT * FROM EMP;
SELECT * FROM EMP WHERE ENAME LIKE '%\%%' ESCAPE'\'; -- �տ�\% means %�� �ν��ش޶�  ,   ESCAPE'\' means   \�� �����ϰ� �ؼ��϶� **************
ROLLBACK; -- DML(������ ���۾ ���)  --�̰��� �����Ͽ� ���� �ܰ迡�� ������ ���۾ ������
SELECT * FROM EMP;
-- SAL�� 5�� ������ ����� ��� �ʵ� 
SELECT * FROM EMP WHERE SAL LIKE '%5';   --�˾Ƽ� ���ڷ� �ٲ㼭 �ѷ��� --LIKE�����ڴ� '����'���� �� �� �ִ�   
DESC EMP;
--�Ի�⵵�� 82���� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE HIREDATE LIKE '82/%';
SELECT * FROM EMP 
    WHERE HIREDATE BETWEEN TO_DATE('1982/01/01','yyyy/mm/dd')
        AND TO_DATE('1932/12/31','YYYY/MM/DD');
-- 1���� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE HIREDATE LIKE '__/01/__';
--�󿩱��� ���� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE COMM=0 OR COMM IS NULL;  --����: NULL��  COMM IS NULL (O) �� �ؾ�  ���´�.    COMM = NULL (X)
--�󿩱��� �ִ� ����� ��� �ʵ� 
SELECT * FROM EMP WHERE COMM IS NOT NULL AND COMM!=0;
-- 9.���� (��������, ��������)
SELECT ENAME, SAL FROM EMP ORDER BY SAL; --�������� ����     ?	ASC ��������. Default
SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL DESC; --�������� ����  ?	DESC ��������
--SAL�� ���� ������ ���(��, ����SAL�� ��� �Ի��� �ֽ� ������ ����)
SELECT * FROM EMP ORDER BY SAL DESC, HIREDATE DESC, ENAME; 
SELECT * FROM EMP ORDER BY ENAME, HIREDATE;

--�̸�, ����(SAL*12 + COMM)�� ���(������ ���� ������)
SELECT ENAME, SAL*12+NVL(COMM,0) ���� FROM EMP 
    ORDER BY SAL*12+NVL(COMM,0) DESC;
SELECT ENAME, SAL*12+NVL(COMM,0) ���� FROM EMP 
    ORDER BY ���� DESC;
--������ 2000�̻��� ������ �̸�, �̸�, ������ ���(������ ���� ��)
SELECT ENAME, SAL*12+NVL(COMM,0) ���� FROM EMP   -- ORDER BY������ ���� ��밡���ϳ� WHERE�������� �ʵ庰�� ��� �Ұ� 
    WHERE SAL*12+NVL(COMM,0)>=2000
    ORDER BY ���� DESC;

 
 
 --�� �������� 
 --<�� ��������>
--1.	EMP ���̺��� sal�� 3000�̻��� ����� empno, ename, job, sal�� ���
SELECT EMPNO,ENAME,JOB,SAL FROM EMP 
    WHERE SAL>=3000;
--2.	EMP ���̺��� empno�� 7788�� ����� ename�� deptno�� ���
SELECT ENAME, DEPTNO FROM EMP 
    WHERE EMPNO='7788';
--3.	������ 24000�̻��� ���, �̸�, �޿� ��� (�޿�������)
SELECT EMPNO, ENAME,SAL FROM EMP 
    WHERE SAL*12+NVL(COMM,0) >= 2400;
--4.	EMP ���̺��� hiredate�� 1981�� 2�� 20�� 1981�� 5�� 1�� ���̿� �Ի��� ����� 
--ename,job,hiredate�� ����ϴ� SELECT ������ �ۼ� (�� hiredate ������ ���)
SELECT ENAME, JOB, HIREDATE FROM EMP 
    WHERE HIREDATE BETWEEN '81/02/21' AND '81/05/01'
    ORDER BY HIREDATE;
--5.	EMP ���̺��� deptno�� 10,20�� ����� ��� ������ ��� (�� ename������ ����)
SELECT * FROM EMP 
    WHERE DEPTNO IN (10,20)
    ORDER BY ENAME;
--6.	EMP ���̺��� sal�� 1500�̻��̰� deptno�� 10,30�� ����� ename�� sal�� ���
-- (�� HEADING�� employee�� Monthly Salary�� ���)
SELECT ENAME employee,SAL "Monthly Salary" FROM EMP WHERE SAL>=1500 AND DEPTNO IN (10,20);
--7.	EMP ���̺��� hiredate�� 1982���� ����� ��� ������ ���
SELECT * FROM EMP WHERE HIREDATE LIKE '82/%';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY/MM/DD') LIKE '1982%';
--��¥�� -> ������ TO_CHAR(HIREDATE,'YYYY/MM/DD') -> '1982/12/12'
--������ -> ������ TO_DATE('1982/12/12','YYYY/MM/DD') -> ��¥��

--8.	�̸��� ù�ڰ� C����  P�� �����ϴ� ����� �̸�, �޿� �̸��� ����
SELECT ENAME, SAL FROM EMP                  --���⼭  BETWEEN 'C' AND 'P' (X)  �ֳ��ϸ� PA   PZA �� �� P���� ũ�� 
    WHERE (ENAME BETWEEN 'C' AND 'Q') AND ENAME!='Q'
    ORDER BY SALARY, ENAME;
--9.	EMP ���̺��� comm�� sal���� 10%�� ���� ��� ����� ���Ͽ� �̸�, �޿�, �󿩱��� 
--����ϴ� SELECT ���� �ۼ�
SELECT ENAME,SAL,COMM FROM EMP 
    WHERE COMM >= 1.1* SAL;
--10.	EMP ���̺��� job�� CLERK�̰ų� ANALYST�̰� sal�� 1000,3000,5000�� �ƴ� ��� ����� ������ ���
SELECT * FROM EMP 
    WHERE JOB IN ('CLERK','ANALYST') 
    AND SAL NOT IN(1000,3000,5000);  
--11.	EMP ���̺��� ename�� L�� �� �ڰ� �ְ� deptno�� 30�̰ų� �Ǵ� mgr�� 7782�� ����� 
--��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP
    WHERE ENAME LIKE'%L%L%' 
    AND (DEPTNO =30 OR MGR =7782);
--12.	��� ���̺��� �Ի����� 81�⵵�� ������ ���,�����, �Ի���, ����, �޿��� ���
SELECT EMPNO,ENAME,HIREDATE,JOB,SAL FROM EMP
    WHERE HIREDATE LIKE'81/%';
SELECT EMPNO,ENAME,HIREDATE,JOB,SAL FROM EMP
    WHERE TO_CHAR(HIREDATE,'YY')='81';

--13.	��� ���̺��� �Ի�����81���̰� ������ 'SALESMAN'�� �ƴ� ������ ���, �����, �Ի���, 
-- ����, �޿��� �˻��Ͻÿ�.
SELECT JOB, SAL FROM EMP 
    WHERE HIREDATE LIKE'81/%' 
    AND JOB!='SALESMAN';

--14.	��� ���̺��� ���, �����, �Ի���, ����, �޿��� �޿��� ���� ������ �����ϰ�, 
-- �޿��� ������ �Ի����� ���� ������� �����Ͻÿ�.
SELECT EMPNO, ENAME, HIREDATE, JOB, SAL FROM EMP
ORDER BY SAL DESC, HIREDATE;

--15.	��� ���̺��� ������� �� ��° ���ĺ��� 'N'�� ����� ���, ������� �˻��Ͻÿ�
SELECT EMPNO, ENAME FROM EMP
    WHERE ENAME LIKE '___N%';

--16.	��� ���̺�������(SAL*12)�� 35000 �̻��� ���, �����, ������ �˻� �Ͻÿ�.
SELECT EMPNO,ENAME,SAL*12 ���� FROM EMP 
    WHERE SAL*12>=3500;
 
    