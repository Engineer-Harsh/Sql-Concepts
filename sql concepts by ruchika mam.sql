
--  Different colour code used in sql server
 
--there are various colours used in ssms for different purposes, below are the colour code and their purposes
--Red        : String functions
--Dark Green : comments
--Dark grey  : operators
--Blue       : keyword
--Maroon     : stored procedures
--Green      : system table, view, or table-valued function
--Magenta    : System function
--Teal       : Line numbers or template functions
--Black on silver background  : SQLCMD command


----------------------------------------	Ist CLASS REVISION--------------------------------------------------

-----------------------TYPES OF DATA LANGUAGES-------------------------------
			----------CATEGORY OF SQL COMMANDS/TYPES OF SQL COMMANDS---------
--category --DDL                --DML             --DCL           --TCL           --DQL			
	 	  --create	  	   	   --insert           --grant         --commit        --select
		  --alter			   --update           --revoke        --rollback
		  --drop			   --delete                           --savepoint
		  --truncate		   --call                             --set transaction
		  --rename			   --explain call                     --set constraint
					           --lock
					
					
---CREATE COMMAND IS USED TO CREATE OBJECTS---
--SYNTAX create database DATABASE_NAME
CREATE DATABASE REVISION---here create command is used for creating space in the database or else work will
----store in masters_db

USE REVISION---the use command tell's sql to store that we want in a specified db or use specified db

--CREATE TABLE
---SYNTAX
--CREATE TABLE TABLE_NAME
--(
--COLOUMN1 DATATYPE,
--COLOUMN2 DATATYPE,
--COLOUMN3 DATATYPE
--)

-------------------------summary of 1st class
--what is a dbms
--diff. b/w rdbms & dbms
--types of rdbms
--when - when sql server updated and current sql server
--sql sever editions
--types of languages
--categories of sql commands
--create command
--use command
--create table syntax


-------------------------------------------------2ND CLASS REVISION--------------------------------------------------
CREATE TABLE EMPLOYEE_DETAILS
(
EMP_ID INT PRIMARY KEY,
EMP_NAME CHAR(50) NOT NULL,
GENDER CHAR(20),
CITY CHAR(50) NULL,
SALARY MONEY
)

CREATE TABLE DEPARTMENT_DETAILS
(
DEPT_ID INT,
EMP_ID INT FOREIGN KEY REFERENCES EMPLOYEE_DETAILS,
DEPT_NAME VARCHAR(20),
DEPT_BATCH CHAR(2),
)
SELECT * FROM EMPLOYEE_DETAILS--Here SELECT command is used to fetch data from database which we are using
SELECT * FROM DEPARTMENT_DETAILS

DROP TABLE EMPLOYEE_DETAILS
DROP TABLE DEPARTMENT_DETAILS

--suppose i am creating 3 tables at a time, out of them table1 has two primary key(k1) & key(2)
--and i want to create k1 as foreign key to table2 and k2 as foreign key to table3 
--can it be possibe?

--Let's check
CREATE TABLE EMPLOYEE_DETAILS
(
EMP_ID INT PRIMARY KEY,
EMP_NAME CHAR(50) NOT NULL,
ADHAR_NO BIGINT PRIMARY KEY, --here i can't add two primary key in a single table
GENDER CHAR(20),
CITY CHAR(50) NULL,
SALARY MONEY
)

CREATE TABLE DEPARTMENT_DETAILS
(
DEPT_ID INT NOT NULL,
EMP_ID INT FOREIGN KEY REFERENCES EMPLOYEE_DETAILS,
DEPT_NAME VARCHAR(20),
DEPT_BATCH CHAR(2),
)
CREATE TABLE EMP_EPFO_DETAILS
(
EMP_ID INT FOREIGN KEY REFERENCES EMPLOYEE_DETAILS,
ADHAR_NO BIGINT,
EPFO_ID BIGINT
)

SELECT *FROM EMPLOYEE_DETAILS
SELECT *FROM DEPARTMENT_DETAILS
SELECT *FROM EMP_EPFO_DETAILS

--so from here we can see that one table can not have two primary key where as that single primary key can be used
--in multiple tables as foreign key.


--check how the diff. b/w NOT NULL & UNIQUE contraint in edit 200rows option in object explorer
--and check how many char's length INT and CHAR can hold in same edit 200rows option in object explorer

--how to rename table name? syntax-- EXEC SP_RENAME 'old TABLE_NAME','new TABLE_NAME'
--here only old table name & new table name should be in single inverted comma
EXEC SP_RENAME 'EMP_EPFO_DETAILS','EPFO_DETAILS' 

SELECT * FROM EPFO_DETAILS
------------------------------inserting  the data into the table---------------------------
INSERT INTO EMPLOYEE_DETAILS(EMP_ID, EMP_NAME, GENDER, CITY, SALARY)VALUES(101, 'CHARLIE','M','PUNE',1000)
SELECT * FROM EMPLOYEE_DETAILS

INSERT INTO EMPLOYEE_DETAILS VALUES(102, 'ROMIO','M','BANGLORE',2000)
INSERT INTO EMPLOYEE_DETAILS VALUES(103, 'PUJA','F','PUNE',3000)
INSERT INTO EMPLOYEE_DETAILS VALUES(104, 'BARKHA','F','MUMBI',4000)

SELECT * FROM EMPLOYEE_DETAILS
WHERE CITY = 'PUNE'-------------------where is used to filter

SELECT *FROM EMPLOYEE_DETAILS WHERE SALARY <3000
SELECT * FROM EPFO_DETAILS
ALTER TABLE EPFO_DETAILS EXEC SP_RENAME 'EPFO_ID','EMP_EPFO_ID' ---how to rename a column name???here error is coming
EXEC SP_RENAME 'EPFO_DETAILS.EPFO_ID','EMP_EPFO_ID','COLUMN'---this is also not working
EXEC SP_RENAME 'EPFO_DETAILS.EPFO_ID','EMP_EPFO_ID'--not executed
EXEC SP_RENAME 'EPFO_ID','EMP_EPFO_ID'--this is also not executed
---------------------summary 2nd class
---creating table 
---types of datatypes 
---types of constraints
---data insertion 
---rename command
---where clause


-----------------------------------------------third class------------------------------------------------------------

use revision

select *from employee_details
select *from department_details

SELECT DEPT_ID, DEPT_NAME FROM DEPARTMENT_DETAILS

CREATE TABLE EMPLOYEE_INFORMATION
(
EMP_ID INT PRIMARY KEY,
EMP_NAME CHAR(50),
GENDER CHAR(20),
CITY CHAR(30),
SALARY MONEY
)

CREATE TABLE DEPARTMENT_INFORMATION
(
DEPT_ID INT,
EMP_ID INT FOREIGN KEY REFERENCES EMPLOYEE_INFORMATION,
DEPT_NAME CHAR(20),
DEPT_BATCH VARCHAR(20)
)

SELECT *FROM EMPLOYEE_INFORMATION
SELECT *FROM DEPARTMENT_INFORMATION
----------------------------inserting the data into the table----------------------------
INSERT INTO EMPLOYEE_INFORMATION(EMP_ID,EMP_NAME,GENDER,CITY,SALARY)VALUES(101,'CHARLIE','M','PUNE',1000)
INSERT INTO EMPLOYEE_INFORMATION VALUES(102,'CLEAVEN','M','MUMBAI',2000)
INSERT INTO EMPLOYEE_INFORMATION VALUES(103,'WILLIAM','M','BANGLORE',5000)
INSERT INTO EMPLOYEE_INFORMATION VALUES(104,'POOJA','F','MUMBAI',2500)
INSERT INTO EMPLOYEE_INFORMATION VALUES(105,'MIHIKA','F','CHENNAI',10000)
INSERT INTO EMPLOYEE_INFORMATION VALUES(106,2000)--here it is not executed coz supplied values doesn't match table defination
INSERT INTO EMPLOYEE_INFORMATION VALUES(106,'','','',3000)--it is executed coz we have given blank value in single equotaion

select *from employee_information

------------------------------------ALTER COMMAND------------------------------------
--this command is used to ADD, DROP, DELETE, MODIFY TO AN EXISTING TABLE

ALTER TABLE EMPLOYEE_INFORMATION
ADD EMAIL_ID VARCHAR(100)---------ADD COMMAND

SELECT *FROM EMPLOYEE_INFORMATION

ALTER TABLE EMPLOYEE_INFORMATION
DROP COLUMN EMAIL_ID--------------DROP COMMAND
---here data type is not needed for droping a column name

-------------------------------------DISTINCT KEYWORD/OPERATOR--------------------------------
--distinct keyword or operator is used with select command to fetch the unique value from the table or column
--or it is used to remove duplicate values
SELECT DISTINCT CITY FROM EMPLOYEE_INFORMATION

-----------------------------AGGREGATION FUNCTIONS---------------------------
--aggregation function includes SUM, MIN, MAX, COUNT, TOTAL, AVG

SELECT COUNT(DISTINCT CITY) FROM EMPLOYEE_INFORMATION--gives the total no.of unique cities in the coloumn

-----------------------------------WHERE CLAUSE-------------------
--where clause is used to filter the data
--it is used with SELECT, DELETE, UPDATE STATEMENT

SELECT * FROM EMPLOYEE_INFORMATION
WHERE CITY = 'MUMBAI'

