--[IV] �������Լ�
-- �Լ� = ������ �Լ� + �׷��Լ�
SELECT ENAME, TO_CHAR (HIREDATE, '   YY  "��" MM  "��" DD  "��"   ')FROM EMP;             --YY�� Ư���� ������ ���� �ִ� �� .  "��"�� �Ϲ� string�̱⿡ ""
SELECT ENAME, INITCAP(ENAME) FROM EMP; --������ �Լ� 
SELECT SUM(SAL) FROM EMP; --�׷��Լ�
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO; --�׷��Լ� 
--EX. �����Լ�, �����Լ�, ��¥�Լ�, ����ȯ�Լ� ,NVL(),DECODE,ETC...
--(1) �����Լ�
DESC DUAL; --����Ŭ���� �����ϴ� 1��1��¥�� DUMMY TABLE
SELECT ABS(-9) FROM DUAL; --���밪
SELECT FLOOR(34.5678) FROM DUAL; --�Ҽ������� ���� 
SELECT FLOOR(34.5678*10)/10 FROM DUAL; --�Ҽ��� ���ڸ����� ����  -- /10 �����  345���� ����
SELECT TRUNC(34.5678) FROM DUAL; --�Ҽ������� ����
SELECT TRUNC (34.5678,1) FROM DUAL; --�Ҽ��� ���ڸ����� ���� 
SELECT TRUNC(34.5678,-1) FROM DUAL; --���� �ڸ����� ���� 

--emp���̺��� �̸�, �޿�(���� �ڸ����� ����)
SELECT ENAME, TRUNC (SAL,-1) FROM EMP;
SELECT CEIL(34.5678) FROM DUAL; --�Ҽ������� �ø� 
SELECT ROUND(34.5678) FROM DUAL; --�Ҽ������� �ݿø� 
SELECT ROUND(34.5678,1) FROM DUAL; --�Ҽ��� ���ڸ����� �ݿø�
SELECT ROUND(34.5678,-1) FROM DUAL; --���� �ڸ����� �ݿø�

SELECT FLOOR(10/4)  FROM DUAL;
SELECT MOD (9,2) FROM DUAL; -- ������ ���� 
SELECT MOD('9',2) FROM DUAL; -- 9/2�� ������ 

-- Ȧ���޿� �Ի��� �������� ��� �ʵ带 ���
SELECT * FROM EMP
WHERE MOD (TO_CHAR(HIREDATE,'MM'),2) =1;      --***��/2  ������1  �׷� 'Ȧ����' *****

--(2)���� ���� �Լ� 
SELECT UPPER('abcABC') FROM DUAL;
SELECT LOWER('abcABC') FROM DUAL;
SELECT INITCAP('abcABC') FROM DUAL;
--JOB�� MANAGER�� ������ ��� �ʵ�
SELECT*FROM EMP WHERE UPPER(JOB) = 'MANAGER';
SELECT EMPNO, INITCAP(ENAME) FROM EMP;
--���� ����
SELECT 'AB'|| 'CD' || 'EF'|| 'GH' FROM DUAL;
SELECT CONCAT('AB','CD'),CONCAT('EF','GH') FROM DUAL;  -- CONCAT(str1,str2):���ڿ���
--xxx�� xx�� (�̸��� JOB�̴�)
SELECT ENAME ||'��' || JOB ||'�̴�' FROM EMP;
SELECT CONCAT(CONCAT(ENAME,'��'),CONCAT(JOB,'�̴�')) FROM EMP;

-- SUBSTR(STR, ������ġ, ���ڰ���) ù��° ��ġ�� 1
-- SUBSTRB(STR, ������ġ, ���ڹ���Ʈ��)
SELECT SUBSTR('WELCOME TO ORACLE', 3,2) FROM DUAL; --3��° ���� 2����
SELECT SUBSTRB('WELCOME TO ORACLE', 3,2) FROM DUAL; --3��° ���� 2BYTE

SELECT SUBSTR('�����ͺ��̽�',4,3) FROM DUAL; --4��°���� 3����
SELECT SUBSTRB('�����ͺ��̽�',4,3) FROM DUAL; --4��° BYTE���� 3BYTE       B�� ������ 'BYTE', B�� �Ⱥ����� '����'
--����� �ѹ��ڰ� 1BYTE, �ѱ� �� ���ڰ� 3BYTE
--9���� �Ի��� ����� ��� �ʵ�  81/01/01
SELECT * FROM EMP WHERE SUBSTR(HIREDATE,4,2)='09';        --4��°���� 2���� �����ؼ� 09 �ΰ� ******
SELECT SUBSTAR('02-716-9999', -4,4) FROM DUAL;           --�ں��� 4�ڸ�

