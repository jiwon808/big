--[ VI ] Sub Query: QUERY안에 QUERY가 내포
--서브쿼리 (1) 단일행 서브쿼리 (서브쿼리 결과가 단일행) = > >= < <= != <>
    --    (2) 다중행 서브쿼리 (서브쿼리 결과가 2행 이상)  IN ANY ALL EXISTS

--SCOTT이 근무하는 부서이름 출력 
SELECT DNAME   
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
    AND ENAME = 'SCOTT';
    
SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'; --서브쿼리

SELECT DNAME 
    FROM DEPT
    WHERE DEPTNO= (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'); --메인쿼리  (서브쿼리 먼저 실행하고, 메인쿼리 실행)   --F9 블록 잡은 부분 실행

-- JOB이 'MANAGER'인 사람의 부서이름    
SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'; --다중행 서브쿼리
SELECT DNAME FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER'); --메인  -- 결과가 여러행이면 = 안됨. 대신 IN

-- ★2. 단일행 서브쿼리
-- 회사에서 '급여를 제일 많이 받는' 사람의 '이름과 급여' 
SELECT MAX(SAL) FROM EMP; -- 서브쿼리(단일행)
SELECT ENAME, SAL FROM EMP
    WHERE SAL=(SELECT MAX(SAL) FROM EMP); -- 메인쿼리

--SCOTT과 '같은 부서번호'인 사람이름
        --SCOTT이 몇번에 있지? 그럼 그 번호의 부서 '사람이름' 뿌려라
    SELECT E1.ENAME FROM EMP
    WHERE E1.ENAME = 'SCOTT' AND E1.DEPTNO = E2.DEPTNO 
    AND E2.NAME != 'SCOTT';
        
SELECT DEPTNO FROM EMP WHERE ENAME= 'SCOTT'; --서브쿼리
SELECT ENAME FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME= 'SCOTT')
        AND ENAME!='SCOTT';

--SCOTT과 같은 근무지인 사람이름 (50번 DALLAS 부서 홍길동 입력 후)
INSERT INTO DEPT VALUES (50, '전산회계', 'DALLAS');
INSERT INTO EMP(EMPNO, ENAME, DEPTNO) VALUES (9999, '홍', 50);  --DEPTNO 는 같아
SELECT LOC FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
    AND ENAME = 'SCOTT'; --서브쿼리
SELECT ENAME FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND LOC =(SELECT LOC FROM DEPT D, EMP E WHERE D.DEPTNO = E.DEPTNO  AND ENAME = 'SCOTT')
    AND ENAME!= 'SCOTT';
--'SCOTT과 같은 부서에 근무'하는 사람들의 '급여 합'을 출력 
SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'; --서브쿼리
SELECT SUM(SAL) FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'); --메인쿼리 
--SCOTT과 '동일한 JOB'을 가진 사원의 모든 정보를 출력
SELECT * FROM EMP
    WHERE JOB =(SELECT JOB FROM EMP WHERE ENAME = 'SCOTT');
--DALLAS에서 근무하는 사원의 이름, 부서번호를 출력
ROLLBACK; --DML명령어 취소      (여기서 위에 INSERT 2개한거 취소)
SELECT ENAME, DEPTNO FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
-- SALES(DNAME) 부서에 근무하는 직원의 이름, 급여를 출력
SELECT ENAME, SAL FROM EMP 
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
-- 'KING'이 직속상사인 사원의 이름과 급여 
SELECT ENAME, SAL FROM EMP
    WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME='KING'); --MGR는 여기서 매니저번호
-- '평균급여' 이하로 받는 '사원의 이름, 급여'를 출력 
SELECT ENAME, SAL FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) FROM EMP);
-- SCOTT과 'JOB과 부서번호가 같은' '직원의 모든 필드' 출력 (다중열 서브쿼리)
SELECT * FROM EMP
    WHERE (JOB,DEPTNO)=(SELECT JOB, DEPTNO FROM EMP
                        WHERE ENAME = 'SCOTT'); 
 -- ★ 총 연습문제