SELECT EMP_ID, SALARY FROM EMPLOYEE_INFORMATION
WHERE CITY='MUMBAI'

SELECT EMP_ID ,SALARY, CITY FROM EMPLOYEE_INFORMATION
WHERE CITY = 'MUMBAI'
 
 SELECT * FROM EMPLOYEE_INFORMATION
 WHERE EMP_ID = 101

 SELECT * FROM EMPLOYEE_INFORMATION
 WHERE SALARY > 2000-----------here >, =, <, <>, !=, BETWEEN, LIKE, IN. these all are the operators

 ----------------------------operators-------------------------
 -- >, <, =, !=, <=, >=, <>, BETWEEN, LIKE, IN, AND, OR, DISTINCT

 SELECT * FROM EMPLOYEE_INFORMATION
 WHERE SALARY = 1000----------equals to operator

 SELECT * FROM EMPLOYEE_INFORMATION
 WHERE SALARY != 1000 ---------not equals to operator

 SELECT *FROM EMPLOYEE_INFORMATION
 WHERE SALARY <> 1000 ---------not equals to operator

 SELECT * FROM EMPLOYEE_INFORMATION
 WHERE SALARY BETWEEN 1000 AND 5000----------between operator

  SELECT * FROM EMPLOYEE_INFORMATION
 WHERE SALARY BETWEEN 2000 AND 5000----------between operator

 SELECT *FROM EMPLOYEE_INFORMATION
 WHERE CITY LIKE 'M%'

 -- M% --this sign means that we want to fetch the data which starts with letter M
 -- %M --it means that we want to fetch the data which ends with M
 -- _P% --here this sign means that we want to fetch the data which starts with _P
 -- %_P --and here this means that we want to fetch the data which ends with _P

 SELECT *FROM EMPLOYEE_INFORMATION 
 WHERE CITY LIKE '%I'

 --------------------AND, OR, NOT operators---------------------

 SELECT *FROM EMPLOYEE_INFORMATION
 WHERE CITY = 'MUMBAI' AND SALARY > 1000

 SELECT *FROM EMPLOYEE_INFORMATION
 WHERE CITY = 'MUMBAI' AND SALARY > 5000-------here blank column name is showing coz there is no such data which satisfies
 ----------------------------------------------both the conditions i.e. city=mumbai and salary>5000

 SELECT EMP_ID, SALARY FROM EMPLOYEE_INFORMATION
 WHERE CITY = 'MUMBAI' OR SALARY > 2000 ---here either of them from two condition should satisfy 
 
 SELECT EMP_ID, SALARY FROM EMPLOYEE_INFORMATION
 WHERE CITY = 'MUMBAI' OR SALARY <> 2000

 SELECT *FROM EMPLOYEE_INFORMATION

 SELECT * FROM EMPLOYEE_INFORMATION
 WHERE CITY = 'MUMBAI' OR SALARY > 2000 ---here either of them from two condition should satisfy 
 
SELECT * FROM EMPLOYEE_INFORMATION
WHERE CITY = 'MUMBAI' OR SALARY <> 2000

--------------------------------ORDER BY(ASC,DESC)--------------------------
--order by is keyword not a statment
--it is either ascending or descending
--here either is not deriving from the table, it is only sorting the data that is why it is a keyword not a statement
--by default in any application order by is ascending if we are not defining the rules

--keep this in mind 
--by default
--order by - ascending
--join - inner
--chart - bar chart

SELECT *FROM EMPLOYEE_INFORMATION

SELECT *FROM EMPLOYEE_INFORMATION
ORDER BY CITY

SELECT * FROM EMPLOYEE_INFORMATION
ORDER BY CITY DESC

----------------------------------------------------4th class---------------------------------------------------------

-------------------------------------joins-------------------------------
use revision
--see the difference b/w the below statments and their output 
SELECT *FROM EMPLOYEE_INFORMATION, DEPARTMENT_INFORMATION--here both table's column name get merged in a single table
---but the data and values in either table is not showing though table1 has data & table2 has not, still data of either
---table is not showning

SELECT *FROM EMPLOYEE_INFORMATION---here both table fetched out seperately, one on top of another but the data is 
SELECT *FROM DEPARTMENT_INFORMATION---showing in both the table


INSERT INTO DEPARTMENT_INFORMATION VALUES(10,101,'HR',01)
INSERT INTO DEPARTMENT_INFORMATION VALUES(10,104,'HR',01)
INSERT INTO DEPARTMENT_INFORMATION VALUES(20,107,'TESTING',02)--here statment isn't executes as empid isn't present in parent table
INSERT INTO DEPARTMENT_INFORMATION VALUES(20,105,'TESTING',02)--now it is executed coz empid is present in parent table
INSERT INTO DEPARTMENT_INFORMATION VALUES(50,103,'ELECTRICAL',04)
INSERT INTO DEPARTMENT_INFORMATION VALUES(30,102,'DEVELOPER',04)

SELECT *FROM EMPLOYEE_INFORMATION, DEPARTMENT_INFORMATION--earlier it was not executed as there were no data in table2
---but now after entering data in table2 as well, this statement i think had join the tables with cross join!!
---find out if it is true or not??


USE REVISION

--JOINS
--when we want to join two table together then it is done by concept called joins
--rules for joining the table
--there should a common column between the two table
--and that common column should have a similar datatype
--here i know that common column name can be diff. but the data type must be same, so the common column should have the same values
--in it's row as well?? find it out!

--there are 6 types of joins 
--inner
--left join(outer join type)
--right join(outer join type)
--full outer join(outer join type)
--natual join-----this type of join is not present in the ssms, it removes the duplicate coloumn in other databases
--cross join
--self join

CREATE TABLE STUDENT
(STD_ID INT, 
STD_NAME CHAR(20), 
STD_EMAIL_ID VARCHAR(40), 
COURSE_ID INT
)

CREATE TABLE COURSE
(COURSE_ID INT, 
COURSE_NAME VARCHAR(20), 
COURSE_FEES DECIMAL(6,2)
)

SELECT *FROM STUDENT
SELECT *FROM COURSE

--here inserting of data is done by editing top 200rows in object explorer
--prodcedure is do refresh expand database option, expand table option in preferred database, right click on preferred
--table name, then select the option edit top 200rows, after entering the data, click on query designer at ribbon then 
--select execute sql
--check the inserted data by firing select statement

--can i rewrite/overlap new value to an already existing value in edit top 200rows option in object explorer as by 
--quering or writing a statment can not do this maybe by GUI can we do this directly in object explorer 
--or it will not be executed, find out??
--answer is no we can not overlap value by edit 200rows option directly as well
--i need to recheck the above answer coz may be it can be rewritten, perlexity is saying yes and i have also done this maybe in
--the class in which ruchika mam is teaching us windows functions

--SYNTAX OF JOIN
--SELECT * / <LIST OF COLUMN NAME> FROM <TABLE1>
--JOIN TYPE <TABLE2>   -----here type is (inner, left, right, full)
--ON <JOINING CONDITION>    ----here joining condition is common column

SELECT * FROM STUDENT
INNER JOIN COURSE
ON STUDENT.COURSE_ID = COURSE.COURSE_ID---here why is .(fullstop) is used between student.courseid & course.courseid??
-----

-----------------------------------ALIASES------------------------
SELECT * FROM STUDENT AS S----here AS S is used for aliases
INNER JOIN COURSE AS C---------INNER JOIN
ON S.COURSE_ID = C.COURSE_ID
---aliases is used for nick names or giving a user freindly name to a column

SELECT * FROM STUDENT
LEFT JOIN COURSE---------LEFT JOIN
ON STUDENT.COURSE_ID = COURSE.COURSE_ID

SELECT * FROM STUDENT
RIGHT JOIN COURSE----------RIGHT JOIN
ON STUDENT.COURSE_ID=COURSE.COURSE_ID

SELECT * FROM STUDENT
FULL OUTER JOIN COURSE---------FULL OUTER JOIN
ON STUDENT.COURSE_ID=COURSE.COURSE_ID

SELECT * FROM STUDENT
SELECT * FROM COURSE

SELECT * FROM STUDENT AS S
CROSS JOIN COURSE AS C-----here joining condition i.e. common column is not required


-------------------------------------------------------5th class------------------------------------------------------

---------------------------------------CLAUSES------------------------------

------clause is a inbuilt function in every database be it (oracle,mysql,sql server) which help us to retreive the
------data from a database table, the clauses will calculate the result based on expressions(small-small expressions),
------clauses are used to specify a search condition

--GROUP BY--group by is used to group the similiar data based on the columns or in other words it summarizes the data
---group by is a clause which can be used alone
---with group by we use atleast one aggregation function like(sum,min,max,count,avg,total,distinct)everytime

--HAVING--but having needs the combination of groupby and having, it needs hand holding of group by
----it will filter the data/records after grouping the data
----having clause can be used not just after group by but can be used along with group by clause as well

CREATE TABLE EMPLOYEE
(EMPNO INT,
ENAME CHAR(20),
JOB CHAR(20),
HIREDATE DATE,
SALARY MONEY,
DEPTNO INT
)
SELECT *FROM EMPLOYEE

