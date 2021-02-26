--[ V ] �׷��Լ�; SUM, AVG, MIN, MAX, COUNT, STDDEV, VARIANCE
SELECT ENAME, ROUND(SAL, -3) FROM EMP; --�������Լ�
SELECT SUM(SAL) FROM EMP; --  �׷��Լ�
SELECT ENAME, SUM(SAL) FROM EMP;   --�׷��Լ��� ������� ���� �� �� ����
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;   --DEPTNO� �׷��� �� 
--EMP���̺��� ���SAL
SELECT ROUND(AVG(SAL),2) FROM EMP; --�Ҽ��� 2�ڸ����� �ݿø�
SELECT COUNT(*) FROM EMP; --�ο�(��) �� 
SELECT AVG(SAL), SUM(SAL)/COUNT(SAL) FROM EMP;
SELECT COMM FROM EMP; --(300,500,1400,0)/ 14? 4?
SELECT AVG(COMM) FROM EMP; --�׷��Լ��� NULL���� ���� 
SELECT COUNT(COMM), SUM(COMM), AVG(COMM)FROM EMP; --NULL���� ���ϰ� 
--EMP���̺��� SAL�� ���, ��, �ּҰ�, �ִ밪, �л�, ǥ������
SELECT ROUND(AVG(SAL)), SUM(SAL),MIN(SAL),MAX(SAL),ROUND(VARIANCE(SAL)), ROUND(STDDEV(SAL)) FROM EMP;
-- �μ���ȣ�� �޿� �ִ�ġ 
SELECT DEPTNO �μ���ȣ, MAX(SAL)
FROM EMP 
GROUP BY DEPTNO --GROUP BY������ �ʵ��� ��Ī�� �� �� ����
ORDER BY DEPTNO;
--�׷��Լ��� ������, ������, ��¥�� ��� ��밡��
--�μ���ȣ���� �����Ի�⵵, �ֱ��Ի�⵵
SELECT DEPTNO, MIN(HIREDATE), MAX(HIREDATE) 
    FROM EMP
    GROUP BY DEPTNO;
SELECT MIN(ENAME), MAX(ENAME)
    FROM EMP;
SELECT COUNT(JOB)FROM EMP; -- JOB�ʵ��� ����:14
SELECT COUNT(DISTINCT JOB) FROM EMP; --JOB(����)�� ����: 5      CLERK,ANA,SALES,PRE,MANAGER

-- źź ������
--	���� �ֱٿ� �Ի��� ����� �Ի��ϰ� �Ի����� ���� ������ ����� �Ի����� ���. 
--(���) 80/12/17:14620��° 83/01/12:13864��°
SELECT MIN(HIREDATE) ||':'|| TRUNC(SYSDATE-MIN(HIREDATE)) || '��°',
MAX(HIREDATE)||':'|| TRUNC(SYSDATE-MAX(HIREDATE)) || '��°'
FROM EMP;
	
--	(���) 80��12��17�� �����Ի�  :14,620��° 83��01��12�� �ֱ��Ի� :13,864��°
SELECT MIN(HIREDATE) ||'�ּ��Ի�:'|| TO_CHAR(TRUNC(SYSDATE-MIN(HIREDATE)),'999,999') || '��°', 
    MAX(HIREDATE)||'�ֱ��Ի�:' ||TO_CHAR(TRUNC(SYSDATE-MAX(HIREDATE)),'999,999') || '��°'
FROM EMP;

--	10�� �μ� �Ҽ��� ��� �߿��� Ŀ�̼��� �޴� ����� ���� ���� ���ÿ�.
SELECT AVG(SAL)
FROM EMP 
WHERE DEPTNO = 10;

SELECT DEPTNO, AVG(SAL) FROM EMP 
GROUP BY DEPTNO;

--****2.GROUP BY ��***********************************8
--EX. �μ���ȣ�� �ִ�޿�
SELECT DEPTNO, MAX(SAL) 
FROM EMP
GROUP BY DEPTNO;

SELECT ENAME, HIREDATE FROM EMP
    WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP); --�������� (VI)

SELECT MAX(HIREDATE)
FROM EMP;

--�μ��� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�
SELECT D.DEPTNO, COUNT(*),MAX(SAL),MIN(SAL),ROUND(AVG(SAL)) 
FROM EMP E, DEPT D
GROUP BY D.DEPTNO;