--1. 사원테이블에서 가장 먼저 입사한 사람의 이름, 급여, 입사일
SELECT ENAME, SAL, HIREDATE FROM EMP
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP); 

-- 2. 회사에서 가장 급여가 적은 사람의 이름, 급여
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL =(SELECT MIN(SAL)FROM EMP);
    
-- 3. 회사 평균보다 급여를 많이 받는 사람의 이름, 급여, 부서코드
SELECT ENAME, SAL, DEPTNO
    FROM EMP
    WHERE SAL >(SELECT AVG(SAL)FROM EMP);
    
--4. 회사 평균 이하의 급여를 받는 사람의 이름, 급여, 부서명
SELECT ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO  
    AND SAL <=(SELECT AVG(SAL)FROM EMP);

--5. SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급
SELECT ENAME, SAL, HIREDATE, GRADE
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
    AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT');

--6. 5번(SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급)에 부서명 추가하고 
    --급여가 큰 순 정렬
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME
    FROM DEPT D, EMP E, SALGRADE
    WHERE D.DEPTNO= E.DEPTNO
    AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME = 'SCOTT')
    AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;

--7. 사원테이블에서 BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여를 검색
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME='BLAKE');


--8. 사원테이블에서 MILLER보다 늦게 입사한 사원의 사번, 이름, 입사일을 검색하시오
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME='MILLER');


--9. 사원테이블에서 사원전체 평균 급여보다 급여가 많은 사원들의 사번, 이름, 급여를 검색
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL>(SELECT AVG(SAL)FROM EMP);


--10. 사원테이블에서 CLARK와 같은 부서며, 사번이 7698인 직원의 급여보다 
        -- 많은 급여를 받는 사원들의 사번, 이름, 급여 검색
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL>(SELECT SAL FROM EMP WHERE EMPNO = 7698)
    AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK');
                        
                        
--11.  응용심화. 사원테이블에서 CLARK와 같은 부서명이며, 사번이 7698인 직원의 급여보다 
    --  많은 급여를 받는 사원들의 사번, 이름, 급여 검색
SELECT DNAME 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
    AND ENAME = 'CLARK'; --서브쿼리2

SELECT EMPNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
        AND SAL>(SELECT SAL FROM EMP WHERE EMPNO = 7698)
        AND DNAME = (SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'CLARK');

--12.  사원 테이블에서 BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, HIREDATE
    FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE');

--13.  사원 테이블에서 평균 급여 이상을 받는 모든 종업원에 대해서 사원번호와 이름을 출력
        --(단 급여가 많은 순으로 출력하여라.)
SELECT EMPNO, ENAME
    FROM EMP
    WHERE SAL>=(SELECT AVG(SAL) FROM EMP)
    ORDER BY SAL DESC;


 -- ★ 3. 다중행 서브쿼리;  IN, ALL, ANY=SOME, EXISTS
 -- (1) IN; 서브쿼리 결과 중 하나라도 일치하면 출력 
 -- '부서별'로 '입사일이 가장 늦은' 사람의 '부서번호,이름, 입사일' 출력
 SELECT DEPTNO, MAX(HIREDATE) FROM EMP
    GROUP BY DEPTNO; --서브
SELECT EMPNO, ENAME, HIREDATE FROM EMP
    WHERE (DEPTNO,HIREDATE) IN ( SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO); 
--'급여가 3000이상' 받는 사원이 '소속된 부서'에서 근무하는 '사원들의 모든 정보' 
SELECT * FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);
--(2)ALL
--30번 부서 최대 급여보다  급여를 많이 받는 사람의 정보 
SELECT * FROM EMP
    WHERE SAL>(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP
    WHERE SAL> ALL(SELECT SAL FROM EMP WHERE DEPTNO=30); --다중행이기 때문에 > 쓸 수 없다.   대신 ALL을 추가하면 가능   ALL== 다중에 서브쿼리결과들 모두 만족
--(3) ANY = SOME
SELECT * FROM EMP
    WHERE SAL> ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);  -- 최소값 보다 만 크면 ANY에 다 들어가 
