--[XI] 인덱스 : 조회를 빠르게 하는 인덱스 
SELECT * FROM USER_INDEXES; --딕셔너리뷰에 SCOTT가 소유한 인텍스 정보 
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP; 
SELECT * FROM EMP01;
INSERT INTO EMP01 SELECT * FROM EMP01; --1번 (28)  2번 실행 56행
SELECT COUNT(*) FROM EMP01;
INSERT INTO EMP01 SELECT * FROM EMP01; -- 12번 22만행
SELECT TO_CHAR(COUNT(*),'9,999,999') FROM EMP01;
INSERT INTO EMP01(EMPNO, ENAME, DEPTNO) VALUES (1111,'HONG',40);
INSERT INTO EMP01 SELECT * FROM EMP01; --3번180만개
DESC EMP01;
SELECT * FROM EMP01 WHERE ENAME = 'HONG'; --0.002초
--인덱스 생성후 빠른 조회
CREATE INDEX IDX_EMP01_ENAME ON EMP01(ENAME);
SELECT * FROM EMP01 WHERE ENAME = 'HONG'; --0.001초 
SELECT * FROM USER_INDEXES;
DROP INDEX IDX_EMP01_ENAME;
