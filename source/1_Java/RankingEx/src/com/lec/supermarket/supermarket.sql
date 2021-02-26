DROP TABLE CUSTOMER;
-- DROP TABLE CUSTOMER CASCADE CONSTRAINTS; (추천하지는 않음)
DROP TABLE CUS_LEVEL;
DROP SEQUENCE CUSTOMER_SEQ;

-- 테이블 생성 
CREATE TABLE CUS_LEVEL(
    levelNO    NUMBER(1) PRIMARY KEY,
    levelNAME  VARCHAR2(20),
    LOW        NUMBER(9),
    HIGH       NUMBER(9)
);

CREATE TABLE CUSTOMER(
   cID      NUMBER(6)   PRIMARY KEY,
   cTEL     VARCHAR(20) NOT NULL,
   cNAME    VARCHAR(30) NOT NULL,
   cPOINT   NUMBER(9)   DEFAULT 1000,
   cAMOUNT  NUMBER(9)   DEFAULT 0,
   levelNO  NUMBER(1)   DEFAULT 1 REFERENCES CUS_LEVEL(levelNo)
);

CREATE SEQUENCE CUSTOMER_SEQ
    MAXVALUE 999999
    NOCYCLE
    NOCACHE;

-- 데미테이터 INSERT 
INSERT INTO CUS_LEVEL VALUES (1, 'NORMAL',0,999999);
INSERT INTO CUS_LEVEL VALUES (2, 'SILVER',1000000,1999999);
INSERT INTO CUS_LEVEL VALUES (3, 'GOLD',2000000,2999999);
INSERT INTO CUS_LEVEL VALUES (4, 'VIP',3000000,4999999);
INSERT INTO CUS_LEVEL VALUES (5, 'VVIP',5000000,999999999);

SELECT * FROM CUSTOMER;
SELECT * FROM CUS_LEVEL;

INSERT INTO CUSTOMER (cID, cTEL, cNAME) VALUES (CUSTOMER_SEQ.NEXTVAL,'010-999-9999' ,'홍길동'); --돈쓰면 LEVELUP
INSERT INTO CUSTOMER VALUES (CUSTOMER_SEQ.NEXTVAL, '010-8888-9999','김길동',1000, 5000000,5);  -- 이미 최고치 따라서 돈써도 lEVELUP안됨
COMMIT;


-- 0. levelNAMES(레벨이름들):  public Vector<String> LevelNames()
SELECT LEVELNAME FROM CUS_LEVEL 
    ORDER BY LEVELNO; 

-- 1. cId로 검색 : public CustomerDto cIdGetCustomers(String cId)   
    --아이디 한명밖에 없어서 arraylist사용할 필요없음   --실행화면에 cID로 검색하면 ' cID, cTEL,cName, cPOINT,cAMOUNT, LEVELNAME ' 다 나옴
    
SELECT cID, cTEL, cName,cPOINT,cAMOUNT, LEVELNAME,
    HIGH-CAMOUNT+1 forLEVELUP                --최고 레벨인 고객도 나와서 아래처럼 수정 
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.levelNO = L.levelNO AND CID =1;                                   --이렇게하면 모든 cID가5 아닌 고객들출력. 하지만 나는 한줄출력원함. 따라서 밑에
        
SELECT cID, cTEL, cNAME, cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               --*HIGH-CAMOUNT+1  --    따라서 WHERE CID =C.CID 를 통해  이렇게equal한 애 한명만 출력-----
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND cID =2 ; --자바에 쓸 SQL
    
    SELECT * FROM CUSTOMER;
    

-- 2. 폰뒤4자리(FULL) 검색 - CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을 위한 쓸 돈
--    public ArrayList<CustomerDto> cTelGetCustomers(String cTel);   --*()안에는 폰4자리들어와야
SELECT cID, cTEL, cNAME, cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND cTEL LIKE '%9999';  --자바에서 앞에%을붙이고 ? 붙여야

SELECT cID, cTEL, cNAME, cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND cTEL LIKE '%'||'9999'; -- 자바에 쓸 SQL


-- 3. 고객이름검색 - CID,CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을 위한 쓸 돈          --*실행화면 보면 3번째 칸
--                       public ArrayList<CustomerDto> cNameGetCustomers(String cName);
SELECT cID, cTEL, cName, cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND cNAME = '홍길동'; -- 자바에 쓸 SQL

