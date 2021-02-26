---[|||] JOIN: 데이블을 2개 이상 연결하여 검색 
SELECT * FROM EMP WHERE ENAME = 'SCOTT';  --부서번호(DEPNO):20
SELECT * FROM DEPT;
-- CROSS JOIN ( FROM 절에 테이블 2개 이상)
SELECT * FROM EMP,DEPT WHERE ENAME = 'SCOTT';  -- DEPT4행. EMPT1행.  --> CROSS JOIN하면 4행껄로나와
-- EQUI JOIN (공통 필드인 DEPTNO값이 일치되는 조건만 JOIN)
SELECT * FROM EMP, DEPT 
    WHERE ENAME = 'SCOTT' AND EMP.DEPTNO = DEPT.DEPTNO;

SELECT * FROM EMP, DEPT 
    WHERE EMP.DEPTNO = DEPT.DEPTNO;
-- 모든 사원의 이름, 부서명, 부서번호
SELECT ENAME "NAME",DNAME,E.DEPTNO FROM EMP E,DEPT D    --Alias선언했으면 다음줄에는 E  D를 사용해야
    WHERE E.DEPTNO= D.DEPTNO;
SELECT E.*, DNAME, LOC
    FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
--사번, 이름, 부서번호, 부서이름, 근무지 
SELECT EMPNO, ENAME, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
-- 급여 2000이상인 직원만 이름, 업무, 급여, 부서명, 근무지 필드 출력 
SELECT ENAME, JOB, SAL, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.SAL>2000;
-- LOC이 CHICAGO인 사람의 이름, 업무, 부서명, 근무지 필드 출력
SELECT ENAME, JOB, DNAME, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND D.LOC='CHICAGO';
-- 부서번호가 10 또는 20인 사원의 이름, 업무, 근무지 출력(급여순 정렬)
SELECT ENAME, JOB, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND D.DEPTNO IN (10,20)
    ORDER BY SAL;
-- 이름, 급여, 상여(COMM),연봉(급여+COMM)*12), 부서명, 근무지 
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 연봉, DNAME, LOC    --주의: NVL(COM,0)
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
-- TO_CHAR(날짜형, 'YY')
-- TO_CHAT(숫자형, '99,999')
-- JOB이 salesman 또는 manager인 사원만 (연봉이 큰순 정렬)                 --주의:SAL은 월급이지 연봉x    연봉은 SAL+NVL(COMM,0)
SELECT ENAME, SAL, COMM, (SAL+NVL(COMM,0))*12 연봉, DNAME, LOC  
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
        AND UPPER(JOB) IN ('SALESMAN','MANAGER')
    ORDER BY 연봉 DESC; 
-- COMM이 NULL이고 급여가 1200이상인 사원의 
-- 이름, 급여, 입사일, 부서번호, 부서명(부서명순, 급여큰순 정렬)
SELECT ENAME, SAL, HIREDATE, E.DEPTNO,DNAME        --주의DEPTNO는 E  D에 다 있기때문에  꼭 E.DEPTNO  혹은 D.DEPTNO로써야
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND COMM IS NULL AND SAL>=1200
    ORDER BY DNAME, SAL DESC;
--EQUI JOIN 예제 

--	뉴욕에서 근무하는 사원의 이름과 급여를 출력하시오
SELECT ENAME,SAL FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';

--	ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오
SELECT ENAME, HIREDATE FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND DNAME = 'ACCOUNTING';
 
--	직급이 MANAGER인 사원의 이름, 부서명을 출력하시오
SELECT ENAME,DNAME FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER';

--	Comm이 null이 아닌 사원의 이름, 급여, 부서코드, 근무지를 출력하시오.
SELECT ENAME, SAL,E.DEPTNO,LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;

--★★NON-EQUI JOIN★★★★★★★★★★★★★★★★★★★★
SELECT ENAME, SAL FROM EMP WHERE ENAME='SCOTT';
SELECT * FROM SALGRADE;
SELECT ENAME, SAL,GRADE,LOSAL, HISAL 
    FROM EMP, SALGRADE 
    WHERE ENAME = 'SCOTT' AND SAL BETWEEN LOSAL AND HISAL; -- SAL BETWEEN LOSAL AND HISAL;   4등급만 나오게  (여기서는 NON EQUI JOIN)