SELECT JOB, COUNT(*) FROM EMPLOYEE----here count is the agregation function(max, min, count, avg, sum, total)
GROUP BY JOB
--in below statement we have named the column  total_positons with aliases 
SELECT JOB, COUNT(*) AS TOTAL_POSTIONS FROM EMPLOYEE--here comma after job is used so that we can get 2columns in result
GROUP BY JOB---------statemet1

SELECT JOB, COUNT(JOB) AS TOTAL_POSITIONS FROM EMPLOYEE
GROUP BY JOB--------statement2

SELECT COUNT(JOB) AS TOTAL_POSITIONS FROM EMPLOYEE
GROUP BY JOB-------statement3

SELECT COUNT(JOB) AS TOTAL_POSITIONS FROM EMPLOYEE---statement5--- see the difference b/w statement 3 and statement5

SELECT JOB FROM EMPLOYEE--if we don't use aggregation function then group by will work as distinct clause to fetch unique value
GROUP BY JOB---statement4

--in statement1 (*) is used for select and count all, seperated by comma job',' so that we can see one more column
--and then group by similiar jobs
--in statement2 count(job) is used for particularly counting job column only while in statement1 count(*) is used 
--for counting from the entire table grouped by job then.
--in the above statement3 we can see that the count for total no job position has done


--can we use groupby clause to fetch the data from multiple table as well?
--no, it will work for single table values only

--suppose if we miss a value(blank value) in column then how will the count aggregator fetch the data??
--let's find out
SELECT *FROM EMPLOYEE
INSERT INTO EMPLOYEE VALUES(101,'KONG','','2020-10-20',20000,50)

SELECT JOB, COUNT(JOB) AS TOTAL_POSITONS FROM EMPLOYEE
GROUP BY JOB---group by will still count even if kong's job position is blank---answer
DELETE FROM EMPLOYEE WHERE ENAME='KONG'
SELECT *FROM EMPLOYEE

use revision

SELECT JOB, SUM(SALARY) AS TOTAL_OUTAGE FROM EMPLOYEE
GROUP BY JOB
SELECT *FROM EMPLOYEE

SELECT JOB, MAX(SALARY) AS MAX_OUTAGE, MIN(SALARY) AS MIN_OUTAGE, AVG(SALARY) AS AVG_OUTAGE FROM EMPLOYEE
GROUP BY JOB

--where clause do not work with aggregation function like count, min, max etc. that is why we use having clause
--that is why having clause has been introduced to databases

SELECT JOB, COUNT(*) AS NO_OF_EMPLOYEES FROM EMPLOYEE
GROUP BY JOB

SELECT JOB, COUNT(*) AS NO_OF_EMPLOYEES FROM EMPLOYEE
GROUP BY JOB
WHERE COUNT(*)>1----see it is not executed

SELECT JOB, COUNT(*) AS NO_OF_EMPLOYEES FROM EMPLOYEE
GROUP BY JOB
HAVING COUNT(*)>1

SELECT *FROM EMPLOYEE
SELECT JOB, COUNT(*) AS NO_OF_EMPLOYEES FROM EMPLOYEE
GROUP BY JOB
HAVING COUNT(*)>1
ORDER BY EMPNO ASC---after firing this query, an error occurs, it says Column "EMPLOYEE.EMPNO" is invalid in
--the ORDER BY clause because it is not contained in either an aggregate function or the GROUP BY clause.
--so to fix this we need to add aggregation used in having clause to the orderby keyword as well
--so
SELECT JOB, COUNT(*) AS NO_OF_EMPLOYEES FROM EMPLOYEE
GROUP BY JOB HAVING COUNT(*)>1 ORDER BY COUNT(*) ASC

SELECT JOB, COUNT(*) AS NO_OF_EMPLOYEES FROM EMPLOYEE
GROUP BY JOB HAVING COUNT(*)>1 ORDER BY COUNT(*) DESC

SELECT *FROM EMPLOYEE

--what is use of pi and out in sql server?
--pi() this function in ssms is used to return the constant float value of math Pi. the default number of decimal
--places displayed is seven, but ssms uses the full double-precision value internally.

--out --out is a parameter that is used to return the value from a stored procedure similarly,
--in --in is also a parameter that is used to return the value from a stored procedure
use revision

-----------------------------	SCALER FUNCTIONS--------------------------
--scaler functions means single functions
--these functions are common in excel, powerbi and sql as well
--Ucase -this function converts the string value into uppercase
--Lcase - this function converts the string value into lowercase
--Proper - this functions is not present in sql server but in other rdbms it will return first letter in upper 
-----------followed by lower
--Left - it will return the n no. of characters form left
--Right - it will return the n no. of characters from right
--substring - extract substing(middle part) in sql from columns values having string datatypes
--Len - it returns the length of the text values in the column
--Round - it will round off the a numeric value to the nearest integer
--Getdate - it will return current system date and time
--Format - is used to format how a field must be displayed

--SYNTAX--
--LOWER - Lcase
--select LOWER(column_name)from table_name

SELECT LOWER(JOB) FROM EMPLOYEE--LOWER

SELECT UPPER(JOB) FROM EMPLOYEE--UPPER

SELECT JOB, LEN(JOB) FROM EMPLOYEE--LENGTH

SELECT JOB, LEFT(JOB,2) FROM EMPLOYEE--LEFT- SYNTAX- LEFT(column_name,2)

SELECT JOB, RIGHT(JOB,3) FROM EMPLOYEE--RIGHT--SYNTAX- RIGHT(column_name,2)

SELECT JOB, SUBSTRING(JOB,2,4) FROM EMPLOYEE--SUBSTRING-SYNTAX- SUBSTRING(column_name,2,3) here 2&3 are positions

SELECT SALARY, ROUND(SALARY,1) FROM EMPLOYEE--ROUND-SYNTAX- ROUND(column_name,2) 

SELECT GETDATE()---it will give current date and time

SELECT GETDATE()+1---it will give the date form tommorrow

SELECT GETDATE()-2---it will give the date of days back

use revision

----------------------------------------------------6th class---------------------------------------------------------

------------------------------views---------------------------------
--views are VIRTUAL TABLE or LOGICAL TABLE  
--they are designed for using them again and again, i.e. why they also referes as BASE TABLES
--when we create view the DATA DO NO GET STORED
--in views the 'SELECT' query statement is the place where our DATA WILL BE STORED

--there are two types of views
--SIMPLE VIEW--in simple view we are working on a single table
--COMPLEX VIEW--but in complex view we are working on multiple table

--simple view supports the 'DML OPERATIONS'(like INSERT, UPDATE)
--the data in simple view can be updated at any given time
--that is why they are also refered as UPDATABLE VIEW

--COMPLEX VIEW - when we want to access MULTIPLE BASE TABLES we will be working with complex view
--in few databases the dml operations are supported in complex view
--but in SQL SEREVER BOTH the view SIMPLE and COMPLEX supports the DML operations
--these COMPLEX VIEW are called as NON-UPDATABLE VIEWS

--THERE IS ONE MORE TYPE OF VIEW CALLED AS MATERIALISED VIEW, research it and find out about it
--and there is one more way to classify views as read only view, updatable view and materailsed view

--SYNTAX OF VIEW
------------------CREATE VIEW <VIEW_NAME>
------------------AS SELECT *FROM <TABLE_NAME>
------------------WHERE CONDITION;

CREATE VIEW V1
AS SELECT *FROM EMPLOYEE

SELECT *FROM EMPLOYEE
SELECT *FROM V1

--try creating more view with different column_names instead of * 
--haven't tried it yet. Yet to be tried and created

UPDATE V1
SET SALARY = 95000----set is used here to specify the location 
WHERE EMPNO = 7782----while updating the view, the base table also get updated 

DELETE V1 
WHERE EMPNO= 7934---here i havn't executed as it will delete the data 

--suppose if i update or delete something from the base table so this will reflect on the view as well which we 
--have created earlier of same dataset?

--let's find out
DELETE FROM EMPLOYEE 
WHERE JOB = 'SALESMAN'

SELECT *FROM EMPLOYEE
SELECT *FROM V1 

--------------------------------------TCL COMMANDS-----------------------
---Commit
---Rollback

--commit command is used to make the transaction permanent by explicit(user)
--rollback command is used to cancel a transaction

---Transaction can be performed using 3 operations
---Insert
---Update
---Delete

---SYNTAX
---begin transaction
---<write statement>
---commit

---SYNTAX for ROLLBACK
---begin transaction
---rollback

CREATE TABLE BRANCH
(
BCODE INT,
BNAME VARCHAR(20),
LOCATION VARCHAR(30)
)

SELECT *FROM BRANCH

INSERT INTO BRANCH VALUES(1011, 'SBI', 'BANGLORE')----commiting implicitly

BEGIN TRANSACTION 
ROLLBACK

SELECT *FROM BRANCH---now see even after we have rollback the data is still showing in the table
--it is because we have not used the statement BEGIN TRANSACTION

--now execute again the insert command with another data but this time use BEGIN TRANSACTION and then try to
--use the rollback command and see what happens

INSERT INTO BRANCH VALUES (1012, 'ICICI', 'DELHI')

DELETE FROM BRANCH WHERE BNAME='ICICI'---ok my mistake i haven't use begin transaction this time as well,i.e.y, using
-------------this delete statement here, now again excecuting the above insert statement by writing once again
BEGIN TRANSACTION
INSERT INTO BRANCH VALUES (1012, 'ICICI', 'DELHI')

