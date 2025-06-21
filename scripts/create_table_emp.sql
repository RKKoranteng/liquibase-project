-- author: Richard Koranteng
-- description: script to create EMP table
--
-- 2025.06.17 : create emp statement
-- 2025.06.21 : add primary key [PK_EMP_ID]

CREATE TABLE DEMO.EMP (
    EMP_ID VARCHAR2(9) NOT NULL,
    EMP_NAME VARCHAR2(100) NOT NULL,
    EMP_DOB DATE NOT NULL,
    EMP_GENDER VARCHAR(1) NOT NULL
);

ALTER TABLE DEMO.EMP 
ADD CONSTRAINT PK_EMP_ID
PRIMARY KEY (EMP_ID);