SELECT * FROM EMP
    WHERE SAL >(SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); -- 위 제시문과 같음 
--(4) EXISTS; 서브쿼리 결과가 존재하면 참
-- 직속부하가 있는 지원들의 사번, 이름, 급여 출력    --나의 사번이 누군가의 mgr로 존재하면  내가 말단사원이 아니다(직속부하 직원이 있다)   
SELECT EMPNO, ENAME, SAL 
    FROM EMP MANAGER
    WHERE EXISTS (SELECT*FROM EMP WHERE MANAGER.EMPNO = MGR);
    
-- 말단사원의 모든 필드 정보 출력
SELECT * FROM EMP MANAGER
    WHERE NOT EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR);
    
--탄탄다지기
--'부서별' '가장 급여를 많이' 받는 '사원의 사번, 이름, 급여, 부서번호'
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE(DEPTNO,SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);
 
 
--	직급(JOB)이 MANAGER인 사람의 '속한 부서'의 '부서 번호와 부서명과 지역'을 출력(IN)
SELECT DEPTNO,DNAME,LOC FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB ='MANAGER');
	
--	'급여가 3000이상인 사람들 '중' 연봉 등급을 나누어서 해당 등급별 최고 연봉을 받는' '사람들의 사번, 이름, 직업, 입사일, 급여, 급여등급'을 출력
    
SELECT * FROM SALGRADE; ---3000이상은 4등급과 5등급뿐

SELECT GRADE, MAX(SAL) FROM EMP,SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL 
        AND SAL>=3000
        GROUP BY GRADE; --다중행 서브쿼리
        
SELECT EMPNO, ENAME, JOB, HIREDATE,SAL,GRADE FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
    AND (GRADE,SAL) IN (SELECT GRADE, MAX(SAL) FROM EMP,SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL 
        AND SAL>=3000
        GROUP BY GRADE); --메인쿼리


    
--	응용심화 : 입사일 분기별로 가장 높은 연봉을 받는 사람들의 분기, 사번, 이름, JOB, 상사사번, 입사일, 급여, 상여를 출력하세요


SELECT HIREDATE, CEIL(EXTRACT(MONTH FROM HIREDATE)/3) QUARTER 
    FROM EMP;
    
SELECT HIREDATE, CEIL(TO_CHAR(HIREDATE, 'MM')/3) QUARTER FROM EMP;

SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) QUARTER, MAX(SAL) 
    FROM EMP
    GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3);-- 서브쿼리(분기별 최고연봉)
    
    
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) QUARTER, 
        EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM 
    FROM EMP
    WHERE (CEIL(EXTRACT(MONTH FROM HIREDATE)/3), SAL) IN
        (SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3), MAX(SAL) 
            FROM EMP
            GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3))
    ORDER BY QUARTER;
	
--	SALESMAN 모든 사원들 보다 급여를 많이 받는 사원들의 '이름과 급여와 직급(담당 업무')를 출력하되 영업 사원은 출력하지 않는다.(ALL이용)

SELECT ENAME,SAL,JOB FROM EMP
    WHERE SAL>ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
SELECT ENAME,SAL,JOB FROM EMP
    WHERE SAL>(SELECT MAX(SAL)FROM EMP WHERE JOB='SALESMAN')
    
    
--	SALESMAN 일부 어떤 한 사원보다 급여를 많이 받는 '사원들의 이름과 급여와 직급(담당 업무)를' 출력하되 '영업 사원'은 출력(ANY)
SELECT ENAME, SAL, JOB FROM EMP
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');

SELECT ENAME, SAL, JOB FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN');    
    
    
    
--	'급여가 3000미만인 사람 중'에 '가장 최근에 입사한 사람'의 사원번호와 이름, 급여, 입사일을 출력
SELECT EMPNO, ENAME, SAL, HIREDATE FROM EMP
    WHERE HIREDATE >= ALL ( SELECT HIREDATE FROM EMP WHERE SAL<3000);