SELECT *FROM BRANCH---table is showing two rows
--now use rollback command after using begin transaction before using insert statement

BEGIN TRANSACTION
ROLLBACK

SELECT *FROM BRANCH---see here the insert command has rollbacked and now only single row is visible in the table

--now use COMMIT command as well

BEGIN TRANSACTION
INSERT INTO BRANCH VALUES(1013, 'HDFC', 'PUNE')
COMMIT--------here we are commiting explicitly

BEGIN TRANSACTION
ROLLBACK

SELECT *FROM BRANCH---see here it is not rolling back coz we have commit the data explicitly

---rollback works only one time but for using multiple time there is command called SAVEPOINT
---by using savepoint we can rollback 5 times

BEGIN TRANSACTION 
UPDATE BRANCH
SET LOCATION = 'MUMBAI'
WHERE BCODE = 1011----earlier it was banglore

SELECT *FROM BRANCH-------banglore has changed to mumbai

BEGIN TRANSACTION 
ROLLBACK---------see after executing rollback command, the data is back to it's previous data i.e. BANGLORE
--check for savepoint command by myself on youtube
---and also check the remaining commands as well which are not covered in our classes like 
---call, expain call, lock, set transaction, set constraint

-------------------------------------------7th class----------------------------------------------------------

--------------------DCL----------------
--GRANT, REVOKE 
--These are the database administrative command, these are only used by database administrator
--sql developers usualy don't have the permission to fire these command as the database administrator will give
--and revoke developers if they join or leave the company or if the move to one database to another database by
--changing teams

--it will be operated like
--SERVER TYPE           :  DATABASE ENGINE
--SERVER NAME           :  xyz...
--AUTHENTICATION        :  AZURE ACTIVE DIRECTORY PASSWORD
--USER NAME             :  harsh@accenture.com
--PASSWORD              :  123...

---here when multiple users are working then every user will have there own username and password
---so because there is scarsity of type of data of grant and revoke we are only understanding the working of grant
---and revoke

---so for this first ADMIN will have to CREATE ROLE of employee and STORED PROCEDURES for employee
--CREATING ROLES                        STORED PROCEDURES
--Harsh - harsh@accenture.com            TABLES, VIEW--(admin will create tables and views as stored procudure as well)
--Poonam - pp....@....                   Read, Write, Full permission
--Shaifali - s........                   Delete---only few developer will have the permission for this command

--NOW SYNTAX for creating roles
--CREATE ROLE ROLE_NAME
--(IDENTIFIED BY PASSWORD)

--GRANT CREATE TABLE - access or privilege on the DB objects

--SYNTAX for GRANT
-- GRANT PRIVILEGE_NAME
-- ON OBJECTS_NAME

--SYNTAX for REVOKE
-- REVOKE PRIVILEGE_NAME
-- ON OBJECT_NAME
-- FROM(USERNAME/ROLENAME)

--or the another SYNTAX for this will somewhat like this
--REVOKE SELECT ON EMPLOYEE FROM TABLE_1--here it will check which user access will admin have to revoke from table_1

--------------------------SUBQUERY--------------------
--SUBQUERY is query within the query
--when we want to use outer query and the inner query
--there are two types of subquery (subquery & corelated-query)
--subquery is divided in to 2 query
--inside query                         --outside query
--first the inside query will execute  --based on that outside will execute
--inside will run 1 time only          --but outside will runs multiple time

--SYNTAX of SUBQUERY
---[SELECT *FROM TABLE_NAME] ---------this is the outer query
---[WHERE =, <, >, <>, <=, >= (    ---these are the conditions, and subquery will always work with open bracket]
---SELECT MAX(COLUMN_NAME) FROM TABLE_NAME)----this is the inner query or subquery

---note- subqueries always work will the aggregators(max, min, count, avg, total...)
------and how to figure out which query should be inner = the query which results gets fast

CREATE TABLE PERSONS
(
C_ID INT PRIMARY KEY,
C_NAME CHAR(20),
DEPT VARCHAR(20),
SALARY MONEY
)

SELECT *FROM PERSONS

--write a sql query to display the max salary form the persons

SELECT MAX(SALARY) AS MAX_SALARY FROM PERSONS

--write a query to display the employee name who is taking home the max salary

SELECT C_NAME, MAX(SALARY) FROM PERSONS
GROUP BY C_NAME --here group by is not giving the employee name who has the highest salary coz group by is used 
-------to group the similiar data

SELECT C_NAME FROM PERSONS---{outer query}
WHERE SALARY =                    ---{    ,,     }
(SELECT MAX(SALARY) FROM PERSONS------50000 output
)---------------------inner query

SELECT C_NAME AS EMP_NAME, SALARY FROM PERSONS
WHERE SALARY = (SELECT MAX(SALARY) FROM PERSONS)

--write a sql query to display employee name who is taking 2nd highert salary from the persons


SELECT C_NAME AS EMP_NAME, SALARY FROM PERSONS
WHERE MAX(SALARY) < (SELECT MAX(SALARY) FROM PERSONS) ---error shown

SELECT C_NAME AS EMP_NAME, SALARY FROM PERSONS
WHERE SALARY <> (SELECT MAX(SALARY) FROM PERSONS)--- all the salary shown except the max salary but we need 2nd highest

SELECT C_NAME AS EMP_NAME, SALARY FROM PERSONS
WHERE SALARY > (SELECT MAX(SALARY) FROM PERSONS)--there is not salary greater than max salary

SELECT C_NAME AS EMP_NAME, SALARY FROM PERSONS
WHERE SALARY < (SELECT MAX(SALARY) FROM PERSONS)--all less than maximum salary is shown

SELECT C_NAME AS EMP_NAME, MAX(SALARY) AS SALARY FROM PERSONS
WHERE SALARY < (SELECT MAX(SALARY) FROM PERSONS) ----it is showing erroe in c_name

SELECT MAX(SALARY) AS SALARY FROM PERSONS
WHERE SALARY < (SELECT MAX(SALARY)FROM PERSONS)---EXECUTED but emp name is not showing along with salary

SELECT MAX(SALARY) AS SALARY FROM PERSONS
WHERE SALARY < (SELECT MAX(SALARY)FROM PERSONS)---mam had not taught further part of query as we were out of time
---and to bring the emp name as well along with 2nd highest salary we need to do group by as well

use revision
---------------------------------------------------------------------------------------------------------------------
------hacker rank question 
--problem statement- find the two smallest and largest c_name by their length of character and print them along with 
--their character length, also if there is more than one c_name of same length then order them in increasing alphabets
select *from persons

select c_name as names, len(c_name) from persons
group by c_name
order by c_name asc, len(c_name) asc

select c_name as names, len(c_name) from persons
where c_name = min(len(c_name))
group by c_name
order by len(c_name)
-----------unsolved 
----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------8th class-------------------------------------------------------------
--DATE FUNCTIONS
--DATE
--TIME
--DATETIME
--CURRENT_TIMESTAMP

CREATE TABLE PEOPLE
(NAME CHAR(20), BIRTH_DATE DATE, BIRTH_TIME TIME, BIRTH_DATETIME DATETIME)

SELECT *FROM PEOPLE

INSERT INTO PEOPLE(NAME, BIRTH_DATE, BIRTH_TIME, BIRTH_DATETIME)
VALUES('HELEN', '1997-08-08', '10:40:30', '1997-08-08 10:40:30')
INSERT INTO PEOPLE VALUES('AMAN','1998-05-02' ,'15:45:30' ,'1998-05-02 15:45:30') 

SELECT CURRENT_TIMESTAMP ---this date function will fetch systems current date & time

SELECT GETDATE--Here i have not used open & closed parenthesis so it is not executed why
--here the mouseover is giving invalid column name getdate
SELECT GETDATE()--but here i have used parenthesis so getdate function is fetching me current date & time why? 
--but when i do a mouse over on this function getdate(), it is showing built-in function GETDATE()RETURNS datetime

--ans-- in the above statement open&closed parenthesis() are used for calling a built-in function, though it is 
-----optional but for good use parenthesis are used so that it will not create a confusion in the sql engine
---that what you are calling

---USE OF PARENTHESIS()
--parenthesis in sql are used to instruct the sql engine about the flow of the sql statement and to gain more control
--over the WHERE clause. They help in overriding the default working process flow of sql engine and ensure that 
--the conditions are evaluated correctly. Here are some key points about using parenthesis in SQL:

--1. CONTROL OVER WHERE CLAUSE: Parentheses are used to group conditions in the WHERE clause, which helps in controling
-----the order of evaluation. This is particularly important when using both AND and OR conditions together.

--2. ORDER OF OPERATIONS: parenthesis helps in specifying the order of operations. In sql, AND operations are evaluated
------before OR operations. Without parenthesis the order of evaluation is not specified, which can lead to unexpected 
------results.

--3. READABILITY AND CLEARITY: parenthesis can be used to make the intention of the code clearer, especially in 
-------complex queries. This is important because sql syntax can be complex and open to misinterpretation. 

--4. OPTIONAL USE: In some cases parenthesis are optional, such as when using simple SELECT statement without AND or OR
-------conditions. However, using parenthesis can still improve readability and avoid potential misunderstandings.