--------------검색 끝 --------------
--------------구매 시작 -----------


-- 4. 포인트로만 구매(1000원짜리를 포인트로만 구매) : public int buyWithPoint(int cAmount, int cId)   *성공하면1, 실패하면 0
UPDATE CUSTOMER SET CPOINT = CPOINT - 500 WHERE CID=1;          
SELECT * FROM CUSTOMER;



-- 5. 물품구매 (1000000원짜리를 구매할 경우. 포인트는 구매금액의 5%)      (POINT,CAMOUNT,LEVELNO변경) 

-- 5-1 포인트와 구매누적금액 변경 

UPDATE CUSTOMER SET CPOINT = CPOINT + 1000000*0.05,       --100만원의 5%인 포인트가 추가 
                    CAMOUNT = CAMOUNT + 1000000
                WHERE CID =1;

-- 5-2 LEVELNO변경
SELECT CNAME, CAMOUNT, C.LEVELNO 현재레벨,     L.LEVELNO 바꿔야할레벨, LOW, HIGH
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE CAMOUNT BETWEEN LOW AND HIGH; 

SELECT L.LEVELNO 바꿔야할레벨
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE CAMOUNT BETWEEN LOW AND HIGH   --바꿔야할레벨만 필요
    AND CID=1;                            --cID가1인 고객이 바꿔야할 레벨


UPDATE CUSTOMER 
    SET LEVELNO = ( 
    SELECT L.LEVELNO 바꿔야할레벨
         FROM CUSTOMER C, CUS_LEVEL L
         WHERE CAMOUNT BETWEEN LOW AND HIGH  
         AND CID=1)
    WHERE CID=1;  --고객아이가1인 고객
SELECT * FROM CUSTOMER;
COMMIT;

--5-1  +  5-2 합한 부분을 자바에 쓸 SQL로 
        -- public int buy(int cAmount, int cId)
    
    
 UPDATE CUSTOMER  SET CPOINT = CPOINT + 1000000*0.05,       
                      CAMOUNT = CAMOUNT + 1000000,
                       LEVELNO = ( 
                            SELECT L.LEVELNO 바꿔야할레벨
                              FROM CUSTOMER C, CUS_LEVEL L
                              WHERE CAMOUNT BETWEEN LOW AND HIGH           --실행이 끝나야 200만원으로 바꿔. camount는 그래로 100만원  그래서 예전AMOUNT로LEVELNO를 계산하게됨
                              AND CID=1)
                WHERE CID =1;


 UPDATE CUSTOMER  SET CPOINT = CPOINT + 1000000*0.05,       
                      CAMOUNT = CAMOUNT + 1000000,
                       LEVELNO = ( 
                            SELECT L.LEVELNO 바꿔야할레벨
                              FROM CUSTOMER C, CUS_LEVEL L
                              WHERE CAMOUNT + 1000000 BETWEEN LOW AND HIGH           --따라서 더 소비한 amount를 추가해야
                              AND CID=1)
                WHERE CID =1;     -- 자바에 쓸 sql

    
-- 6. 등급별출력 - CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을위한쓸돈
--              public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)

SELECT cID, cTEL, cNAME,cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND levelNAME = 'VVIP'
    ORDER BY CAMOUNT DESC;


-- 7.전체출력 - CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, 레벨업을위한쓸돈     *(실행화면 밑에 라인 버튼의 2번째)
--            public ArrayList<CustomerDto> getCustomers()          

SELECT cID, cTEL, cNAME,cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP                -- +1해야 다음단계MINIMUM을 넘어 그래서 다음 단계로 레벌업 됨
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO
    ORDER BY CAMOUNT DESC;


-- 8. 회원가입(고객전화와 고객이름은 입력받아 INSERT)
--          public int insertCustomer(String cTel, String cName)
INSERT INTO CUSTOMER (cID, cTEL,cNAME) VALUES (CUSTOMER_SEQ.NEXTVAL, '010-7777-7777','신길동');
SELECT * FROM CUSTOMER;


-- 9. 번호수정 : public int updateCustomer(String cTel, int cId)
UPDATE CUSTOMER SET CTEL = '010-7777-7771' WHERE CID=3;

-- 10. 회원탈퇴 : public int deleteCustomer(String cTel)
DELETE FROM CUSTOMER WHERE CID=3;

COMMIT;









