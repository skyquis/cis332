--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 8, Chapter 12
--==================================

--Chapter 12 - Complete all the Hands-On problems at the end of Chapter 12.  
--Use subqueries.   As the book suggests, always run the subquery separately 
--before adding it to the entire query. Note: the JLDB_Build_8.sql  and 
--JLDB_Build_12.sql scripts (posted above) are used before executing the 
--statements in this unit. 

--Preparation for running the script
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 5\JLDB_Build_8.sql"
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 8\JLDB_Build_12.sql"

--NOTE:  > is the GREATER THAN sign.  < is the LESS THAN sign.

--#1 in hands on assignments
SELECT title, retail
 FROM books
 WHERE retail <
 (SELECT AVG(retail)
 FROM books);
 
--#2
SELECT b.title, c.category, b.cost
 FROM books b, (SELECT category, AVG(cost) avgcost
                FROM books
                GROUP BY category) c
 WHERE b.category = c.category
 AND b.cost < c.avgcost;
 
--#3
SELECT order#
 FROM orders
 WHERE shipstate = 
 (SELECT shipstate
 FROM orders
 WHERE order# = 1014)
 AND order# <> 1014;

--#4
SELECT order#, SUM(quantity*paideach)
 FROM orderitems
 GROUP BY order#
 HAVING SUM(quantity*paideach) >
 (SELECT SUM(quantity*paideach)
 FROM orderitems
 WHERE order# = 1008);
 
--#5
--SELECT fname, lname
 --FROM bookauthor JOIN author
 --WHERE ISBN = 
 --(SELECT isbn
  --FROM bookauthor
  --WHERE 
  
--#6
SELECT title, customer#, category
 FROM orders JOIN orderitems USING (order#)
    JOIN books USING (isbn)
 WHERE isbn NOT IN 
    (SELECT isbn
    FROM orders o JOIN orderitems oi
    ON o.order#=oi.order#
    WHERE o.order#=oi.order# and o.customer#=1007);
    
--#7
SELECT shipcity, shipstate
 FROM orders
 WHERE shipdate - orderdate = 
 (SELECT MAX(shipdate-orderdate) FROM orders);
 
--#8
--SELECT DISTINCT customer, firstname, lastname
 --FROM customers JOIN orders USING (customer)
 --JOIN orderitems USING (orders)
 --JOIN books USING (isbn)
 --WHERE retail IN
 --(SELECT retail
  --FROM books
  --GROUP BY retail
  --WHERE retail = MIN(retail));
  
--#9
SELECT COUNT(DISTINCT customer#) "Number of Customers"
 FROM orders
 JOIN orderitems USING (order#)
 WHERE isbn IN 
    (SELECT isbn
    FROM orderitems
    JOIN bookauthor USING (isbn)
    JOIN author USING (AuthorID)
    WHERE fname = 'JAMES' AND lname = 'AUSTIN');
  
--#10
SELECT title
 FROM books
 WHERE pubid = 
    (SELECT pubid FROM books
     WHERE title = 'The Wok Way to Cook')
