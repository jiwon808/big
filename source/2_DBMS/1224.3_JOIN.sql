---[|||] JOIN: ���̺��� 2�� �̻� �����Ͽ� �˻� 
SELECT * FROM EMP WHERE ENAME = 'SCOTT';  --�μ���ȣ(DEPNO):20
SELECT * FROM DEPT;
-- CROSS JOIN ( FROM ���� ���̺� 2�� �̻�)
SELECT * FROM EMP,DEPT WHERE ENAME = 'SCOTT';  -- DEPT4��. EMPT1��.  --> CROSS JOIN�ϸ� 4�ಬ�γ���
-- EQUI JOIN (���� �ʵ��� DEPTNO���� ��ġ�Ǵ� ���Ǹ� JOIN)
SELECT * FROM EMP, DEPT 
    WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DEPTNO;

SELECT * FROM EMP, DEPT 
    WHERE EMP.DEPTNO = DEPT.DEPTNO;
-- ��� ����� �̸�, �μ���, �μ���ȣ
SELECT ENAME "NAME",DNAME,E.DEPTNO FROM EMP E,DEPT D    --Alias���������� �����ٿ��� E  D�� ����ؾ�
    WHERE E.DEPTNO= D.DEPTNO;
SELECT E.*, DNAME, LOC
    FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
--���, �̸�, �μ���ȣ, �μ��̸�, �ٹ��� 
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
-- �޿� 2000�̻��� ������ �̸�, ����, �޿�, �μ���, �ٹ��� �ʵ� ��� 
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.SAL>2000;
-- LOC�� CHICAGO�� ����� �̸�, ����, �μ���, �ٹ��� �ʵ� ���
SELECT ENAME, JOB, DNAME, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND D.LOC='CHICAGO';
-- �μ���ȣ�� 10 �Ǵ� 20�� ����� �̸�, ����, �ٹ��� ���(�޿��� ����)
SELECT ENAME, JOB, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND D.DEPTNO IN (10,20)
    ORDER BY SAL;
-- �̸�, �޿�, ��(COMM),����(�޿�+COMM)*12), �μ���, �ٹ��� 
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 ����, DNAME, LOC    --����: NVL(COM,0)
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
-- TO_CHAR(��¥��, 'YY')
-- TO_CHAT(������, '99,999')
-- JOB�� salesman �Ǵ� manager�� ����� (������ ū�� ����)                 --����:SAL�� �������� ����x    ������ SAL+NVL(COMM,0)
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 ����, DNAME, LOC  
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
        AND UPPER(JOB) IN ('SALESMAN','MANAGER')
    ORDER BY ���� DESC; 
-- COMM�� NULL�̰� �޿��� 1200�̻��� ����� 
-- �̸�, �޿�, �Ի���, �μ���ȣ, �μ���(�μ����, �޿�ū�� ����)
SELECT ENAME, SAL, HIREDATE, E.DEPTNO,DNAME        --����DEPTNO�� E  D�� �� �ֱ⶧����  �� E.DEPTNO  Ȥ�� D.DEPTNO�ν��
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND COMM IS NULL AND SAL>=1200
    ORDER BY DNAME, SAL DESC;
--EQUI JOIN ���� 

--	���忡�� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�
SELECT ENAME,SAL FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';

--	ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�
SELECT ENAME, HIREDATE FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND DNAME = 'ACCOUNTING';
 
--	������ MANAGER�� ����� �̸�, �μ����� ����Ͻÿ�
SELECT ENAME,DNAME FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER';

--	Comm�� null�� �ƴ� ����� �̸�, �޿�, �μ��ڵ�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL,E.DEPTNO,LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;

--�ڡ�NON-EQUI JOIN�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
SELECT ENAME, SAL FROM EMP WHERE ENAME='SCOTT';
SELECT * FROM SALGRADE;
SELECT ENAME, SAL,GRADE,LOSAL, HISAL 
    FROM EMP, SALGRADE 
    WHERE ENAME = 'SCOTT' AND SAL BETWEEN LOSAL AND HISAL; -- SAL BETWEEN LOSAL AND HISAL;   4��޸� ������  (���⼭�� NON EQUI JOIN)
--��� ����� ���, �̸�, JOB, �����, ����, �޿����(1���,2���)..       -- || '����'�̶�� ������  Grade 
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'���'    
    FROM EMP, SALGRADE -- || '����'�̶�� ������  Grade 
    WHERE SAL BETWEEN LOSAL AND HISAL;

--źź������ ����
--	Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.
SELECT ENAME,SAL,GRADE,E.DEPTNO,DNAME,LOC       --���� DEPTNO�� E,D�� �� �ֱ⶧����  E.DEPTNO�� ���
    FRP, EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND
        COMM IS NOT NULL;

--	�̸�, �޿�, �Ի���, �޿����
SELECT ENAME, SAL, HIREDATE,GRADE FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
    