--5. PERFORMANCE IMPACT: In some cases, using parenthesis can effect the performance of the query. For example-in sql
-------server, using parenthesis can influence the optimzation level of the query.

---Here are some examples of how parenthesis are used in sql:

--simple query
-- SELECT * from employees WHERE (department_id=1 or department_id=2) AND salary<3000;

--complex query
-- SELECT * from employees WHERE (department_id=1 or department_id=2) AND (salary<3000 or salary>4000);

--using parenthesis with AND and OR conditions
--SELECT * from employees WHERE (department_id=1 or department_id=2) AND (salary<3000 or salary>4000);

--In summary, parenthesis are used in sql to control the flow of the query, ensure the correct order of operations, 
--improve readability, and sometimes affect performance.

-----------------------UNION, UNION ALL, INTERSECT and EXCEPT-------------------------
--These all are the operators.

--sql union operators is used to combine the results sets of 2 or more SELECT Statments
--it removes duplicates rows/tuple between the various SELECT Statments 
--there are 2conditions in union operator
--1. equal no of expressions/column should present in both the table,at the same their time sequence should also be same
--2. their datatypes must be same, note column names can be different but datatypes must be same

--sql union all operator will fetch all the data from all select statement and it will not remove any duplicate row.

--sql intersect operator will fetch only the common row.

--sql except operator will fetch the result set from the first select statement not from the second(no matching to 
--- each other).

--Note-there is concept of append and merge while adding data to the table, which is
--Append                                     --Merge
--adding at the row level                    --adding at column level
--                  100                        1         2        3
--                  200
--                  300
--this append and merge are same in powerbi and ms excel but in tableau it is known as incremental refresh

CREATE TABLE USER_1
(
NAME CHAR(20),
MOBILE_NO BIGINT,
CITY CHAR(30),
PROFESSION CHAR(20),
SALARY MONEY)

CREATE TABLE USER_2
(
CUS_NAME CHAR(20),-----here cus_name is used just to show that names of column doesn't matter, only datatype and
CUS_MOBILE_NO BIGINT,--and their sequence is what matters here
CITY CHAR(30),
PROFESSION CHAR(30),--similarly this profession can also be replace by occupation
SALARY MONEY)

SELECT * FROM USER_1
SELECT * FROM USER_2

SELECT NAME, MOBILE_NO, CITY, PROFESSION, SALARY FROM USER_1
UNION
SELECT CUS_MOBILE_NO, CUS_NAME, CITY, PROFESSION SALARY FROM USER_2--here the query isn't exected because the sequence
----of column name in 2nd select statement is not same as in the 1st select statement

SELECT NAME, MOBILE_NO, CITY, PROFESSION, SALARY FROM USER_1
UNION --------------------------------------------------------------UNION
SELECT CUS_NAME, CUS_MOBILE_NO, CITY, PROFESSION, SALARY FROM USER_2--see now it executed, and if we see in the output
---result, we can easily see that the duplicates rows are removed, early their were 10rows(5row from each table) 
---now there is only 7, and 3 duplicates are removed

SELECT NAME, MOBILE_NO, CITY, PROFESSION, SALARY FROM USER_1
UNION ALL-----------------------------------------------------------UNION ALL
SELECT CUS_NAME, CUS_MOBILE_NO, CITY, PROFESSION, SALARY FROM USER_2--in union all no duplicate row is removed

SELECT NAME, MOBILE_NO, CITY, PROFESSION, SALARY FROM USER_1
INTERSECT-----------------------------------------------------------INTERSECT
SELECT CUS_NAME, CUS_MOBILE_NO, CITY ,PROFESSION, SALARY FROM USER_2--it will fetch only common rows like inner join

SELECT NAME, MOBILE_NO, CITY, PROFESSION, SALARY FROM USER_1
EXCEPT--------------------------------------------------------------EXCEPT
SELECT CUS_NAME, CUS_MOBILE_NO, CITY, PROFESSION, SALARY FROM USER_2----No matching data


--what is the difference b/w union and joins in sql
--importants point to remember:-

--1. union operator can combine select statment from different tables, but the result set of data from all select 
-----statement will be shown by append row wise after removing duplicates.
-----while in case of joins the table will merge at column level and duplicates can still be present in joins

--2. union operator doesn't require any common column(unlike in joins) but the sequence of the attributes/column
-----name must be same.

--3. the resultant set in both the cases that is union and joins is not a table but is returned as a temporary
-----result set that can be further manipulated using sql commands like SELECT, ORDER BY, GROUBY BY and HAVING.

--4. types of join- there are differen types of joins such as INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN 
-----which determines how the rows are combined.
-----union doesn't have different types, as it simply combines the result sets vertically.


------------------------ROUND OFF---------------------
-- ROUND() --this function is used to round off the decimal values
-----thsi function accepts 4types of values i.e. positive, negative, zero, fraction

-------SYNTAX---ROUND(specify the no. we want to round off, how many decimals we want to add, what operation we want to perform)
-----------------ROUND(NUMBER, DECIMAL, OPERATION) --here operation is optional
-------------the operation is like if the value is one then provide one, and if the value is not zero than provide default no.
 
 --for eg-- ROUND(15.3456,2) so the answer will be 15.3600
 ---so basically round() is the operator and it can be clubed with aggregators as well.
 ----for eg: ROUND(MAX(SALARY))


 -----------------------------------------------SQL MASTERCLASSES BY RUCHIKA MAM REVISION------------------------------------------
 --Windows Functions--
 --windows functions also known as analytical functions
 --there are many functions which comes in windows function category but few are commonly used most like
 --lag(), lead(), row_no(), rank(), dense_rank()
 --when do we use them - when there are multiple conditions in single statment then we use windows functions 

 CREATE TABLE EMPLOYEES
 (EMP_ID INT PRIMARY KEY, EMP_NAME CHAR(20), DEPT_NAME CHAR(20), SALARY MONEY)

 SELECT * FROM EMPLOYEES 

 INSERT INTO EMPLOYEES VALUES 
 (101, 'MOHAN', 'ADMIN', 4000),
 (102, 'RAJ', 'HR', 3000),
 (103, 'AKHIL', 'IT', 65000),
 (104, 'DAVID', 'FINANCE', 1300),
 (105, 'PREET', 'ADMIN', 7000),
 (106, 'RAHUL', 'HR', 8000),
 (107, 'AMIT', 'IT', 44000),
 (108, 'RUCHIKA', 'FINANCE', 35000),
 (109, 'AYUSHI', 'ADMIN', 89000),
 (110, 'RAJ', 'IT', 15000),
 (111, 'MARVEL', 'IT', 66000),
 (112, 'ROBB', 'MECHANICAL', 22000),
 (113, 'ROBIN', 'ADMIN', 54000),
 (114, 'SANDEEP', 'ELECTRICAL', 69000),
 (115, 'JAY', 'IT', 99000),
 (116, 'MEHUL', 'FINANCE', 27000),
 (117, 'VARUN', 'ADMIN', 68000),
 (118, 'RAJ', 'MECHANICAL', 42000),
 (119, 'AMIT', 'IT', 14000),
 (120, 'AYUSHI', 'FINANCE', 12000)

 SELECT * FROM EMPLOYEES

 --SHOW me the max salary from the employees table
 SELECT MAX(SALARY)MAX_SALARY FROM EMPLOYEES

 --along with the max salary show me the department name
 SELECT DEPT_NAME, SALARY FROM EMPLOYEES GROUP BY DEPT_NAME, SALARY
 SELECT DEPT_NAME, MAX(SALARY)MAX_SALARY FROM EMPLOYEES GROUP BY DEPT_NAME--now from this statement we can see that with aggregated
--column we can't use plain column so we have to use plain column in group by to aggregate
 --GROUP BY CLAUSE will be the one who allows non-aggregation & aggregation together.

--NOW along with the max of salary give the department & other details
  SELECT DEPT_NAME,emp_id, emp_name,salary, MAX(SALARY)MAX_SALARY FROM EMPLOYEES GROUP BY DEPT_NAME,emp_id, emp_name,salary
--see by adding all column names in group by clause didn't give the proper answer 
--so for this we need windows function

--now for windows function
  SELECT DEPT_NAME, MAX(SALARY)MAX_SALARY FROM EMPLOYEES E--remove dept_name and replace E.* to fetch all columns from employees
  --here E.* MEANS *(all) FROM E(employees table).
  
  SELECT E.*, MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES E--so to overcome non-aggregation & aggregation condition we will use
  --OVER( ) CLAUSE which is a windows function 

  SELECT E.*, MAX(SALARY) over() AS MAX_SALARY FROM EMPLOYEES E--now here by typing over() function we are telling the sql 
  --that treat this max(salary) over() as a analytical or a windows function not as an aggregator
  --so here what over() clause will do is make a window of records 
  --this statement is giving the with all columns and max salary with over all department
  --now in next step we will see the all columns with max salary dept wise

  --now to see max salary corresponding to each department 
  --now for this we need partition by of windows function--------------------------partition by-------------------

  SELECT E.*, MAX(SALARY) OVER(PARTITION BY DEPT_NAME) AS MAX_SALARY FROM EMPLOYEES E
  --see the difference
  SELECT E.*, MAX(SALARY) over() AS MAX_SALARY FROM EMPLOYEES E
  --in the above statement 'MAX(SALARY) OVER(PARTITION BY DEPT_NAME)' is now not working as simple aggregate function but
  --aggregation function of windows functions instead.
  
  --so if we have to expain above statement to someone in simple works 
  --first over() clause has created a window then
  --second partition by has divided the window of record by dept name and then
  --max of salary is working

  --so in the above queries we can use all aggregators like (AVG,MIN,MAX,count etc...)

  ---------------------------------ROW NUMBER-----------------------------------------------
