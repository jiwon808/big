DROP TABLE CUSTOMER;
-- DROP TABLE CUSTOMER CASCADE CONSTRAINTS; (��õ������ ����)
DROP TABLE CUS_LEVEL;
DROP SEQUENCE CUSTOMER_SEQ;

-- ���̺� ���� 
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

-- ���������� INSERT 
INSERT INTO CUS_LEVEL VALUES (1, 'NORMAL',0,999999);
INSERT INTO CUS_LEVEL VALUES (2, 'SILVER',1000000,1999999);
INSERT INTO CUS_LEVEL VALUES (3, 'GOLD',2000000,2999999);
INSERT INTO CUS_LEVEL VALUES (4, 'VIP',3000000,4999999);
INSERT INTO CUS_LEVEL VALUES (5, 'VVIP',5000000,999999999);

SELECT * FROM CUSTOMER;
SELECT * FROM CUS_LEVEL;

INSERT INTO CUSTOMER (cID, cTEL, cNAME) VALUES (CUSTOMER_SEQ.NEXTVAL,'010-999-9999' ,'ȫ�浿'); --������ LEVELUP
INSERT INTO CUSTOMER VALUES (CUSTOMER_SEQ.NEXTVAL, '010-8888-9999','��浿',1000, 5000000,5);  -- �̹� �ְ�ġ ���� ���ᵵ lEVELUP�ȵ�
COMMIT;


-- 0. levelNAMES(�����̸���):  public Vector<String> LevelNames()
SELECT LEVELNAME FROM CUS_LEVEL 
    ORDER BY LEVELNO; 

-- 1. cId�� �˻� : public CustomerDto cIdGetCustomers(String cId)   
    --���̵� �Ѹ�ۿ� ��� arraylist����� �ʿ����   --����ȭ�鿡 cID�� �˻��ϸ� ' cID, cTEL,cName, cPOINT,cAMOUNT, LEVELNAME ' �� ����
    
SELECT cID, cTEL, cName,cPOINT,cAMOUNT, LEVELNAME,
    HIGH-CAMOUNT+1 forLEVELUP                --�ְ� ������ ���� ���ͼ� �Ʒ�ó�� ���� 
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.levelNO = L.levelNO AND CID =1;                                   --�̷����ϸ� ��� cID��5 �ƴ� �������. ������ ���� ������¿���. ���� �ؿ�
        
SELECT cID, cTEL, cNAME, cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               --*HIGH-CAMOUNT+1  --    ���� WHERE CID =C.CID �� ����  �̷���equal�� �� �Ѹ� ���-----
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND cID =2 ; --�ڹٿ� �� SQL
    
    SELECT * FROM CUSTOMER;
    

-- 2. ����4�ڸ�(FULL) �˻� - CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, �������� ���� �� ��
--    public ArrayList<CustomerDto> cTelGetCustomers(String cTel);   --*()�ȿ��� ��4�ڸ����;�
SELECT cID, cTEL, cNAME, cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND cTEL LIKE '%9999';  --�ڹٿ��� �տ�%�����̰� ? �ٿ���

SELECT cID, cTEL, cNAME, cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND cTEL LIKE '%'||'9999'; -- �ڹٿ� �� SQL


-- 3. ���̸��˻� - CID,CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, �������� ���� �� ��          --*����ȭ�� ���� 3��° ĭ
--                       public ArrayList<CustomerDto> cNameGetCustomers(String cName);
SELECT cID, cTEL, cName, cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND cNAME = 'ȫ�浿'; -- �ڹٿ� �� SQL

--------------�˻� �� --------------
--------------���� ���� -----------


-- 4. ����Ʈ�θ� ����(1000��¥���� ����Ʈ�θ� ����) : public int buyWithPoint(int cAmount, int cId)   *�����ϸ�1, �����ϸ� 0
UPDATE CUSTOMER SET CPOINT = CPOINT - 500 WHERE CID=1;          
SELECT * FROM CUSTOMER;



-- 5. ��ǰ���� (1000000��¥���� ������ ���. ����Ʈ�� ���űݾ��� 5%)      (POINT,CAMOUNT,LEVELNO����) 

-- 5-1 ����Ʈ�� ���Ŵ����ݾ� ���� 

