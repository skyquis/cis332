--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 1, Chapter 2 Assignment
--==================================

--#1 in hands on assignments
SELECT *
 FROM books;
 
--#2
SELECT title
 FROM books;
 
 --#3
SELECT title, Pubdate as "Publication Date"
 FROM books;
 
 --#4
SELECT CUSTOMER#, city, state
 FROM customers;
 
 --#5
SELECT name, contact as "Contact Person", phone
 FROM publisher;
 
--#6
SELECT DISTINCT category
 FROM books;
 
--#7
SELECT DISTINCT customer#
 FROM orders;

--#8 
SELECT category, title
 FROM books;
 
--#9
SELECT lname || ', ' || fname as Authors
 FROM AUTHOR;
 
--#10
SELECT order#, item#, isbn, quantity, paideach, quantity*paideach as "Item Total"
 FROM orderitems;
 
--Advanced Challenge #1
SELECT lastname || ', ' || firstname as Name, address, city || ',' || state as Location, zip
 FROM Customers;

--#2
SELECT title, 100*(retail - cost)/cost as "Profit %"
 FROM books;
