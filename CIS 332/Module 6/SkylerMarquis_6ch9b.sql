--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 6, Chapter 9 Assignment B
--==================================

--Preparation for running the script
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 5\JLDB_Build_8.sql"
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 6\JLDB_Build_9.sql"

--Chapter 9 - Using the Traditional Approach.  
--Complete the following Hands-On assignments at the end of the Chapter: 3, 7, 9.
--Write the SQL statement 
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

--#3 in hands on assignment
SELECT DISTINCT c.firstname, c.lastname
 FROM customers c, orders o, books b, orderitems i
 WHERE c.customer#=o.customer# AND o.order#=i.order# AND b.isbn=i.isbn 
 AND c.state='FL' AND b.category='COMPUTER';
  
--#7
SELECT DISTINCT p.gift
 FROM books b, promotion p, orderitems i
 WHERE b.title='SHORTEST POEMS' AND b.retail
 BETWEEN p.minretail AND p.maxretail;
 
--#9
SELECT b.title, i.order#, c.state
 FROM books b, orderitems i, orders o, customers c
 WHERE b.isbn = i.isbn AND i.order# = o.order# AND o.customer# = c.customer#
 