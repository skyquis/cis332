--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 4, Chapter 6 Assignment
--==================================


--Preparation for running the script
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 4\JLDB_Build_5.sql"
DROP SEQUENCE customers_customer#_seq;
DROP SEQUENCE MY_FIRST_SEQ;

--Complete problems 1-8. Skip 9. For 10 in addition to the query that verifies 
--the index has been added, include a query to the data dictionary to verify 
--the index has been removed after removing index from database

SELECT customer#
 FROM customers;

--#1 in hands on assignment
CREATE SEQUENCE
 customers_customer#_seq
 INCREMENT BY 1
 START WITH 1021
 NOCACHE NOCYCLE;
 
--Verification
SELECT object_name
 FROM user_objects
 WHERE object_type = 'SEQUENCE';
 
--#2
INSERT INTO customers (customer#, lastname, firstname, zip)
 VALUES (customers_customer#_seq.NEXTVAL, 'Shoulders', 'Frank', 23567);
 
--Verification
SELECT *
 FROM customers
 WHERE lastname = 'Shoulders';
 
--#3
CREATE SEQUENCE
 MY_FIRST_SEQ
 INCREMENT BY -3
 START WITH 5
 MAXVALUE 5
 MINVALUE 0
 NOCYCLE;
 
--Verification
SELECT object_name
 FROM user_objects
 WHERE object_type = 'SEQUENCE';
 
 --#4
SELECT MY_FIRST_SEQ.NEXTVAL
 FROM DUAL;
 
SELECT MY_FIRST_SEQ.NEXTVAL
 FROM DUAL;

SELECT MY_FIRST_SEQ.NEXTVAL
 FROM DUAL;
 
--Error caused by going below MINVALUE and cannot be instantiated.

--#5
ALTER SEQUENCE
 MY_FIRST_SEQ
 MAXVALUE 5
 MINVALUE -1000;

--Verification
SELECT *
 FROM user_sequences;
 
--#6
CREATE TABLE email_log
 (emailid NUMBER GENERATED AS IDENTITY PRIMARY KEY,
 emaildate DATE,
 customer# NUMBER);
 
INSERT INTO email_log (emaildate, customer#)
 VALUES (SYSDATE, 1007);
 
INSERT INTO email_log
 VALUES (DEFAULT, SYSDATE, 1008);
 
INSERT INTO email_log
 VALUES (25, SYSDATE, 1009);
 
--Received an error when trying to insert a value, 25, into the emailid 
--when this has generated as identity keywords. However, the first two
--insertions worked.

--Verification
SELECT *
 FROM email_log;

--#7
CREATE SYNONYM
 NUMGEN
 FOR MY_FIRST_SEQ;
 
--Verification
SELECT *
 FROM sys.synonyms
  WHERE sname = 'NUMGEN';

--#8
DROP SYNONYM NUMGEN;
DROP SEQUENCE MY_FIRST_SEQ;

--Verification
SELECT *
 FROM user_sequences;
 
SELECT *
 FROM sys.synonyms
  WHERE sname = 'NUMGEN';
  
--#10
CREATE INDEX
 lastname_customer_idx
 ON customers
 (lastname);
 
--Verification
SELECT table_name, index_name, index_type
 FROM user_indexes
 WHERE table_name = 'CUSTOMERS';
 
--Dropping Index
DROP INDEX
 lastname_customer_idx;
 
--Drop Verification
SELECT table_name, index_name, index_type
 FROM user_indexes
 WHERE table_name = 'CUSTOMERS';