--	�̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
--	�̸�, �޿�, ���, �μ��ڵ�, �ٹ���. �� comm �� null�ƴ� ���
SELECT ENAME, SAL, GRADE, E.DEPTNO, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND COMM IS NOT NULL;
--	�̸�, �޿�, �޿����, ����, �μ���, �μ��� ���, �μ��� ������ ������. ����=(sal+comm)*12 comm�� null�̸� 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 ����, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY DNAME, ����; -- ���� ����� SAL���� x  ������ ���   (�� �Ʒ� �� ���� üũ)
--	�̸�, ����, �޿�, ���, �μ��ڵ�, �μ��� ���. �޿��� 1000~3000����. �������� : �μ���, �μ������� ������, ���������� �޿� ū��
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
FROM  EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
    AND SAL>=1000 AND SAL<=3000
    ORDER BY JOB, SAL DESC;
--WHERE SAL BETWEEN '1000' AND '3000'

--	�̸�, �޿�, ���, �Ի���, �ٹ���. 81�⿡ �Ի��� ���. ��� ū��
SELECT ENAME, SAL, HIREDATE, LOC 
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL   --EQUI.JOIN    NON-EQUI JOIN
        AND TO_CHAR( HIREDATE,'YY') = '81'     
    ORDER BY GRADE DESC;
    
--�ڡ�SELF JOIN�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
SELECT W.EMPNO,W.ENAME, W.MGR,M.ENAME MANAGERNAME    --���� W.MGR , M.EMPNO  ���� ������ �ϳ� ��
    FROM EMP W, EMP M
    WHERE W.ENAME='SMITH' 
    AND W.MGR = M.EMPNO;
SELECT WORKER.EMPNO, WORKER.ENAME, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR=MANAGER.EMPNO;  --EMPNO�� NULL���� �����Ƿ� 13�� 
--"SMITH�� ���� FORD��" ��� 
SELECT W.ENAME||'�� ���� ' ||M.ENAME||'��' 
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
-- SELF JOIN źź������ ����
-- ex1.����� �̸��� 'KING�� ������� �̸��� JOB���    --SELF JOIN  ���̺� '����� �̸�' ����. 
SELECT W.ENAME, W.JOB 
    FROM EMP W, EMP M 
    WHERE W.MGR = M.EMPNO   --13�� �� ����
    AND M.ENAME = 'KING';

-- ex2. SCOTT�� ������ �μ���ȣ(20)���� �ٹ��ϴ� ����� �̸� ��� --SELF JOIN, EQUI JOIN    ��°��:SMITH,JONES,ADAMS,FORD
SELECT E2.ENAME  --���� E1.ENAME, E1.DEPTNO, E2.DEPTNO����. ������
    FROM EMP E1, EMP E2 
    WHERE E1.ENAME='SCOTT' 
    AND E1.DEPTNO = E2.DEPTNO
    AND E2.ENAME!='SCOTT';
    
-- ex3. SCOTT�� ������ �ٹ���(DALLAS)���� �ٹ��ϴ� ����� �̸� ���  --SELF JOIN, EQUI JOIN   ��°��:FORD,ADAMS,JONES,SMITH,HONG
SELECT E1.ENAME, D1.LOC 
    FROM EMP E1, DEPT D1
    WHERE E1.DEPTNO=D1.DEPTNO AND E1.ENAME='SCOTT'; --1��  1��
SELECT E2.ENAME,D2.LOC       
    FROM EMP E2,DEPTD2
    WHERE E2.DEPTNO=D2.DEPTNO --  2�� 15��
    
SELECT E2.ENAME       --���� E1.ENAME, D1.LOC , E2.ENAME,D2.LOC  
    FROM EMP E1, DEPT D1, EMP E2,DEPT D2
    WHERE E1.DEPTNO=D1.DEPTNO AND E1.ENAME='SCOTT' 
        AND E2.DEPTNO=D2.DEPTNO
        AND D1.LOC=D2.LOC AND E2.ENAME!='SCOTT'; --1���� 2�� 
INSERT INTO DEPT VALUES (50,'IT','DALLAS');
INSERT INTO EMP (EMPNO,ENAME,DEPTNO)
    VALUES(9999,'HONG',50);
ROLLBACK; -- DML(������ ���۾�)�� ��ҽ�Ŵ  
SELECT * FROM DEPT;
SELECT * FROM EMP;





--�ڡ�OUTER JOIN ���� ���ǿ� �������� ���� ����� ��Ÿ���ԡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
SELECT W.EMPNO, W.ENAME, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);      --(+)�ϸ� OUTERJOIN
 SELECT W.EMPNO, W.ENAME, NVL (M.ENAME,'--CEO--')    --ENAMe�� �����̹Ƿ�, �������� ���
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);     

 SELECT W.EMPNO, W.ENAME, NVL (M.ENAME,'--CEO--')    --ENAMe�� �����̹Ƿ�, �������� ���
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO    -- EMPNO���� ������ MGR�� ���� ����
    AND W.EMPNO IS NULL;      -- (���� �������� ��簡 �ƴϸ� �̷��� ==���� ���)

