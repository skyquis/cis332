--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 6, Chapter 9 Assignment A
--==================================

--Preparation for running the script
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 5\JLDB_Build_8.sql"
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 6\JLDB_Build_9.sql"

--Chapter 9 - Using the JOIN keyword.  Complete the following Hands-On 
--assignments at the end of the Chapter: 1, 2, 4, 10. Write the SQL statement 
--needed to perform the stated task with the JOIN keyword.  Submit a script 
--containing the SQL statements, along with the a comment identifying the 
--problem number.  Include a comment at the top of the script with the 
--student's name. 

--Note:  Use the JOIN keyword for each of these problems.   
--Apply table ALLIASES in all queries

--Note: the JLDB_Build_8.sql script and JLDB_Build_9.sql (attached) are used 
--before executing the statements in this chapter.  

--Hint: The RETAIL field in the BOOKS table is the retail price the book is 
--normally sold at, but not necessarily the price that each customer paid for 
--the book.  There may have been a sale, coupon or special promotion at the 
--time the customer order the book.  The actual price that any given customer 
--paid for a book is stored in the PAIDEACH field of the ORDERITEMS table. 

--HINT for #10 - A table can be joined to itself. 

--#1 in hands on assignment
SELECT b.title, p.name, p.phone
 FROM books b JOIN publisher p
  USING (pubid);
  
--#2
SELECT o.order#, o.orderdate, c.firstname, c.lastname
 FROM orders o JOIN customers c
 USING (customer#)
 WHERE o.shipdate IS NULL
 ORDER BY o.orderdate;
 
--#4
SELECT DISTINCT b.title
 FROM customers c JOIN orders o
 USING (customer#)
 JOIN orderitems oi
 USING (order#)
 JOIN books b USING (isbn)
 WHERE c.lastname = 'LUCAS' and c.firstname = 'JAKE';
 
--#10
SELECT fname as "Employee First Name", e.lname as "Employee Last Name", e.job as "Job", e.mgr as "Manager Name"
 FROM employees e
 LEFT OUTER JOIN employees em
 USING (fname)
 ORDER BY e.mgr