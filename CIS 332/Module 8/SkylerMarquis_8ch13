--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 8, Chapter 12
--==================================

--Chapter 13 - Complete Hands-On Assignments 1-5 to create views. 
--Include statements at the beginning of your script file to delete the views 
--before creating the new ones, so the script could be run multiple times, 
--if necessary.

--Preparation for running the script
START "C:\Users\skyle\OneDrive\Documents\DMACC\CIS 332\Module 5\JLDB_Build_8.sql"

--Drop views to prep re-running script
DROP VIEW contact;
DROP VIEW homework13;
DROP VIEW reorderinfo;

--#1
CREATE VIEW contact
 AS SELECT contact, phone
 FROM publisher;
 
--#2
CREATE OR REPLACE VIEW contact
 AS SELECT contact, phone
 FROM publisher
 WITH READ ONLY;
 
--#3
CREATE FORCE VIEW homework13
 AS SELECT col1, col2 FROM firstattempt;
 
--#4
DESC homework13;

--#5
CREATE VIEW reorderinfo
 AS SELECT isbn, title, contact, phone
 FROM books JOIN publisher USING (pubid);