--next windows function is row number

SELECT E.*, ROW_NUMBER() OVER() AS RN FROM EMPLOYEES E--here error is saying 'ROW_NUMBER must have an OVER clause with ORDER BY'.

SELECT E.*, ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS RN FROM EMPLOYEES E
--so here if we want to see which employee has joined the first department wise or
--which employee is the oldest employee department wise

--fetch the first two employee from each department along with all the records
SELECT * FROM (SELECT E.*, ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS RN FROM EMPLOYEES E) A
WHERE A.RN<3;

---NOTE : Here query is given aliases, so from here we can see that not only table name or column name but we can give aliases to 
----------query or statement as well

---------and ' . ' fullstop works as 'of' for eg: A.RN<3 here fullstop means RN out of A(table) is fetched out which is less than 3

--------------------------------------------2nd MasteClasss by Ruchika mam-----------------------------------------------

---RANK() function

--fetch the top 3 employees in each department having the max salary
SELECT E.*, RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) FROM EMPLOYEES E 

SELECT E.*, RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC)AS RNK FROM EMPLOYEES E 
--so in the output we can see that it has given a rank on all the record based on their salary in a window of dept_name
--NOTE : if there is no salary in the record the rank will not be given to the record 

--what will happen if we have duplicates values while ranking the records ?
---so i have changed the salary in two record 1st is MOHAN-ADMIN(4000 to 7000) and DAVID-FINANCE(1300 to 35000)
---now if we execute the above query the output will give the result as 
---EMP_NAME	           DEPT_NAme                 SALARy    RNK
--- AYUSHI             	ADMIN               	89000.00	1
--- VARUN              	ADMIN               	68000.00	2
--- ROBIN              	ADMIN               	54000.00	3
--- MOHAN              	ADMIN               	7000.00 	4
--- PREET              	ADMIN               	7000.00	    4--here we can see same rank has been given to both the records but

--- DAVID              	FINANCE             	35000.00	1--if we see here the rank after 1-1 directly jumped to 3
--- RUCHIKA            	FINANCE             	35000.00	1
--- MEHUL              	FINANCE             	27000.00	3--it has skipped the 2 rank
--- AYUSHI             	FINANCE             	12000.00	4

--so from above operation we can see that rank function has skipped few ranks
--so in order to deal with this will we need dense_rank()function

SELECT E.*, DENSE_RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) AS DENSE_RNK FROM EMPLOYEES E
-- see the difference b/w rank and dense rank inthe next statement 

SELECT E.*, RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) RNK, 
DENSE_RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC)DENSE_RNK FROM EMPLOYEES E
--so from above statment the o/p is as follows

--EMP_NAME	      DEPT_NAME	         SALARY	   RNK DENSE_RNK
-- AYUSHI          	ADMIN         	89000.00	1	1
-- VARUN           	ADMIN          	68000.00	2	2
-- ROBIN           	ADMIN          	54000.00	3	3
-- MOHAN           	ADMIN         	7000.00 	4	4
-- PREET          	ADMIN          	7000.00 	4	4

-- DAVID          	FINANCE         35000.00	1	1
-- RUCHIKA         	FINANCE        	35000.00	1	1
-- MEHUL           	FINANCE         27000.00	3	2--here we can see that with dense rank no rank is skipped
-- AYUSHI          	FINANCE       	12000.00	4	3

--lets make one value of salary in IT dept as null then lets see what will the above statement give
--lets make AMIT in IT as NULL from 44000

SELECT E.*, RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) RNK, 
DENSE_RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC)DENSE_RNK FROM EMPLOYEES E
--so by firing this query we can clearly see that Null value has given the last rank

-- EMP_ID	EMP_NAME	DEPT_NAME	SALARY	   RNK DENSE_RNK
--  115	    JAY             IT     	99000.00	1	1
--  111    	MARVEL         	IT      66000.00	2	2
--  103	    AKHIL          	IT      65000.00	3	3
--  110	    RAJ             IT      15000.00	4	4
--  119	    AMIT           	IT      14000.00	5	5
--  107	    AMIT           	IT      NULL	    6	6


--what is difference b/w rank, dense rank and row number
SELECT E.*, RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC)RNK,
DENSE_RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC)DENSE_RNK,
 ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC)RN FROM EMPLOYEES E

-- EMP_ID	EMP_NAME	DEPT_NAME	SALARY	   RNK	DENSE_RNK	RN
--  109	     AYUSHI       ADMIN     89000.00	1	    1	    1
--  117	     VARUN        ADMIN     68000.00	2	    2	    2
--  113	     ROBIN        ADMIN     54000.00	3	    3	    3
--  101	     MOHAN        ADMIN     7000.00	    4	    4	    4
--  105	     PREET     	  ADMIN     7000.00	    4	    4	    5

SELECT E.*, RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) RNK,
DENSE_RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) DENSE_RNK,
ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) RN FROM EMPLOYEES E
--NOW in this query what i have done is changed the order by salary desc to order by emp_id in Row_number()over()clause 
--and the o/p is giving the result based on order by emp_id despite the order by salary desc has been used two times in rank and
--dense rank
-- i guess it is because the emp_id is primary key or because the row number is more powerful function than rank and dense rank
-- or because i have used the row number is last 
--- lets use row number in b/w rank and dense rank and than observe

SELECT E.*, RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) RNK,
ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) RN,
DENSE_RANK()OVER(PARTITION BY DEPT_NAME ORDER BY SALARY DESC) DENSE_RNK FROM EMPLOYEES E
--still showing the earlier result so it is because primary key is row number clause

--now one question arises that why we don't use any column of value in the parenthesis of RANK() & DENSE_RANK() 
--because firstly it will by more specify but secondly which is more often is 
--the resultant set which comes after the over(partition and order by)clause, the rank() & dense_rank() will help in finalising 
--that result
--though we can use rank(column_name), dense rank(column_name or value) as well


----------------------------------------LAG, LEAD windows function-------------------------------------------

--------LAG() function

--fetch a query to display if the salary of the employee is higher, equal or lower than the previous employee	

SELECT E.*, LAG() OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS PREVIOUS_EMP_SALARY FROM EMPLOYEES E
--it is giving error as LAG() takes 1 and 3 arguments, so for this..
SELECT E.*, LAG(SALARY) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS PREVIOUS_EMP_SALARY FROM EMPLOYEES E

--observe the o/p 
--EMP_ID	EMP_NAME	DEPT_NAME	  SALARY	PREVIOUS_EMP_SALARY
--101	     MOHAN        ADMIN       7000.00	    NULL--if we see here the previous before 7000 is not present so is showing null
--105	     PREET        ADMIN       7000.00	    7000.00--and here the previous salary is 7000 so it showed it as 7000
--109	     AYUSHI       ADMIN       89000.00      7000.00
--113	     ROBIN        ADMIN       54000.00	    89000.00
--117	     VARUN        ADMIN       68000.00	    54000.00
--114	     SANDEEP      ELECTRICAL  69000.00	    NULL-----similary here no previous salary for electrical so null
--104	     DAVID        FINANCE     35000.00      NULL-----same here
--108	     RUCHIKA      FINANCE     35000.00	    35000.00--but here the earlier salary of 35000 is present so it is shown
--116	     MEHUL        FINANCE     27000.00	    35000.00
--120	     AYUSHI       FINANCE     12000.00	    27000.00
--102	     RAJ          HR          3000.00	    NULL-----same here
--106	     RAHUL        HR          8000.00	    3000.00---and here as well

SELECT E.*, LAG(SALARY,1,0) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS PREVIOUS_EMP_SALARY FROM EMPLOYEES E
--here 1,0 denotes that the check for the 1 previous records and put the value 0 if not record is present there

SELECT E.*, LAG(SALARY,2,0) OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS PREVIOUS_EMP_SALARY FROM EMPLOYEES E
--similarly here 2,0 denotes that the check for the 2 previous records and put the value 0 if not record is present there

--------LEAD() function----------------

SELECT E.*, LEAD(SALARY)OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS NEXT_EMP_SALARY FROM EMPLOYEES E
---it will show the next employee salary

--see the diff. b/w LAG & LEAD function
SELECT E.*, LAG(SALARY)OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS PREVIOUS_EMP_SALARY,
LEAD(SALARY)OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID) AS NEXT_EMP_SALARY FROM EMPLOYEES E

------------------------------------CASE WHEN STATEMENT-----------------------------

--Check if the employee salary is of higher range or lower range taking the above statement