SELECT EMPNO, ENAME, SAL, HIREDATE FROM EMP
    WHERE HIREDATE =(SELECT MAX(HIREDATE)FROM EMP WHERE SAL<3000);
   

--	직급이‘SALESMAN’인 사원이 받는 급여의 '최소 급여보다 많이 받'는 '사원들의 이름, 급여, 직급, 부서번호를 출력'하되 부서번호가 '20번인 사원은 제외'한다(ANY 연산자 이용)

SELECT ENAME, SAL, JOB, DEPTNO
    FROM EMP
    WHERE SAL > ANY (SELECT SAL FROM EMP WHERE JOB='SALESMAN')
    AND DEPTNO!=20;


SELECT ENAME, SAL, JOB, DEPTNO 
    FROM EMP 
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN') 
    AND DEPTNO != 20;

 

 
-- 여기서부터는 다중행서브쿼리, 이전은 단일행서브쿼리
-- 14. 사원 테이블에서 '이름에 “T”가 있는 사원'이 근무하는 '부서'에서 근무하는 모든 종업원에 대해
    --'사원 번호,이름,급여'를 출력하는 SELECT문을 작성하시오. 단 '사원번호 순'으로 출력하여라.

SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%')   
    ORDER BY EMPNO;


-- 15. 사원 테이블에서 부서 위치가 Dallas인 모든 종업원에 대해 '이름,업무,급여'를 출력
SELECT ENAME,JOB,SAL FROM EMP 
    WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE INITCAP(LOC)='Dallas');

SELECT ENAME, JOB, SAL 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND INITCAP(LOC)='Dallas';

-- 16. EMP 테이블에서 'King에게 보고'하는 '모든 사원의 이름과 급여'를 출력하는 SELECT문
SELECT ENAME, SAL FROM EMP 
    WHERE MGR =(SELECT EMPNO FROM EMP WHERE INITCAP(ENAME)='King');      --괄호안에는 KING의 사번         --상사의 사번 = King의 사번이면    그 사원이 King의 직속 부하 사원

SELCT ENAME, SAL FROM EMP W
    WHERE EXISTS(SELECT * FROM EMP WHERE EMPNO=W.MGR AND INITCAP(ENAME)='King')

-- 17. 사원 테이블에서 SALES부서 '사원의 이름,업무'를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');    --subquery이용
    
    -- join을 이용하면 아래와 같음 -- 
SELECT ENAME, JOB FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND DNAME='SALES';


-- 18. 사원 테이블에서 월급이 '부서 30의 최저 월급보다 높은 사원'을 출력
SELECT SAL FROM EMP
    WHERE SAL>(SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30); 

SELECT * FROM EMP 
    WHERE SAL > ANY (SELECT SAL  FROM EMP WHERE DEPTNO=30);


-- 19.' 부서 10에서 부서 30의 사원'과 '같은 업무'를 맡고 있는 '사원의 이름과 업무'를 출력
SELECT ENAME, JOB FROM EMP
    WHERE DEPTNO =10 
    AND JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = 30);


-- 20. 사원 테이블에서 FORD와 '업무도 월급'도 같은 사원의 모든 정보를 출력
SELECT * FROM EMP
    WHERE (JOB,SAL) IN (SELECT JOB,SAL FROM EMP WHERE ENAME='FORD')
    AND ENAME != 'FORD';


-- 21. 이름이 JONES인 직원의 JOB과 같거나 
    --'월급이 FORD 월급 이상'인 사원의 정보를 '이름,업무,부서번호,급여'를 출력하는 SELECT문을 작성.
    -- 단, '업무별 알파벳 순, 월급이 많은 순'으로 출력하여라.
SELECT ENAME, JOB, DEPTNO, SAL FROM EMP
    WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME = 'FORD') 
    OR JOB =(SELECT JOB FROM EMP WHERE ENAME = 'JONES') 
    ORDER BY JOB, SAL DESC;