--모든 사원의 사번, 이름, JOB, 상사사번, 급이, 급여등급(1등급,2등급)..       -- || '연결'이라는 연산자  Grade 
SELECT EMPNO, ENAME, JOB, MGR, SAL, GRADE||'등급'    
    FROM EMP, SALGRADE -- || '연결'이라는 연산자  Grade 
    WHERE SAL BETWEEN LOSAL AND HISAL;

--탄탄다지기 문제
--	Comm이 null이 아닌 사원의 이름, 급여, 등급, 부서번호, 부서이름, 근무지를 출력하시오.
SELECT ENAME,SAL,GRADE,E.DEPTNO,DNAME,LOC       --주의 DEPTNO는 E,D에 다 있기때문에  E.DEPTNO로 써야
    FRP, EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND
        COMM IS NOT NULL;

--	이름, 급여, 입사일, 급여등급
SELECT ENAME, SAL, HIREDATE,GRADE FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
    
--	이름, 급여, 입사일, 급여등급, 부서명, 근무지
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME, LOC FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
--	이름, 급여, 등급, 부서코드, 근무지. 단 comm 이 null아닌 경우
SELECT ENAME, SAL, GRADE, E.DEPTNO, LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
        AND COMM IS NOT NULL;
--	이름, 급여, 급여등급, 연봉, 부서명, 부서별 출력, 부서가 같으면 연봉순. 연봉=(sal+comm)*12 comm이 null이면 0
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM,0))*12 연봉, DNAME
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY DNAME, 연봉; -- 주의 여기다 SAL쓰면 x  연봉을 써야   (위 아래 두 군데 체크)
--	이름, 업무, 급여, 등급, 부서코드, 부서명 출력. 급여가 1000~3000사이. 정렬조건 : 부서별, 부서같으면 업무별, 업무같으면 급여 큰순
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME
FROM  EMP E, DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL 
    AND SAL>=1000 AND SAL<=3000
    ORDER BY JOB, SAL DESC;
--WHERE SAL BETWEEN '1000' AND '3000'

--	이름, 급여, 등급, 입사일, 근무지. 81년에 입사한 사람. 등급 큰순
SELECT ENAME, SAL, HIREDATE, LOC 
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL   --EQUI.JOIN    NON-EQUI JOIN
        AND TO_CHAR( HIREDATE,'YY') = '81'     
    ORDER BY GRADE DESC;
    
--★★SELF JOIN★★★★★★★★★★★★★★★★★★★
SELECT W.EMPNO,W.ENAME, W.MGR,M.ENAME MANAGERNAME    --원래 W.MGR , M.EMPNO  둘이 같으니 하나 빼
    FROM EMP W, EMP M
    WHERE W.ENAME='SMITH' 
    AND W.MGR = M.EMPNO;
SELECT WORKER.EMPNO, WORKER.ENAME, MANAGER.ENAME
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR=MANAGER.EMPNO;  --EMPNO에 NULL값이 없으므로 13명 
--"SMITH의 상사는 FORD다" 출력 
SELECT W.ENAME||'의 상사는 ' ||M.ENAME||'다' 
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;
-- SELF JOIN 탄탄다지기 예제
-- ex1.상사의 이름이 'KING인 사원들의 이름과 JOB출력    --SELF JOIN  테이블에 '상사의 이름' 없음. 
SELECT W.ENAME, W.JOB 
    FROM EMP W, EMP M 
    WHERE W.MGR = M.EMPNO   --13명 다 나옴
    AND M.ENAME = 'KING';

-- ex2. SCOTT과 동일한 부서번호(20)에서 근무하는 사람의 이름 출력 --SELF JOIN, EQUI JOIN    출력결과:SMITH,JONES,ADAMS,FORD
SELECT E2.ENAME  --원래 E1.ENAME, E1.DEPTNO, E2.DEPTNO있음. 빼도되
    FROM EMP E1, EMP E2 
    WHERE E1.ENAME='SCOTT' 
    AND E1.DEPTNO = E2.DEPTNO
    AND E2.ENAME!='SCOTT';
    