SELECT E.*, LAG(SALARY)OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID)AS PREVIOUS_EMP_SALARY,
CASE WHEN E.SALARY > LAG(SALARY)OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID)
       THEN 'HIGHER THAN PREVIOUS EMPLOYEE'
	WHEN E.SALARY < LAG(SALARY)OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID)
	   THEN 'LOWER THAN PREVIOUS EMPLOYEE'
	WHEN E.SALARY = LAG(SALARY)OVER(PARTITION BY DEPT_NAME ORDER BY EMP_ID)
	   THEN 'SAME AS PREVIOUS EMPLOYEE'
	END as SALARY_RANGE
FROM EMPLOYEES E

--if we breakdown SYNTAX of above statement
--select e.*, lag(salary)over(partition by dept_name order by emp_id)as previous_emp_salary, --this statement will give all columns
-----with one more column of salary showing the previous employee salary

--case when e.salary > lag(salary)over(partition by dept_name order by emp_id)---------  this is first case
---------then 'higher than previous salary' -----------and this print the case condition result

-------when e.salary < lag(salary)over(partition by dept_name order by emp_id)---------- this is the second case
---------then 'lower than previous salary' -----------this will print the second case result

-------when e.salary = lag(salary)over(partition by dept_name order by emp_id)---------- this is the third case 
---------then 'same as previous salary'  -------------this will print the third case result

--end as salary_range -------------------here end is written to close the case statements and as salary_range is aliases used
----------------------   note : the case statements always comes before the from statement 
--from employees e  ------------------this is obvious from table name

-- easy SYNTAX for case statements 
---SELECT */COLUMN_NAME/(COLUMN_NAME based on condition like windows function or other), CASE-Statements END aliase column_name
---FROM TABLE_NAME aliases


---  there few more windows functions as 

------FIRST_VALUE(column) : Returns the first value in an ordered set of values.
------LAST_VALUE(column) : Returns the last value in an ordered set of values.
------CUME_DIST()     : Calculates the cumulative distribution of a value in a group of values.
------NTILE(n)      :  
------NTH_VALUE     :
------PERCENT_RANK()  :  Calculates the relative rank of a value in a group of values.
------PERCENTILE_COUNT(percentile) : Calculates the continuous percentile value based on the distribution of values.
------PERCENTILE_DISC(percentile) : Calculates the discrete percentile value based on the distribution of values. 
------STRING_AGG(column,seperator) : Concatenates all values in a column into a single string, separated by the specified separator.
------ROW_NUMBER(): Assigns a sequential integer number to each row within a partition, starting with 1.
------RANK(): Assigns a rank to each row within a partition, with ties receiving the same rank and subsequent rows receiving a rank
------------  that is one greater than the previous non-tied rank.
------DENSE_RANK(): Assigns a rank to each row within a partition, with ties receiving the same rank and subsequent rows 
------------------  receiving a rank that is one greater than the previous distinct rank.
------LAG(column, [offset], [default_value]): Retrieves a value from a previous row.
------LEAD(column, [offset], [default_value]): Retrieves a value from a subsequent row.
------FRAME_CLAUSE  : 
------ROW B/W FRAME_CLAUSE  : 
------RANGE B/W FRAME_CLAUSE: 
------RUNNING SUM/AVG type queries :
------weekly/monthly/yearly running SUM/AVG type queries


-----------------------------------------CTE function----------------------------------------

--WITH CLAUSE - with clause is also known as CTE
--Common Table Expression
--there is more less often heard of name of CTE(WITH clause) is Subquery Factoring

--fetch employees who's salary is more than the avg.salary of all the employees
select * from employees

select emp_id , salary, avg(salary)over()as avg_salary from EMPLOYEES

select emp_id , salary from EMPLOYEES where employees.salary > (select avg(salary)from employees)--it executed but if i want to 
--avg_salary column along with the emp_id than how to do it
select emp_id , salary, avg(salary)over()as avg_salary from EMPLOYEES where employees.salary > (select avg(salary)from employees)

select emp_id , salary, avg(salary)over()as avg_salary from EMPLOYEES where employees.salary < (select avg(salary)from employees)

select emp_id , salary, avg(salary)over()as avg_salary from EMPLOYEES where employees.salary = (select avg(salary)from employees)


select emp_id , emp_name ,dept_name, salary from EMPLOYEES where employees.salary > (select avg(salary)from employees)

select e.* from EMPLOYEES e where e.salary > (select avg(salary)from employees)

select e.* from EMPLOYEES e where e.salary > (select avg(salary)from employees) group by DEPT_NAME--not executed 

select e.* from EMPLOYEES e group by DEPT_NAME where e.salary > (select avg(salary)from employees)--error

--now perform the above query with cte function or	WITH Clause

--WITH Clause will make a temporary table and out of that we will fetch our result
--WITH Clause is used always before the select statement or along with select statement

WITH AVERAGE_SALARY(AVG_SAL) AS (SELECT AVG(SALARY) FROM EMPLOYEES)---this is calculation part
SELECT * FROM EMPLOYEES E, AVERAGE_SALARY AV WHERE E.SALARY > AV.AVG_SAL

--if i try to break down the above statement of WITH Clause

--here WITH AVERAGE_SALARY(AVG_SAL) AS (SELECT AVG(SALARY) FROM EMPLOYEES)--is used before the select statement of next line
-----because it will make an another table named as AVERAGE_SALARY. And this AVERAGE_SALARY is temporary table which vanishes when
-----query is fired.
--SELECT * FROM EMPLOYEES E, AVERAGE_SALARY AV WHERE E.SALARY > AV.AVG_SAL

--in this line AVERAGE_SALARY(AVG_SAL) AS (SELECT AVG(SALARY) FROM EMPLOYEES)
----values from this statement (SELECT AVG(SALARY) FROM EMPLOYEES) will going to be assigned in AVERAGE_SALARY table by aliases AS
----- and from this table AVERAGE_SALARY(AVG_SAL) column AVG_SAL will be used in next SELECT statement

--then this statement 
----------'WITH AVERAGE_SALARY(AVG_SAL) AS (SELECT AVG(SALARY) FROM EMPLOYEES)---this is calculation part
-----------SELECT * FROM EMPLOYEES E'
---will fetch the orignal table though by WITH Clause we have created another column AVG_SAL but we haven't used it yet
---now in above line we are going to use it

--WITH AVERAGE_SALARY(AVG_SAL) AS (SELECT AVG(SALARY) FROM EMPLOYEES)---this is calculation part
--SELECT * FROM EMPLOYEES E, AVERAGE_SALARY AV
--------now this statement will fetch the average_salary table along with employees table as we can see by running this statement
--------but it will bring all the records of employees table along with average_salary table

---now if we want to only fetch the emp's who are earning more than average salary, we need to give condtion
--for that where clause is used 'WHERE E.SALARY > AV.AVG_SAL'
--now this will fetch all the records from employees table along with avg_sal column whose salary is above average salary

--CAST() function - this function is used to convert the data type of the value of result
WITH AVERAGE_SALARY(AVG_SAL) AS (SELECT CAST(AVG(SALARY)AS INT) FROM EMPLOYEES)---now see the diff. in both the queries
SELECT * FROM EMPLOYEES E, AVERAGE_SALARY AV WHERE E.SALARY > AV.AVG_SAL--what is does is convert the AVG_SAL value in to integer

WITH AVERAGE_SALARY(AVG_SAL) AS (SELECT AVG(SALARY) FROM EMPLOYEES)---this query is original query where cast() is not used
SELECT * FROM EMPLOYEES E, AVERAGE_SALARY AV WHERE E.SALARY > AV.AVG_SAL

--another way of doing the above statement which is propoed by shlokk
WITH A_SAL AS (SELECT *,AVG(SALARY)OVER()AS AVGG_SALL FROM EMPLOYEES)
SELECT * FROM A_SAL
WHERE SALARY > AVGG_SALL

------------------------------------------------------------------------------------------------------------
--example of interview question asked by ruckika mam to someone in their company hiring process, the question was for 3.5years of 
--experience person

----note the data is not stored in my database it is just a imaginary case and answer- so no need to fire the query

--the question is 

-----find store whose sales is better than the avg sales across all stores
-----TABLE NAME     :  SALES_OF_ALL_STORES
-----column names   :  store_id, store_name, product, quantity, price

---mam has break this question into 3parts to solve

--a). find the total_sales of all the stores-------PRODUCT * QUANTITY * PRICE
--b). find the avg_sale of all the stores----------AVG(SALE)
--c). fetch the data comparing with total_sales > avg_sales

--sor for a). SELECT STORE_NAME, PRODUCT * QUANTITY * PRICE AS TOTAL_SALE FROM SALES_OF_ALL_STORES GROUP BY STORE_NAME

----- for b). SELECT STORE_NAME, AVG(SALE) FROM SALES_OF_ALL_STORES GROUP BY STORE_NAME

----- for c). WITH STORES_PERFORMING_WELL AS 
--------------((SELECT STORE_NAME, PRODUCT * QUANTITY * PRICE AS TOTAL_SALE FROM SALES_OF_ALL_STORES GROUP BY STORE_NAME)A 
---------------FULL OUTER JOIN (SELECT STORE_NAME, AVG(SALE) FROM SALES_OF_ALL_STORES GROUP BY STORE_NAME)B 
---------------ON A.STORE_NAME=B.STORE_NAME))
--------------SELECT STORE_NAME, A.TOTAL_SALE, B.AVG(SALE)  FROM STORES_PERFORMING_WELL
--------------WHERE A.TOTAL_SALE > B.AVG(SALE)

