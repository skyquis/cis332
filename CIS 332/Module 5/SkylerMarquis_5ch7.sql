--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 5, Chapter 7 Assignment
--==================================

--Complete #1, 3, 4, 6, 9

--NOTE on #4: Write different GRANT commands for the two tables; ORDERS and 
--ORDERITEMS

--NOTE on #6: You don't have the appropriate privileges to create a new account,
--So skip the first sentence about logging into the new account from problem #1.
--Instead, write the command to determine the privileges currently available in
--your current session of your ORAxxx login you are using for the course.

--#1 in hands-on assignments
CREATE USER smarquis
 IDENTIFIED BY GreatPassword1;
 
--#3
GRANT CREATE SESSION
 TO smarquis;
 
GRANT CREATE ANY TABLE
 TO smarquis;
 
GRANT ALTER ANY TABLE
 TO smarquis;
 
--#4
CREATE ROLE CUSTOMERREP;

GRANT insert, delete
 ON ORDERS
 TO CUSTOMERREP;

GRANT insert, delete
 ON ORDERITEMS
 TO CUSTOMERREP;
 
 --#6
SELECT *
 FROM USER_SYS_PRIVS;
 
SELECT *
 FROM USER_ROLE_PRIVS;

 --#9
 DROP ROLE CUSTOMERREP;
 