--�μ��� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�
SELECT DNAME, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL))
FROM EMP E, DEPT D
GROUP BY DNAME;

SELECT DEPTNO, JOB, SUM(SAL) FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO;
    
--*****�� 3. HAVING  �׷��Լ� ����� ����*******
--DEPTNO���� ��ձ޿� (��ձ޿��� 2000�̻��� �μ��� ���)
SELECT DEPTNO,AVG(SAL) 
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL)>2000;

--*****��4. �ǹ����̺�*******
SELECT DEPTNO, SUM(SAL) FROM EMP 
GROUP BY DEPTNO;

SELECT DEPTNO, JOB, SUM(SAL) 
FROM EMP 
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;

--1�ܰ�
SELECT DEPTNO, DECODE(JOB,'CLERK',SAL,0) AS "CLERK", 
    DECODE(JOB,'MANAGER',SAL,0) "MANAGER", --JOB�� MANAGER�� SAL��� �ƴϸ� 0
    DECODE(JOB,'PRESIDENT',SAL,0) "PRESIDENT", --JOB�� PRESIDENT�� SAL��� �ƴϸ� 0
    DECODE(JOB,'ANALYST',SAL,0) "ANALYST",
    DECODE(JOB,'SALESMAN',SAL,0) "SALESMAN" FROM EMP;
--2�ܰ�
SELECT DEPTNO, SUM(DECODE(JOB,'CLERK',SAL,0)) AS "CLERK",
    SUM(DECODE(JOB,'MANAGER',SAL,0)) "MANAGER",
    SUM(DECODE(JOB,'PRESIDENT',SAL,0)) "PRESIDENT",
    SUM(DECODE(JOB,'ANALYST',SAL,0)) "ANALYST",
    SUM(DECODE(JOB,'SALESMAN',SAL,0)) "SALESMAN" FROM EMP
    GROUP BY DEPTNO; --�ǹ����̺�
--3�ܰ�: �հ� �߰�
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);--�հ��߰�

SELECT DEPTNO, SUM(DECODE(JOB,'CLERK',SAL,0)) AS "CLERK",
    SUM(DECODE(JOB,'MANAGER',SAL,0)) "MANAGER",
    SUM(DECODE(JOB,'PRESIDENT',SAL,0)) "PRESIDENT",
    SUM(DECODE(JOB,'ANALYST',SAL,0)) "ANALYST",
    SUM(DECODE(JOB,'SALESMAN',SAL,0)) "SALESMAN",
    SUM(SAL)"�μ��� �Ұ�"
    FROM EMP
    GROUP BY ROLLUP(DEPTNO); --�ǹ����̺� --ROLLIP�̿� �Ұ谡��
    
--ROLLUP
SELECT JOB, AVG(SAL) FROM EMP 
GROUP BY ROLLUP(JOB);

SELECT DEPTNO, JOB, AVG(SAL) FROM EMP 
GROUP BY ROLLUP(DEPTNO,JOB);  --10��,20��,30�������� ���, ��ü ��� 

-- ��<�� ��������>
-- 1. ��� ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ���
SELECT COUNT(*),MAX(SAL),MIN(SAL),TO_CHAR(SUM(SAL),'99,999')
    FROM EMP;

-- 2. ������̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB;

--- 3. ������̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT������ �ۼ��Ͽ���.
SELECT MAX(SAL)-MIN(SAL)
    FROM EMP;

-- 4. �� �μ����� �ο���, �޿� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ����ϵ� �޿��� ���� ���� ������ ����϶�.
SELECT DEPTNO, COUNT(*), ROUND(AVG(SAL),2),MIN(SAL),MAX(SAL),SUM(SAL)
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY SUM(SAL) DESC; --�޿��� ���� ���� ��

-- 5. �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� 
    --���Ͽ� ����϶�(��°���� �μ���ȣ, ���������� �������� ����)
SELECT DEPTNO, JOB, COUNT(*),TO_CHAR(ROUND(AVG(SAL),2),'999,999'),TO_CHAR(SUM(SAL),'999,999')
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB ; --���Ͽ� ����϶�(��°���� �μ���ȣ, ���������� �������� ����)

--DNAME�溡(?)