---the above statement is attempted by me 
---below is the statement given by ruchika mam

-- a). SELECT S.STORE_ID, SUM(PRICE)AS TOTAL_SALES_PER_STORE FROM SALES.S GROUP BY S.STORE_ID

-- b). SELECT AVG(TOTAL_SALES_PER_STORE) AS AVERAGE_SALES_FOR_ALL_STORES FROM  
--------(SELECT S.STORE_ID, SUM(PRICE)AS TOTAL_SALES_PER_STORE FROM SALES.S GROUP BY S.STORE_ID)A 
------------------OR(if we need to cast the AVERAGE_SALES_FOR_ALL_STORES as integer----then------

---------SELECT CAST(AVG(TOTAL_SALES_PER_STORE) AS INT) AS AVERAGE_SALES_FOR_ALL_STORES FROM  
--------   (SELECT S.STORE_ID, SUM(PRICE)AS TOTAL_SALES_PER_STORE FROM SALES.S GROUP BY S.STORE_ID)A 

-- C). this part was not covered in class because were busy in checking other participants resume and forgot to answer it.


----------------------COMPOSITE KEY---------------------------------------------
--SYNTAX OF COMPOSITE KEY
CREATE TABLE XYZ
(
DEPT_ID INT PRIMARY KEY(DEPT_ID,DEPT_NAME),
DEPT_NAME CHAR(20),
LOCATION VARCHAR(50)
)
-------------------------------------------------------------------------------------

--CHARINDEX - this function will help us to find out the position of delimiter in the concatenated string

select *from employees

SELECT CHARINDEX(',',EMP_NAME)AS DELIMITER_COUNT FROM EMPLOYEES--here we are finding position of delimiter

SELECT LEFT(EMP_NAME,CHARINDEX(',',EMP_NAME))AS DELIMITER_COUNT FROM EMPLOYEES--fetch the data before delimiter

SELECT LEFT(EMP_NAME, CHARINDEX(',',EMP_NAME)-1)AS DELIMITER_COUNT FROM EMPLOYEES--removing of , from the output
--here the output is coming of fraction of second but maybe due to trial version(developer version of ssms) error is showing


-----------CROSS APPLY------------------------------

--what cross apply does is split the value into multiple columns

select * from employees

SELECT VALUE AS SPLIT_VALUE FROM EMPLOYEES 
CROSS APPLY string_split(EMP_NAME,',')

----------CONCATENATE--------------------------

--how to concatenate two columns

--Method 1 : 
SELECT EMP_ID, DEPT_NAME, CONCAT(EMP_ID,'-',DEPT_NAME) AS EMP_DEPT_NAME FROM EMPLOYEES

--Method 2 :
SELECT EMP_ID, DEPT_NAME, (EMP_ID+'-'+DEPT_NAME) AS EMP_DEPT_NAME FROM EMPLOYEES
--an error is coming stating that- when converting the varchar value 'ADMN        ' to data type int.

SELECT EMP_ID, DEPT_NAME, cast(EMP_ID+'-'+DEPT_NAME)as varchar FROM EMPLOYEES
---again error

SELECT EMP_ID, DEPT_NAME, cast((EMP_ID+'-'+DEPT_NAME)as varchar) FROM EMPLOYEES
--still the same error is coming- when converting the varchar value 'ADMN        ' to data type int.

--so Method 2 only works when we same king of data type in both the column which we are concatinating

--------------CASE STATEMENT--------------------------

--there are two type in it
--1). case statement
--2). case expression

--for 1). syntax -case statement
--TABLE_NAME : PAYMENT
SELECT CUS_ID, AMOUNT, 
CASE 
    WHEN AMOUNT >= 100 THEN 'EXPENSIVE PRODUCT'----here AMOUNT is the column name
	WHEN AMOUNT >50 AND AMOUNT < 100 THEN 'REGULAR PRODUCT'
	ELSE 'CHEAP PRODUCT'
END AS PRODUCT_PRICE_TYPE
FROM PAYMENT

--for 2). sytax -case expression

SELECT CUS_ID, 
CASE  AMOUNT
    WHEN value_1 >= 100 THEN 'EXPENSIVE PRODUCT'--the basic diff. b/w case statement & case expression is here instead of 
	WHEN value_2 >50 AND AMOUNT < 100 THEN 'REGULAR PRODUCT'--column name AMOUNT value_1 and value_2 is used 
	ELSE 'CHEAP PRODUCT'
END AS PRODUCT_PRICE_TYPE
FROM PAYMENT

---for example

SELECT *, CASE 
               WHEN SALARY >= 70000 THEN 'HIGH SALARY'
			   WHEN SALARY >= 50000 AND SALARY < 70000 THEN 'MEDIUM SALARY'
			   ELSE 'LOW SALARY'
          END AS SALARY_RANGE
FROM EMPLOYEES ---executed successfully

------------------------CONDITIONAL BASE JOIN----------------------------

--OR DYNAMIC JOINS ON MULTIPLE TABLE
---OR LOOKUP TABLES

---so let's assume there are 3 to 4 tables and we have to join them based on condition

use revision

------------------------------------------------------------------------------------

--suppose i need to join two tables without having common column
--so for this i am not sure but i think this strategy wil work
--first i need to cross join two tables 
--then i need to remove duplicates by giving them row number

--lets try
select * from EMPLOYEE
select * from BRANCH

select * from EMPLOYEE cross join BRANCH
select * from (select * from EMPLOYEE cross join BRANCH)eb
--here i can see the only the second table's data is duplicated but we want entire row of joined tables to be duplicated 
--not just one

--so perlexity is giving 3ways to join two tables which don't have common column
---1). cross join
---2). union and union all
---3). derived tables

--so in 1 & 2 case it is not the best practise as we will not get the duplicated values because 
--cross product will give the cartesian type product where only second tables will only be duplicated
--and in union and union all we will need equal no of column along with their datatype same so as to stack the date of both tables
--one on another.

--so only Derived tables left to check lets find out if it is working or not

--SYNTAX

----SELECT t1.*, t2.*
----FROM (SELECT * FROM table1) t1
----CROSS JOIN (SELECT * FROM table2) t2;

SELECT T1.*, T2.* FROM (SELECT * FROM EMPLOYEE)T1 
CROSS JOIN (SELECT * FROM BRANCH)T2
---this also not working because it is also working as a cross join

--but let me try one more way 
---suppose if i could give a row number the each row on both tables and then if join both tables on this common row number column

--let's try
select row_number()over(order by ename)s_no,e.* from EMPLOYEE e;
select row_number()over(order by bcode)s_no,b.* from BRANCH b;

select * from ( 
select row_number()over(order by ename)s_no,e.* from EMPLOYEE e full outer join 
select row_number()over(order by bcode)s_no,b.* from BRANCH b on e.s_no=b.s_no)joined_table;----error


select joined_table.* from ( 
select row_number()over(order by ename)s_no,e.* from EMPLOYEE e full outer join 
select row_number()over(order by bcode)s_no,b.* from BRANCH b on e.s_no=b.s_no)joined_table;----error


select * from ( 
select row_number()over(order by ename)s_no,e.* from EMPLOYEE e)t1 full outer join 
(select row_number()over(order by bcode)s_no,b.* from BRANCH b)t2 on t1.s_no=t2.s_no;---yes-- it executed

---both tables joined by creating and adding a new common column which is row number in both the tables 

---now if want to remove duplicates it will be easy 
---i think for removing duplicates as well row_number can be used by partioning the duplicate row and select till only top rows 
---where data is not duplicated

-----------------------------------------------------------------------------------------------------
----topics to study more

----regex()
----decimal()
----variable()
----decode()
----rolling sum
----ceiling()
----floor()
----round()
----sqrt() --gives the under root of a value but the value must be in float 
----square()

--------------------------------------------------------------------------------------------------------
---decimal syntax

---DECIMAL(p, s) where p is the precision it can be up to 38 values, and s is the range after decimal

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    Amount DECIMAL(8, 2)  -- Total of 8 digits, 2 after the decimal point
);

------------------------------------------------------------------------------------------------------------
--round() syntax

--Basic Rounding:
select round(125.315,2)--result 125.32

--Rounding with Truncation:
select round(125.315,2,1)--result 125.31

--Rounding to Negative Decimal Places:
select round(125.315,-1)--result is 130.000 (rounds to nearest ten)
---------------------------------------------------------------------------------------------------

--SQRT() syntax
SQRT(float_expression)---here expression must be in float

select sqrt(16)---result is 4
----------------------------------------------------------------------------------------------------

--SQUARE() syntax
SQUARE(numeric_expression)

select square(5)---result is 25
---------------------------------------------------------------------------------------------------

--Note: order by clause do not work inside a cte(common table expression) 

-- for eg: WITH CTE AS (
       --   SELECT column1, column2
       --  FROM SomeTable
       --  ORDER BY column1  -- This will cause an error
       --    )
       --  SELECT * FROM CTE;

-- but this might work
-- for eg: WITH CTE AS (
		--	SELECT TOP 10 column1, column2
		--	FROM SomeTable
		--	ORDER BY column1  -- This is valid
		--		)
		--	SELECT * FROM CTE;

-- and this error might be seen in subqueries as well  


----------------------------------------------------------------------------------------------------------

---Variables