UPDATE CUSTOMER SET CPOINT = CPOINT + 1000000*0.05,       --100������ 5%�� ����Ʈ�� �߰� 
                    CAMOUNT = CAMOUNT + 1000000
                WHERE CID =1;

-- 5-2 LEVELNO����
SELECT CNAME, CAMOUNT, C.LEVELNO ���緹��,     L.LEVELNO �ٲ���ҷ���, LOW, HIGH
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE CAMOUNT BETWEEN LOW AND HIGH; 

SELECT L.LEVELNO �ٲ���ҷ���
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE CAMOUNT BETWEEN LOW AND HIGH   --�ٲ���ҷ����� �ʿ�
    AND CID=1;                            --cID��1�� ���� �ٲ���� ����


UPDATE CUSTOMER 
    SET LEVELNO = ( 
    SELECT L.LEVELNO �ٲ���ҷ���
         FROM CUSTOMER C, CUS_LEVEL L
         WHERE CAMOUNT BETWEEN LOW AND HIGH  
         AND CID=1)
    WHERE CID=1;  --�����̰�1�� ��
SELECT * FROM CUSTOMER;
COMMIT;

--5-1  +  5-2 ���� �κ��� �ڹٿ� �� SQL�� 
        -- public int buy(int cAmount, int cId)
    
    
 UPDATE CUSTOMER  SET CPOINT = CPOINT + 1000000*0.05,       
                      CAMOUNT = CAMOUNT + 1000000,
                       LEVELNO = ( 
                            SELECT L.LEVELNO �ٲ���ҷ���
                              FROM CUSTOMER C, CUS_LEVEL L
                              WHERE CAMOUNT BETWEEN LOW AND HIGH           --������ ������ 200�������� �ٲ�. camount�� �׷��� 100����  �׷��� ����AMOUNT��LEVELNO�� ����ϰԵ�
                              AND CID=1)
                WHERE CID =1;


 UPDATE CUSTOMER  SET CPOINT = CPOINT + 1000000*0.05,       
                      CAMOUNT = CAMOUNT + 1000000,
                       LEVELNO = ( 
                            SELECT L.LEVELNO �ٲ���ҷ���
                              FROM CUSTOMER C, CUS_LEVEL L
                              WHERE CAMOUNT + 1000000 BETWEEN LOW AND HIGH           --���� �� �Һ��� amount�� �߰��ؾ�
                              AND CID=1)
                WHERE CID =1;     -- �ڹٿ� �� sql

    
-- 6. ��޺���� - CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, �����������Ѿ���
--              public ArrayList<CustomerDto> levelNameGetCustomers(String levelName)

SELECT cID, cTEL, cNAME,cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP               
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO AND levelNAME = 'VVIP'
    ORDER BY CAMOUNT DESC;


-- 7.��ü��� - CID, CTEL, CNAME, CPOINT, CAMOUNT, LEVELNAME, �����������Ѿ���     *(����ȭ�� �ؿ� ���� ��ư�� 2��°)
--            public ArrayList<CustomerDto> getCustomers()          

SELECT cID, cTEL, cNAME,cPOINT,cAMOUNT, LEVELNAME,
    (SELECT HIGH-CAMOUNT+1 
        FROM CUSTOMER WHERE CID =C.CID AND LEVELNO!=5) forLEVELUP                -- +1�ؾ� �����ܰ�MINIMUM�� �Ѿ� �׷��� ���� �ܰ�� ������ ��
    FROM CUSTOMER C, CUS_LEVEL L
    WHERE C.LEVELNO= L.LEVELNO
    ORDER BY CAMOUNT DESC;


-- 8. ȸ������(����ȭ�� ���̸��� �Է¹޾� INSERT)
--          public int insertCustomer(String cTel, String cName)
INSERT INTO CUSTOMER (cID, cTEL,cNAME) VALUES (CUSTOMER_SEQ.NEXTVAL, '010-7777-7777','�ű浿');
SELECT * FROM CUSTOMER;


-- 9. ��ȣ���� : public int updateCustomer(String cTel, int cId)
UPDATE CUSTOMER SET CTEL = '010-7777-7771' WHERE CID=3;

-- 10. ȸ��Ż�� : public int deleteCustomer(String cTel)
DELETE FROM CUSTOMER WHERE CID=3;

COMMIT;









