SELECT * FROM DEPT WHERE DEPTNO = 60;
SELECT COUNT (*) FROM DEPT WHERE DEPTNO = 60;

INSERT INTO DEPT VALUES(60,'MARKETING','INCHON');
SELECT * FROM DEPT WHERE DNAME= 'SALES';
COMMIT;
SELECT * FROM DEPT;
DELETE FROM DEPT WHERE DEPTNO>40;