--9���� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, -2,2) = '09';

SELECT LENGTH('ABCD') FROM DUAL;  --���� ���� 4
SELECT LENGTHB('ABCD') FROM DUAL;  --����BYTE ��:4
SELECT LENGTH('����Ŭ') FROM DUAL; --���ڰ���:3
SELECT LENGTHB('����Ŭ') FROM DUAL; --���ڰ���:3
-- INSTR(str, ã������);  str���� ã�� ������ ��ġ(ù��°1). ������0
-- INSTR(str, ã������, ������ġ)
--      ; str���� ������ġ���� ã�Ƽ� ã�� ������ ��ġ(ù��°1). ������0  
SELECT INSTR ('ABCABC','B') FROM DUAL; --2
SELECT INSTR ('ABCABC','B',3) FROM DUAL; --5    ***3��° �ڸ����� ����  B�� 5��° �ڸ�*****

--9���� �Ի��� ���(INSTR�̿�)
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09') = 4;
-- 9�Ͽ� �Ի��� ���(INSTR �̿�) 81/12/09
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09') =7;   --**/�����ؼ� 7��°�ڸ��� 09****

--LPAD(����, �ڸ���, '*')  ���ڸ� �ڸ��� ��ŭ Ȯ���ϰ� ���� ���ڸ��� *
SELECT LPAD('ORACLE', 20, '#') FROM DUAL;         --LPAD�� ���ʿ� ���̰�, RPAD�� �����ʿ� �ٿ�
SELECT RPAD('ORACLE',20,'*') FROM DUAL;
SELECT ENAME, LPAD(SAL, 6, '*') FROM EMP;

-- ���, S****(�̸��� ���ѹ��ڸ� ����ϰ� �������� *) ���
SELECT EMPNO, RPAD(SUBSTR(ENAME, 1,2),LENGTH(ENAME),'*') NAME
    FROM EMP;
    