-- ex3. SCOTT과 동일한 근무지(DALLAS)에서 근무하는 사람의 이름 출력  --SELF JOIN, EQUI JOIN   출력결과:FORD,ADAMS,JONES,SMITH,HONG
SELECT E1.ENAME, D1.LOC 
    FROM EMP E1, DEPT D1
    WHERE E1.DEPTNO=D1.DEPTNO AND E1.ENAME='SCOTT'; --1번  1줄
SELECT E2.ENAME,D2.LOC       
    FROM EMP E2,DEPTD2
    WHERE E2.DEPTNO=D2.DEPTNO --  2번 15줄
    
SELECT E2.ENAME       --원래 E1.ENAME, D1.LOC , E2.ENAME,D2.LOC  
    FROM EMP E1, DEPT D1, EMP E2,DEPT D2
    WHERE E1.DEPTNO=D1.DEPTNO AND E1.ENAME='SCOTT' 
        AND E2.DEPTNO=D2.DEPTNO
        AND D1.LOC=D2.LOC AND E2.ENAME!='SCOTT'; --1번과 2번 
INSERT INTO DEPT VALUES (50,'IT','DALLAS');
INSERT INTO EMP (EMPNO,ENAME,DEPTNO)
    VALUES(9999,'HONG',50);
ROLLBACK; -- DML(데이터 조작어)를 취소시킴  
SELECT * FROM DEPT;
SELECT * FROM EMP;





--★★OUTER JOIN 조인 조건에 만족하지 않은 행까지 나타나게★★★★★★★★★★★★★★★★★★★
SELECT W.EMPNO, W.ENAME, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);      --(+)하면 OUTERJOIN
 SELECT W.EMPNO, W.ENAME, NVL (M.ENAME,'--CEO--')    --ENAMe이 문자이므로, 문자형을 써야
    FROM EMP W, EMP M
    WHERE W.MGR=M.EMPNO(+);     

 SELECT W.EMPNO, W.ENAME, NVL (M.ENAME,'--CEO--')    --ENAMe이 문자이므로, 문자형을 써야
    FROM EMP W, EMP M
    WHERE W.MGR(+)=M.EMPNO    -- EMPNO에는 있으나 MGR에 없는 아이
    AND W.EMPNO IS NULL;      -- (내가 누군가의 상사가 아니면 이렇게 ==말단 사원)

SELECT * FROM EMP; --14행
SELECT * FROM DEPT; --4행(10,20,30,40)
SELECT E.*, DNAME FROM EMP E, DEPT D
    WHERE E.DEPTNO(+)=D.DEPTNO;            --emp에는 40이 없다. 따라서 실행하면 없음          없어서 안나온 애 뒤에 +

--Outer join탄탄다지기
--SMITH의 매니저는 FORD입니다 / KING의 매니저는 없습니다.
SELECT W.ENAME || '의 매니저는' || NVL(M.ENAME, '무') || '입니다'
    FROM EMP W, EMP M 
    WHERE W.E = M.EMPNO(+);

SELECT * FROM EMP;


--총 연습문제
-- ★ <연습문제> PART1
--1. 이름, 직속상사
SELECT W.ENAME,  M.ENAME MANAGER  --원래 W.MGR , M.EMPNO  둘이 같으니 하나 빼
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--2. 이름, 급여, 업무, 직속상사
SELECT W.ENAME, W.SAL, W.JOB, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--3. 이름, 급여, 업무, 직속상사. (상사가 없는 직원까지 전체 직원 다 출력.
    --상사가 없을 시 '없음'으로 출력)
SELECT W.ENAME, W.SAL, W.JOB, NVL(M.ENAME,'없음') MANAGER
    FROM EMP W, EMP M
    WHERE  W.MGR = M.EMPNO(+);

--4. 이름, 급여, 부서명, 직속상사명
SELECT W.ENAME, W.SAL,D.DNAME,  M.ENAME MANAGER
    FROM EMP W, EMP M, DEPT D
    WHERE W.DEPTNO = D.DEPTNO 
    AND W.MGR = M.EMPNO; 

