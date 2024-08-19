--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 4, Chapter 5 Assignment
--==================================


--Preparation for running the script
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 4\JLDB_Build_5.sql"

--Complete #1, 2, 3, 6, 9, 10 with verification statement for each problem
--For verification statement example, after adding a row, place a query 
--statement in your script that displays the row that was added. After the steps
--to change costs, include a query that displays the costs, etc.

--#1 in hands-on assignments
INSERT INTO orders (order#, customer#, orderdate)
 VALUES (1021, 1009, '20-JUL-09');
 
--Verification
SELECT *
 FROM orders
 WHERE order# = 1021;
 
--#2
UPDATE orders
 SET shipzip = 33222
 WHERE order# = 1017;
 
--Verification
SELECT shipzip
 FROM orders
 WHERE order# = 1017;
 
--#3
COMMIT;

--Verification
SELECT *
 FROM orders;

--#6
UPDATE books
 SET cost = &Cost
 WHERE isbn = &ISBN;

--Verification - using ISBN# 8117949391
SELECT cost
 FROM books;
 
--Committing to not undo this
COMMIT;

--#9
DELETE FROM orderitems
 WHERE order# = 1005;

DELETE FROM orders
 WHERE order# = 1005;
 
--Verification
SELECT *
 FROM orders;
 
SELECT *
 FROM orderitems;

--#10
ROLLBACK;

--Verification
SELECT *
 FROM orders;
 
SELECT *
 FROM orderitems;