-- 6. ������, �μ��� �׷��Ͽ� �����  ����, �μ���ȣ, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� 
-- ����϶�.(��°���� ������, �μ���ȣ �� �������� ����)
SELECT JOB,DEPTNO,COUNT(*),TO_CHAR(AVG(SAL),'999,999'),TO_CHAR(SUM(SAL),'999,999')
    FROM EMP
    GROUP BY JOB, DEPTNO
    ORDER BY JOB, DEPTNO;

--7. ������� 5���̻� �Ѵ� �μ���ȣ�� ������� ����Ͻÿ�.
SELECT DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY  DEPTNO
    HAVING COUNT(*)>=5;

-- 8. ������� 5���̻� �Ѵ� �μ���� ������� ����Ͻÿ�
SELECT DNAME,COUNT(*)
    FROM DEPT D, EMP E
    WHERE E.DEPTNO=D.DEPTNO
    GROUP BY DNAME
    HAVING COUNT(*)>=5;

--9. ��� ���̺��� ������ �޿��� ����� 3000�̻��� ������ ���ؼ� ������, ��� �޿�, 
--�޿��� ���� ���Ͽ� ����϶�
SELECT JOB,TO_CHAR(ROUND(AVG(SAL),2),'99,999') "��� �޿�"
    FROM EMP
    GROUP BY JOB, SAL
    HAVING AVG(SAL)>=3000;

--10. ������̺��� �޿����� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿��հ踦 ����϶� 
        --��, �޿� �հ�� �������� �����϶�.
SELECT JOB, SUM(SAL)
FROM EMP
GROUP BY JOB,SAL
HAVING AVG(SAL)>=5000
ORDER BY SUM(SAL) DESC;

--11. �μ��� �޿����, �μ��� �޿��հ�, �μ��� �ּұ޿��� ����϶�.
SELECT ROUND(AVG(SAL),2)"��� �޿�",TO_CHAR(SUM(SAL),'99,999')"�μ��� �޿��հ�",TO_CHAR(MIN(SAL),'99,999')"�μ��� �ּұ޿�"
    FROM EMP
    GROUP BY DEPTNO;

--12. ���� 11���� �����Ͽ�, �μ��� �޿���� �ִ�ġ, �μ��� �޿����� �ִ�ġ, 
            --�μ��� �ּұ޿��� �ִ�ġ�� ����϶�.
SELECT MAX(ROUND(AVG(SAL),2)), MAX(SUM(SAL)),MAX(MIN(SAL))"�μ��� �ּұ޿�"
    FROM EMP
    GROUP BY DEPTNO;

--13. ��� ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(�⵵�� ������)
--   H_YEAR	COUNT(*)	MIN(SAL)	MAX(SAL)	AVG(SAL)	SUM(SAL)
--     80	  1		    800		    800		    800		    800
--	81	 10		    950		    5000	    2282.5	  22825
--	82	  2		    1300	    3000	   2150		   4300
--	83	  1		    1100	    1100	    1100	   1100

SELECT TO_CHAR(HIREDATE,'YY') H_YEAR, COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), 
        SUM(SAL) 
    FROM EMP GROUP BY TO_CHAR(HIREDATE,'YY') ORDER BY H_YEAR;

SELECT SUBSTR(EXTRACT(YEAR FROM HIREDATE),3,2) H_YEAR, 
        COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) 
    FROM EMP GROUP BY SUBSTR(EXTRACT(YEAR FROM HIREDATE),3,2) 
    ORDER BY H_YEAR;




-- 14.  ������̺��� �Ʒ��� ����� ����ϴ� SELECT �� �ۼ�
-- TOTAL	1980	1981	1982	1983
--  14		  1	     10	      2	      1

SELECT EXTRACT(YEAR FROM HIREDATE), COUNT(*) FROM EMP
    GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE));
    
SELECT DECODE(EXTRACT(YEAR FROM HIREDATE), '1980',1) "1980",
       DECODE(EXTRACT(YEAR FROM HIREDATE), '1981', 1) "1981",
       DECODE(EXTRACT(YEAR FROM HIREDATE), '1982', 1) "1982",
       DECODE(EXTRACT(YEAR FROM HIREDATE), '1983', 1) "1983" 
       FROM EMP;
SELECT COUNT(*) TOTAL, 
       COUNT(DECODE(EXTRACT(YEAR FROM HIREDATE), '1980', 1)) "1980",
       COUNT(DECODE(EXTRACT(YEAR FROM HIREDATE), '1981', 1)) "1981",
       COUNT(DECODE(EXTRACT(YEAR FROM HIREDATE), '1982', 1)) "1982",
       COUNT(DECODE(EXTRACT(YEAR FROM HIREDATE), '1983', 1)) "1983" FROM EMP;