--5. 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명, (상사가 없는 직원까지 전체 직원 다 출력)
SELECT W.ENAME, W.SAL, D.DEPTNO, D.DNAME, D.LOC,M.ENAME 
    FROM EMP W, EMP M, DEPT D
    WHERE  W.MGR = M.EMPNO(+)
    AND D.DEPTNO = W.DEPTNO ;

--6. 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람       --등급 NON EQUI JOIN
SELECT W.ENAME, W.SAL, GRADE, D.DNAME, M.ENAME MANAGER
FROM  EMP W, EMP M, DEPT D, SALGRADE
WHERE W.MGR = M.EMPNO(+)
    AND D.DEPTNO = W.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL 
    AND W.SAL>=2000;

--7. 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)
SELECT W.ENAME, W.SAL, GRADE, D.DNAME, NVL(M.ENAME,'없음') 
FROM EMP W, EMP M, DEPT D, SALGRADE 
WHERE W.MGR = M.EMPNO(+)
    AND D.DEPTNO = W.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL 
ORDER BY D.DNAME;

--8. 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(급여+comm)*12 단 comm이 null이면 0
SELECT W.ENAME, W.SAL, GRADE, D.DNAME, W.SAL*12+NVL(W.COMM,0) 연봉,M.ENAME
FROM EMP W, EMP M, DEPT D, SALGRADE 
WHERE W.MGR = M.EMPNO
    AND D.DEPTNO = W.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL;
    

--9. 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬
SELECT W.ENAME, W.SAL*12+NVL(W.COMM,0) 연봉, GRADE, D.DNAME, M.ENAME
FROM EMP W, EMP M, DEPT D, SALGRADE 
WHERE W.MGR = M.EMPNO
    AND D.DEPTNO = W.DEPTNO
    AND W.SAL BETWEEN LOSAL AND HISAL
ORDER BY D.DNAME, W.SAL DESC; 



--  PART2
--1.EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT  W.ENAME, D.DEPTNO,D.DNAME       
FROM EMP W, DEPT D
WHERE D.DEPTNO = W.DEPTNO;


--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력
SELECT ENAME, JOB, SAL,D.DNAME       
FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO
    AND LOC= 'NEW YORK';

--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
SELECT ENAME, DNAME, LOC       
    FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
        AND E.COMM IS NOT NULL AND COMM!=0;

--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
SELECT ENAME,JOB, DNAME, LOC
FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO
    AND ENAME LIKE '%L%';


--5. 사번, 사원명, 부서코드, 부서명을 검색하라. 사원명기준으로 오름차순정열
SELECT EMPNO,ENAME,D.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
ORDER BY ENAME;


--6. 사번, 사원명, 급여, 부서명을 검색하라. 
    --단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정열하시오
 SELECT EMPNO,ENAME,SAL,DEPTNO
    FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
    ORDER BY SAL DESC;
    
    
--7. 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
-- 사원에 대하여 사번을 기준으로 오름차순으로 정열하시오.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE D.DEPTNO = E.DEPTNO
    AND JOB= 'MANAGER'
    AND SAL >=2500
ORDER BY EMPNO;

--8. 사번, 사원명, 업무, 급여, 등급을 검색하시오. 단, 급여기준 내림차순으로 정렬하시오
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP E, SALGRADE
    WHERE  SAL BETWEEN LOSAL AND HISAL
ORDER BY E.SAL DESC;

--9. 사원테이블에서 사원명, 사원의 상사를 검색하시오(상사가 없는 직원까지 전체)
SELECT W.ENAME 사원명, M.ENAME MANAGER
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    
--10. 사원명, 상사명, 상사의 상사명을 검색하시오
SELECT W.ENAME 사원, M.ENAME 상사,M.ENAME 상사의 상사
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO
    AND M.MGR = MM.EMPNO;


--11. 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오
SELECT W.ENAME 사원, NVL(M.ENAME,'')상사, NVL (MM.ENAME,'') "상사의 상사"  --여기서 "상사의 상사"는 중간에 sapce가 있기때문에 "" 써야한다
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO(+)
    AND M.MGR = MM.EMPNO(+);
