--==================================
--Skyler Marquis
--CIS332: Database and SQL
--Unit 3, Chapter 4 Assignment
--==================================

--Constraint Naming Conventions
--I expect students to assign a name to each constraint that is created in this assignment.  Do not allow the system to assign the constraint name or points will be deducted.  It's very probable that system assigned names would be different in your schema than in mine.  If the constraints are given a specific name, then everyone knows how to refer to them.  Follow the standard industry convention as follows;
--tablename_columnname_constraintType         where constraintType is a two letter abbreviation as follows
--_pk = primary key constraint
--_fk = foreign key constraint
--_uk = unique constraint
--_ck = check constraint
--_nn = not null constraint
--For example, the constraint name for problem #1 will be:  storereps_id_pk


--Clean-up & Preparation for Running the Script--
ALTER TABLE book_stores
 DROP CONSTRAINT bookstores_sid_pk CASCADE
 DROP CONSTRAINT bookstores_rid_fk;
ALTER TABLE store_reps
 DROP CONSTRAINT storereps_id_pk CASCADE;
DROP TABLE store_reps;
DROP TABLE book_stores;
DROP TABLE rep_contracts;

--#1 in hands on assignments
CREATE TABLE store_reps

(rep_ID NUMBER(5),

last VARCHAR2(15),

first VARCHAR2(10),

comm CHAR(1) DEFAULT 'Y',

CONSTRAINT storereps_id_pk PRIMARY KEY (rep_ID));

--VERIFICATION
--Fuller verification of default value as Y?
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'STORE_REPS';

--#2
ALTER TABLE store_reps

 MODIFY (last CONSTRAINT storereps_last_nn NOT NULL)
 MODIFY (first CONSTRAINT storereps_first_nn NOT NULL);

--VERIFICATION
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'STORE_REPS';

--#3
ALTER TABLE store_reps
 ADD CONSTRAINT storereps_comm_ck CHECK (COMM IN ('Y','N'));
 
--VERIFICATION
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'STORE_REPS';

--#4
ALTER TABLE store_reps
 ADD (BASE_SALARY NUMBER(7,2)
 CONSTRAINT storereps_basesalary_ck CHECK (BASE_SALARY > 0));

--VERIFICATION
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'STORE_REPS';
 
--#5
CREATE TABLE book_stores

(Store_ID NUMBER(8),

Name VARCHAR2(30) CONSTRAINT bookstores_name_nn NOT NULL,

Contact VARCHAR2(30),

Rep_ID VARCHAR2(5),

CONSTRAINT bookstores_sid_pk PRIMARY KEY (Store_ID),
CONSTRAINT bookstores_name_uk UNIQUE (Name));

--VERIFICATION
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'BOOK_STORES';
 
--#6
ALTER TABLE book_stores
 MODIFY (Rep_ID NUMBER(5))
 ADD CONSTRAINT bookstores_rid_fk FOREIGN KEY (Rep_ID)
    REFERENCES store_reps (Rep_ID);

--VERIFICATION
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'BOOK_STORES';
 
--#7
ALTER TABLE book_stores
 DROP CONSTRAINT bookstores_rid_fk;
 
--VERIFICATION OF DROP
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'BOOK_STORES';
 
--#7 continued
ALTER TABLE book_stores
 ADD CONSTRAINT bookstores_rid_fk FOREIGN KEY (Rep_ID)
    REFERENCES store_reps (Rep_ID) ON DELETE CASCADE;
 
--VERIFICATION
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'BOOK_STORES';
 
DESC book_stores;

--#8
CREATE TABLE rep_contracts

(Store_ID NUMBER(8),

 Name NUMBER(5),

 Quarter CHAR(3),

 Rep_ID NUMBER(5),

CONSTRAINT repcontracts_ridsidq_pk PRIMARY KEY (Rep_ID,Store_ID,Quarter),
CONSTRAINT repcontracts_rid_fk FOREIGN KEY (Rep_ID)
    REFERENCES store_reps (Rep_ID),
CONSTRAINT repcontracts_sid_fk FOREIGN KEY (Store_ID)
    REFERENCES book_stores (Store_ID));

--VERIFICATION
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'REP_CONTRACTS';

--#9
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
 FROM user_constraints
 WHERE table_name = 'STORE_REPS';

--VERIFICATION
--N/A

--#10 disable
ALTER TABLE store_reps
 DISABLE CONSTRAINT storereps_basesalary_ck;

--VERIFICATION of disable (row can be inserted)
INSERT INTO store_reps (rep_id, last, first, comm, base_salary)
 VALUES (123, 'marquis', 'skyler', 'N', 0);

--#10 enable - need to get ride of entry in disable verification before this
ALTER TABLE store_reps
 ENABLE CONSTRAINT storereps_basesalary_ck;
 
 --VERIFICATION of enable
INSERT INTO store_reps (rep_id, last, first, comm, base_salary)
 VALUES (123, 'marquis', 'skyler', 'N', 0);