-- 22. 사원 테이블에서 SCOTT 또는 WARD와 월급이 같은 '사원의 정보를 이름,업무,급여'를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB, SAL FROM EMP
    WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT' OR ENAME='WARD')
    AND ENAME NOT IN('SCOTT','WARD');

SELECT ENAME, JOB, SAL FROM EMP
    WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN ('SCOTT','WARD'))
    AND ENAME NOT IN('SCOTT','WARD');


-- 23. 사원 테이블에서 'CHICAGO에서 근무'하는 사원과 '같은 업무'를 하는 '사원들의 이름,업무'를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB FROM EMP 
    WHERE JOB IN (SELECT JOB FROM EMP E, DEPT D 
                    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO');

-- 24. 사원 테이블에서 '부서별로 월급'이 '평균 월급'보다 높은 사원을 '사원번호,이름,급여'를 출력하는 SELECT문을 작성하시오.
SELECT EMPNO, ENAME, SAL, DEPTNO, (SELECT AVG(SAL)FROM EMP WHERE DEPTNO= E.DEPTNO)  
    FROM EMP E   --그사람의 부서별 평균
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO); 


-- 25. 사원 테이블에서 '업무별로 월급'이 평균 월급보다 낮은 사원을 '부서번호,이름,급여'를 출력하는 SELECT문을 작성하시오.
SELECT DEPTNO,ENAME, SAL,(SELECT AVG(SAL)FROM EMP WHERE JOB=E.JOB)
    FROM EMP E
    WHERE SAL < (SELECT AVG(SAL) FROM EMP WHERE JOB=E.JOB); -- SMITH를 읽었다 그럼 job= smith의 job


-- 26. 사원 테이블에서 적어도 한 명 이상으로부터 보고를 받을 수 있는 사원을 '업무,이름,사원번호,부서번호'를 출력(단, '부서번호 순으로 오름차순' 정렬)
SELECT JOB,ENAME, EMPNO,DEPTNO FROM EMP MANAGER -- 한줄 한줄 출력    FROM절을 먼저 출력, 그 다음 WHERE절 이 판단해서 출력  / 있으면 뿌리고 없으면 안뿌려
    WHERE EXISTS (SELECT * FROM EMP W WHERE MANAGER.EMPNO=W.MGR) --나의 EMPNO가 MGR이면 누군가의 MANAGER이다라는 것을 의미.  만약에 나의 EMPNO는 누군가의 MGR가 아니면 나는 부하 직원이 없다는 것을 의미
    ORDER BY DEPTNO;
    
SELECT JOB, ENAME, EMPNO, DEPTNO FROM EMP
    WHERE EMPNO IN (SELECT DISTINCT MGR FROM EMP)
    ORDER BY DEPTNO;


-- 27. 사원 테이블에서 말단 사원의 사원번호, 이름, 업무, 부서번호를 출력하는 SELECT문을 작성하시오.
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP MANAGER
    WHERE NOT EXISTS( SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR);



SELECT M.EMPNO, M.ENAME, M.JOB, M.DEPTNO FROM EMP W, EMP M 
    WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL; 
    
-- 서브쿼리 결과가 NULL이 있어 아래의 질의는 안 됨
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
    WHERE EMPNO NOT IN (SELECT MGR FROM EMP);  --왜 null이 들어가면 안되는지*********
    
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
    WHERE EMPNO!=7902 AND EMPNO!=NULL;  --(1)EMPNO IN (7999,NULL)       
                                            --means EMPNO=7999 OR EMPNO= NULL  그러나 EMPNO= NULL이렇게쓰면 안됨 무조건 False
                                        -- (2)EMPNO NOT IN (7999,NULL) 
                                            --means EMPNO!=7999 AND EMPNO!=NULL 그러면 EMPNO!=NULL 이렇게 쓰면 안됨. 무조건 False 따라서
                                        -- 이렇게 써야 맞다  'SELECT MGR FROM EMP WHERE MGR IS NOT NULL'
                                                                    
    
--그래서 아래와 같이 함
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
    WHERE EMPNO NOT IN (SELECT MGR FROM EMP WHERE MGR IS NOT NULL);    


