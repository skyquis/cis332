--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 5, Chapter 8 Assignment
--==================================

--Preparation for running the script
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 5\JLDB_Build_8.sql"

--Chapter 8 - Complete all of the Hands-On Assignments #1 - #10  at the end of 
--Chapter 8. The assignment asks you to submit the SQL statements and the 
--output. I'd like you to submit the assignment in two different files.  
--One should be an assignment file as usual containing the required SPOOL 
--command and the SQL statements with the numbers of the problems commented.  
--This is a script file I will execute to grade your work.  The other file will 
--be the text file created with the SPOOL command that contains the formatted 
--output of the assignment script file. Make sure that your output is formatted 
--so that the results of each SELECT statement display as one page with no page
--breaks (examples are the output for problems # 2 and #3).

--Turning Spool on and specifying file
spool output_file.txt

--#1 in hands on assignments
SELECT lastname, firstname, state
 FROM customers
 WHERE state = 'NJ';
 
--#2
SELECT order#, shipdate
 FROM orders
 WHERE shipdate > '01-APR-09';
 
--#3
SELECT title, category
 FROM books
 WHERE category != 'FITNESS';
 
--#4
SELECT customer#, lastname, state
 FROM customers
 WHERE state = 'GA' or state = 'NJ'
 ORDER BY lastname;
 
SELECT customer#, lastname, state
 FROM customers
 WHERE state IN ('GA', 'NJ')
 ORDER BY lastname;
 
--#5
SELECT order#, orderdate
 FROM orders
 WHERE orderdate <= '01-APR-09';
 
SELECT order#, orderdate
 FROM orders
 WHERE orderdate = '01-APR-09' or orderdate < '01-APR-09';
 
--#6
SELECT lname, fname
 FROM author
 WHERE lname LIKE '%IN%'
 ORDER BY lname, fname;

--#7
SELECT lastname, referred
 FROM customers
 WHERE referred IS NOT NULL;
 
--#8
SELECT title, category
 FROM books
 WHERE category in ('CHILDREN', 'COOKING');
 
SELECT title, category
 FROM books
 WHERE category = 'CHILDREN' or category = 'COOKING';

SELECT title, category
 FROM books
 WHERE category LIKE '%HILDRE%' or category LIKE '%OOKIN%';
 
 --#9
 SELECT isbn, title
  FROM books
  WHERE title LIKE '_A_N%'
  ORDER BY title
  DESC;
  
--#10
SELECT title, pubdate
 FROM books
 WHERE pubdate BETWEEN '01-JAN-05' AND '31-DEC-05';
 
SELECT title, pubdate
 FROM books
 WHERE pubdate >= '01-JAN-05' and pubdate <= '31-DEC-05';
 
SELECT title, pubdate
 FROM books
 WHERE pubdate LIKE '%-05';

--Turning spool off
spool OFF