SELECT COUNT(*) TOTAL,
       SUM(DECODE(EXTRACT(YEAR FROM HIREDATE), '1980', 1)) "1980",
       SUM(DECODE(EXTRACT(YEAR FROM HIREDATE), '1981', 1)) "1981",
       SUM(DECODE(EXTRACT(YEAR FROM HIREDATE), '1982', 1)) "1982",
       SUM(DECODE(EXTRACT(YEAR FROM HIREDATE), '1983', 1)) "1983" FROM EMP;



--15. ������̺��� �Ʒ��� ����� ����ϴ� SELECT �� �ۼ�(JOB ������ �������� ����)
-- JOB��, DEPTNO�� SUM(SAL)
--JOB		DEPTNO10	DEPTNO20	DEPTNO30     TOTAL
--ANALYST	     0		   6000		    0		6000
--CLERK		  1300		   1900		  950		4150
--��.
--SALESMAN	      0	 		0	 5600		 5600

SELECT JOB, DECODE(DEPTNO, 10, SAL, 0) "DEPTNO10", 
    DECODE(DEPTNO, 20, SAL, 0) "DEPTNO20",
    DECODE(DEPTNO, 30, SAL, 0) "DEPTNO30"
     FROM EMP ORDER BY JOB;
SELECT JOB, SUM(DECODE(DEPTNO, 10, SAL,0)) "DEPTNO 10",
            SUM(DECODE(DEPTNO, 20, SAL,0)) "DEPTNO 20",
            SUM(DECODE(DEPTNO, 30, SAL,0)) "DEPTNO 30",
            SUM(SAL) "TOTAL"
		FROM EMP GROUP BY JOB ORDER BY JOB;


        
--16. ������̺��� �ִ�޿�, �ּұ޿�, ��ü�޿���, ����� ���Ͻÿ�
SELECT MAX(SAL),MIN(SAL),SUM(SAL),ROUND(AVG(SAL),2)
FROM EMP;


--17. ������̺��� �μ��� �ο����� ���Ͻÿ�
SELECT DEPTNO, COUNT(*)
FROM DEPT
GROUP BY DEPTNO;


--18. ��� ���̺��� �μ��� �ο����� 6���̻��� �μ��ڵ带 ���Ͻÿ�
SELECT DEPTNO, COUNT(*)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>=6;


--19. ������̺��� ������ ���� ����� ������ �Ͻÿ�
--DNAME               CLERK    MANAGER     PRESIDENT    ANALYST   SALESMAN
--ACCOUNTING            1300       2450       5000          0          0
--RESEARCH              1900       2975          0       6000          0
--SALES                 950        2850          0          0       5600

SELECT DNAME, SUM(DECODE(JOB, 'CLERK', SAL, 0)) CLERK,
              SUM(DECODE(JOB, 'MANAGER', SAL,0)) MANAGER,
              SUM(DECODE(JOB, 'PRESIDENT', SAL,0)) PRESIDENT,
              SUM(DECODE(JOB, 'ANALYST', SAL,0)) ANALYST,
              SUM(DECODE(JOB, 'SALESMAN', SAL,0)) SALESMAN
            FROM EMP E, DEPT D
            WHERE E.DEPTNO=D.DEPTNO
            GROUP BY DNAME;


--20.  ������̺��� �޿��� ���� ������� ����� �ο��Ͽ� ������ ���� ����� ������ �Ͻÿ�. 
-- (��Ʈ self join, group by, count���)
--ENAME	    ���
--________________________
--KING		1
--SCOTT		2
--����

SELECT E1.ENAME,COUNT(E2.ENAME)+1 ���
    FROM EMP E1, EMP E2
    WHERE E1.SAL<E2.SAL(+)
    GROUP BY E1.ENAME
    ORDER BY ���;
    
SELECT ENAME, SAL,
    RANK() OVER(ORDER BY SAL DESC) "RANK",  --������ �Ѿ�� �ӵ��ȳ�
    DENSE_RANK() OVER(ORDER BY SAL DESC) "DENSE_R",
    ROW_NUMBER() OVER(ORDER BY SAL DESC) "ROW_NUM"
    FROM EMP;
    
    
    
    
    
    
    
    
    
    