-- 7369(���), S****(�̸�) 80/12/**(�Ի���) ���
SELECT EMPNO, RPAD(SUBSTR(ENAME,1,1), LENGTH(ENAME),'*') NAME,
    RPAD(SUBSTR(HIREDATE, 1,6),LENGTH(HIREDATE),'*') HIRE
    FROM EMP;
--7369(���), ****H(�̸�) 80/12/**(�Ի���) ���
SELECT EMPNO, LPAD(SUBSTR(ENAME,-1,1),LENGTH(ENAME), '*') NAME,
    RPAD(SUBSTR(HIREDATE,1,6),LENGTH(HIREDATE),'*') 
    FROM EMP;

-- �̸��� ����° �ڸ��� R�� ��� ���( INSTR, SUBSTR, LIKE)
SELECT ENAME FROM EMP WHERE ENAME LIKE '__R%';
SELECT * FROM EMP WHERE INSTR(ENAME, 'R') =3;
SELECT * FROM EMP WHERE SUBSTR(ENAME,3,1) = 'R';
SELECT TRIM('   ORACALE DB  ') FROM DUAL;
SELECT LTRIM('   ORACALE DB  ') FROM DUAL;
SELECT RTRIM('   ORACALE DB  ') FROM DUAL;
SELECT REPLACE(ENAME, 'A', 'XX') FROM EMP;

-- 3) ��¥ ���� �����, �Լ�
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD HH24: MI:SS "��" ') FROM DUAL;
SELECT SYSDATE-1 ����, SYSDATE ����, SYSDATE+1 ����  FROM DUAL;
-- 14�� �� 
SELECT SYSDATE + 14 FROM DUAL;
-- �̸� �Ի���, �ٹ����� 
SELECT ENAME, HIREDATE,FLOOR(SYSDATE-HIREDATE) �ٹ�����  FROM EMP;
SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) �ٹ�����  FROM EMP;
- �̸�, �Ի���, �ٹ��ּ�, �ٹ���� ���
SELECT ENAME, HIREDATE, FLOOR((SYSDATE-HIREDATE)/7) �ٹ��ּ�,
    FLOOR((SYSDATE-HIREDATE)/365) �ٹ����
    FROM EMP;
    
--�̸�, �Ի���, �ٹ�����
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) FROM EMP;

-- ADD_MONTHS(Ư����¥, ������) Ư���� ��¥�κ��� ��� ���� ����
-- �̸�, �Ի���, �����Ⱓ ������( �����Ⱓ�� 6����)
SELECT ENAME, HIREDATE, HIREDATE, ADD_MONTHS(HIREDATE,6) FROM EMP;
--NEXT_DAY(Ư����¥, '��') Ư����¥�κ��� ó�� �����ϴ� ������
SELECT NEXT_DAY(SYSDATE,'��') FROM DUAL;
-- LAST_DAY(Ư����¥); Ư����¥�� ���� ���� 
--�̸�, �Ի���, ���޳�(������ ����)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) FROM EMP;
--ROUND; ��¥�ݿø�, TRUNC; ��¥����
SELECT ROUND(SYSDATE-30, 'YEAR') FROM DUAL;  --��� ����� 1��1��  --YEAR�ݿø� �̱⿡ 21�⵵ 
SELECT ROUND(SYSDATE-30, 'MONTH') FROM DUAL; --��� ����� 1��
SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; --��� ����� �Ͽ���    ( ��ȭ���� --> ������ �Ͽ��� ����� �� --> �̹��� �Ͽ���) (������ ��� �Ͽ���)
SELEC ROUND(SYSDATE) FROM DUAL; -- ��� ����� 0��

--ROUND; ��¥�ݿø�, TRUNC; ��¥����
SELECT TRUNC(SYSDATE-30, 'YEAR') FROM DUAL;
SELECT TRUNC(SYSDATE-30, 'MONTH') FROM DUAL; 
SELEC TRUNC (SYSDATE,'DAY') FROM DUAL; 
SELEC TRUNC (SYSDATE) FROM DUAL; -- ��� ���� 0��

 --EX1. �̸�, �Ի���, �Ի��ϴ��� 1��
 SELECT ENAME, HIREDATE, TRUNC(HIREDATE,'MONTH')
 FROM EMP;
 
 --EX2. �̸�, �Ի���,   ù���޳�(25��)
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9,'MONTH')+24      --�Ի��� 25�������̸� �״� �޾�, �Ի��� 25�����̸� ������    
                                                     --�̹��� 1�Ͽ� �ٴ´�     1+24 �ϸ� 25���̵�    --�׷��� HIREDATE-9 �̺κ��� 1�� �����  �츮�� 1�� 1�Ͽ� �ٰ� ROUND���
FROM EMP;

SELECT ENAME, HIREDATE, ROUND(HIREDATE-8,'MONTH') +23         --�̹��� 1�Ͽ� �ٴ´�     --25�Ϻ��� �ڴ� ������
FROM EMP;


-- EX3. �̸�, �Ի���, SAL(����), �̶����� ���� ������   (���� �� ���)
SELECT ENAME, HIREDATE, SAL* TRUNC (MONTHS_BETWEEN(SYSDATE,HIREDATE)) 
FROM EMP;


-- EX4. �̸�, �Ի���, SAL(����), COMM, �̶����� ���� ����(SAL*12+COMM)    (���� �� ���)
SELECT ENAME, HIREDATE, SAL, COMM,
    SAL*TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))+NVL(COMM,0)*TRUNC((SYSDATE-HIREDATE)/365)
    FROM EMP;

--(4) ����ȯ�Լ�
--TO_CHAR(��¥, ����); ��¥�� ���Ͽ� �°� ���������� ����ȯ
    --YY(�⵵) MM(��) MON(���̸�) DD(��)  DY(����)
    --HH24(0~23��) AM(����/����) HH(0~11��) MI(��) SS(��) 
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY "��" MM "��" DD "��" DY "����" ' ) FROM EMP;
SELECT TO_CHAR(SYSDATE, 'YY"��" MON DD "��" AM HH "��" MI "��" SS "��"')
    FROM DUAL;

--TO_CHAR(����, ����); ���ڰ��� ���Ͽ� �°� ���������� ����ȯ 
    -- ���ϳ� 0; �ڸ���. �ڸ����� ���� ������ 0���� ä�� 
    -- ���ϳ� 9; �ڸ���. �ڸ����� ���� ������ ä���� ���� (�ڹٿ����� #)
    -- ���ϳ� $; ��ȭ���� $�� ���ھտ� ���� 
    -- ���ϳ� L; ������ȭ������ ���ھտ� ���� 
SELECT ENAME, TO_CHAR(SAL,'L999,999')SAL FROM EMP;
SELECT ENAME, TO_CHAR(SAL,'$999,999')SAL FROM EMP;  --6�ڸ�. ���࿡ 6�ڸ� �ƴϸ� �ƿ� ####�������� ����
SELECT ENAME, TO_CHAR(SAL,'$000,000')SAL FROM EMP;

--TO_DATE(����, ����); '81/01/01' ���ڸ� ���Ͽ� �°� ��¥������ ��ȯ 
--81/5/1 ~ 83/5/1���̿� �Ի��� ���� ��� 
SELECT * FROM EMP
    WHERE HIREDATE BETWEEN '81/05/01' AND '83/05/01';
SELECT * FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE ('19810501','YYYYMMDD' ) AND TO_DATE('19830501','YYYYMMDD');
-- 2020��11��30�Ϻ��� ������� ��¥���� ���(�ý����� ��¥�� ������ �𸥴�)
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) FROM EMP;
SELECT (SYSDATE-TO_DATE('20201130','YYYYMMDD'))FROM DUAL;
SELECT CEIL(SYSDATE-TO_DATE('20201130','YYYYMMDD'))FROM DUAL; --29
SELECT TRUNC(SYSDATE-TO_DATE('20201130','YYYYMMDD')) FROM DUAL; --28     
                                --DUAL ��ü ����غ��� 1��. ���� FROM DUAL�� 1�ุ, ���� ����� ������ �;��ϴ� ���
SELECT * FROM DUAL;
SELECT * FROM EMP;
--TO_NUMBER(����, ����); ���ڸ� ���Ͽ� �°� ���������� ��ȯ 
SELECT TO_NUMBER('1,000', '9,999') FROM DUAL;
SELECT TO_NUMBER('1,000','9,999')*1.1 FROM DUAL;  --1000�� 4�ڸ� ���̹Ƿ�, �ڿ� 9,999

--(5) NULL �����Լ�; NVL(���� ���� �ִ� ������, ���̸� ����� ��)
                    -- �Ű����� 2���� Ÿ����ġ
-- ����̸�, ���ӻ�� �̸�(���ӻ�簡 ������ CEO�� ���)
SELECT W.ENAME, NVL(M.ENAME,'CEO') 
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
-- ����̸�, ���ۻ���� ���(���ۻ�簡 ������ CEO�� ���)
            --MGR�� ���ڷ� �ٲ�
SELECT ENAME, NVL(TO_CHAR(MGR),'CEO') MGR FROM EMP; 
DESC EMP;

--(6) DECODE( ������, ��1, ���1, ��2, ���2,...., ��N,���N, �׿� ���)
-- �̸�, �μ���ȣ, �μ��̸� 
SELECT ENAME, D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
SELECT ENAME, DEPTNO,
    DECODE(DEPTNO, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS', 'ETC') AS "DNAME"
    FROM EMP;
SELECT ENAME, DEPTNO,
    CASE DEPTNO WHEN 10 THEN 'ACCOUNTIN'
                WHEN 20 THEN 'RESEARCH'
                WHEN 30 THEN 'SALES'
                WHEN 40 THEN 'OPERATIONS'
         ELSE 'ETC'
    END AS "DNAME"
    FROM EMP;
    
--  �̸�, �޿�, �λ����޿�
    -- JOB�� ���� 'ANALYST'�� 10%�λ�, 'MANAGER'�� 20%�λ�, 'PRESIDENT'�� 30%�λ�, 'SALESMAN'  40%�λ�, 'CLERK' '�λ�x'
SELECT DISTINCT JOB FROM EMP;
SELECT ENAME,SAL ���޿�, 
    DECODE(JOB, 'ANALYST', SAL*1.1, 'MANAGER', SAL*1.2, 'PRESIDENT', SAL*1.3, 'SALESMAN', SAL*1.4, SAL) �λ�޿�
    FROM EMP;       --JOIN�� �� ��� DECODE���

SELECT ENAME, SAL ���޿�,
    CASE JOB WHEN 'ANALYST' THEN SAL*1.1
            WHEN 'MANAGER' THEN SAL*1.2
            WHEN 'PRESIDENT' THEN SAL*1.3
            WHEN 'SALESMAN' THEN SAL*1.4
            ELSE SAL
    END �λ�޿�
    FROM EMP;

--(7) �׿� EXTRACT, ������ ��� 
SELECT EXTRACT(YEAR FROM HIREDATE) YEAR FROM EMP;
SELECT TO_CHAR(HIREDATE,'YYYY') YEAR FROM EMP;
SELECT EXTRACT(MONTH FROM HIREDATE) MONTH FROM EMP; 
SELECT TO_CHAR(HIREDATE, 'MM') MONTH FROM EMP;
-- LEVEL, START WITH (�ֻ��������� ����), CONNECT BY PRIOR ( ������ ��������)
SELECT LEVEL, LPAD(' ',LEVEL*2)||ENAME, MGR FROM EMP 
    START WITH MGR IS NULL
    CONNECT BY PRIOR EMPNO = MGR;
    
         
-- <�� ��������>
-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE "Current Date"
FROM DUAL;      --����: FROM EMP�� �ƴ϶� FROM DUAL         ���ุ ���

-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL,'9,999'),   TO_CHAR((SAL*1.5),'9,999') "NEW Salary", TO_CHAR((SAL*1.5-SAL),'9,999') "Increase"
FROM EMP;


--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6),'��')"6���� �� ������"
FROM EMP;


--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE,TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))"�ٹ� ������", TO_CHAR(SAL,'9,999'), TO_CHAR(SAL*TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)),'$9,9999,999') �ѱ޿� 
FROM EMP;      --���� TRUNC ������

SELECT ENAME, HIREDATE, 
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) ������, SAL, 
    TO_CHAR(ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE))*SAL, 
                                    '$9,999,999.99') �޿��Ѱ� 

--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT ENAME, LPAD(SAL,15,'*')�޿�
FROM EMP;


--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE,'DY') ����
FROM EMP;

SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY "��" MM "��" DD "��" DY "����" ' ) FROM EMP;


--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME), JOB
FROM EMP
WHERE LENGTH(ENAME)>=6;



--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, TO_CHAR(SAL,'9,999') �޿�, TO_CHAR(COMM,'9,999'), TO_CHAR(SAL+NVL(COMM,0),'9,999')"�޿�+���ʽ�"
FROM EMP;

-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT ENAME, SUBSTR(ENAME,2,3)
FROM EMP;

--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ���
SELECT EMPNO,ENAME,HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM')='12' ;


--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--����. 

SELECT EMPNO, ENAME, LPAD(SAL,10,'*') �޿�
FROM EMP;

-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO	 ENAME 	�Ի���
-- 7369	  SMITH		1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') �Ի��� 
FROM EMP;


--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ�3�ڸ����� ,�� ����Ѵ�)
SELECT EMPNO,ENAME, JOB, TO_CHAR(SAL,'$999,999') SAL     --���� ALIAS �־�  �˳��ϰ�9���°� ����. ū ���ڰ� ���� �� �ֱ⶧����
FROM EMP
WHERE DEPTNO=20;


-- 14. ��� ���̺��� �޿��� ���� ���, �̸�, �޿�, ����� �˻��ϴ� SQL ������ �ۼ� �Ͻ� ��.
-- �޿��� 0~1000 E / 1001~2000 D / 2001~3000 C / 3001~4000 B / 4001~5000 A       [DCODE���]
SELECT EMPNO, ENAME, SAL,
    CASE WHEN SAL BETWEEN 0 AND 1000 THEN 'E'
        WHEN SAL BETWEEN 1001 AND 2000 THEN 'D'
        WHEN SAL BETWEEN 2001 AND 3000 THEN 'C'
        WHEN SAL BETWEEN 3001 AND 4000 THEN 'B'
        WHEN SAL BETWEEN 4001 AND 5000 THEN 'A'
    END ��� FROM EMP;
    
SELECT EMPNO, ENAME, SAL,
    CASE TRUNC((SAL-1)/1000) WHEN 0 THEN 'E'
    WHEN 1 THEN 'D'
    WHEN 2 THEN 'C'
    WHEN 3 THEN 'B'
    ELSE 'A'
    END ���
    FROM EMP;
    
    
    WHEN SAL BETWEEN 0 AND 1000 THEN 'E'
        WHEN SAL BETWEEN 10001 AND 2000 THEN 'D'
        WHEN SAL BETWEEN 2001 AND 3000 THEN 'C'
        WHEN SAL BETWEEN 3001 AND 4000 THEN 'B'
        WHEN SAL BETWEEN 4001 AND 5000 THEN 'A'
    END ��� FROM EMP;


SELECT EMPNO,ENAME,SAL,
    DECODE(TRUNC((SAL-1)/1000) ,0, 'E' ,1, 'D', 2, 'C', 3, 'B','A') ���
FROM EMP;

--DECODE( ������, ��1, ���1, ��2, ���2,...., ��N,���N, �׿� ���)