SELECT * FROM EMP; --14��
SELECT * FROM DEPT; --4��(10,20,30,40)
SELECT E.*, DNAME FROM EMP E, DEPT D
    WHERE E.DEPTNO(+)=D.DEPTNO;            --emp���� 40�� ����. ���� �����ϸ� ����          ��� �ȳ��� �� �ڿ� +

--Outer joinźź������
--SMITH�� �Ŵ����� FORD�Դϴ� / KING�� �Ŵ����� �����ϴ�.
SELECT W.ENAME || '�� �Ŵ�����' || NVL(M.ENAME, '��') || '�Դϴ�'
    FROM EMP W, EMP M 
    WHERE W.E = M.EMPNO(+);

SELECT * FROM EMP;


--�� ��������
-- �� <��������> PART1
--1. �̸�, ���ӻ��
SELECT W.ENAME,  M.ENAME MANAGER  --���� W.MGR , M.EMPNO  ���� ������ �ϳ� ��
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--2. �̸�, �޿�, ����, ���ӻ��
SELECT W.ENAME, W.SAL, W.JOB, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--3. �̸�, �޿�, ����, ���ӻ��. (��簡 ���� �������� ��ü ���� �� ���.
    --��簡 ���� �� '����'���� ���)
SELECT W.ENAME, W.SAL, W.JOB, NVL(M.ENAME,'����') MANAGER
    FROM EMP W, EMP M
    WHERE  W.MGR = M.EMPNO(+);

--4. �̸�, �޿�, �μ���, ���ӻ���
SELECT W.ENAME, W.SAL,D.DNAME,  M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D
    WHERE W.DEPTNO = D.DEPTNO 
    AND W.MGR = M.EMPNO; 

--5. �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)
SELECT W.ENAME, W.SAL, D.DEPTNO, D.DNAME, D.LOC,M.ENAME 
    FROM EMP W, EMP M, DEPT D
    WHERE  W.MGR = M.EMPNO(+)
    AND D.DEPTNO = W.DEPTNO ;

--6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���       --��� NON EQUI JOIN
SELECT W.ENAME, W.SAL, GRADE, D.DNAME, M.ENAME MANAGER
FROM  EMP W, EMP M, DEPT D, SALGRADE
WHERE W.MGR = M.EMPNO(+)
    AND D.DEPTNO = W.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL 
    AND W.SAL>=2000;

--7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)
SELECT W.ENAME, W.SAL, GRADE, D.DNAME, NVL(M.ENAME,'����') 
FROM EMP W, EMP M, DEPT D, SALGRADE 
WHERE W.MGR = M.EMPNO(+)
    AND D.DEPTNO = W.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL 
ORDER BY D.DNAME;

--8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0
SELECT W.ENAME, W.SAL, GRADE, D.DNAME, W.SAL*12+NVL(W.COMM,0) ����,M.ENAME
FROM EMP W, EMP M, DEPT D, SALGRADE 
WHERE W.MGR = M.EMPNO
    AND D.DEPTNO = W.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL;
    

--9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����
SELECT W.ENAME, W.SAL*12+NVL(W.COMM,0) ����, GRADE, D.DNAME, M.ENAME
FROM EMP W, EMP M, DEPT D, SALGRADE 
WHERE W.MGR = M.EMPNO
    AND D.DEPTNO = W.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL
ORDER BY D.DNAME, W.SAL DESC; 



--  PART2
--1.EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT  W.ENAME, D.DEPTNO,D.DNAME       
FROM EMP W, DEPT D
WHERE D.DEPTNO = W.DEPTNO;


--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ���
SELECT ENAME, JOB, SAL,D.DNAME       
FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO
    AND LOC= 'NEW YORK';

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���
SELECT ENAME, DNAME, LOC       
    FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
        AND E.COMM IS NOT NULL AND COMM!=0;

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT ENAME,JOB, DNAME, LOC
FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO
    AND ENAME LIKE '%L%';


--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������
SELECT EMPNO,ENAME,D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
ORDER BY ENAME;


--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
 SELECT EMPNO,ENAME,SAL,DEPTNO
    FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
    ORDER BY SAL DESC;
    
    
--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
-- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
    AND JOB= 'MANAGER'
    AND SAL >=2500
ORDER BY EMPNO;

--8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP E, SALGRADE
    WHERE  SAL BETWEEN LOSAL AND HISAL
ORDER BY E.SAL DESC;

--9. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)
SELECT W.ENAME �����, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    
--10. �����, ����, ����� ������ �˻��Ͻÿ�
SELECT W.ENAME ���, M.ENAME ���,M.ENAME ����� ���
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO
    AND M.MGR = MM.EMPNO;


--11. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�
SELECT W.ENAME ���, NVL(M.ENAME,'')���, NVL (MM.ENAME,'') "����� ���"  --���⼭ "����� ���"�� �߰��� sapce�� �ֱ⶧���� "" ����Ѵ�
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO(+)
    AND M.MGR = MM.EMPNO(+);
