-- [IX] SEQUENCE: ������ȣ ������, ��κ� �������� PK��� �뵵  
DROP SEQUENCE FRIEND_SEQ; --�ִ� SEQUENCE�״�� ���� 1������ �������� �ʾ� 
CREATE SEQUENCE FRIEND_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    MINVALUE 1
    NOCYCLE 
    NOCACHE; --�Ź�ų�� 1���� 

DROP TABLE FRIEND;  --Ȥ�� �ش� ���̺� �������
CREATE TABLE FRIEND(
    NUM   NUMBER(4) PRIMARY KEY, --MAX��9999�̹Ƿ� NUMBER 4�����ʿ����
    NAME  VARCHAR2(30) NOT NULL,
    PHONE VARCHAR2(20) UNIQUE, --UNIQUE:����, NULL��� 
    TEL   VARCHAR2(20),
    LAST_MODIFYED DATE);



