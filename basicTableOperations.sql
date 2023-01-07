--Title: SQL Practtice
--Author: Manish Das
--Created: 4th January 2023

--Sql uses single quotation

--Create table
CREATE TABLE IF NOT EXISTS student (
id INT PRIMARY KEY NOT NULL,
name varchar(50) not null,
gender char(1) not null
);

--table with check
CREATE TABLE Student
(
   ID int(6) NOT NULL,
   NAME varchar(10),
   AGE int CHECK (AGE < 20)
);

--Delete a table
DROP TABLE student;

--Update columns
UPDATE student   
SET name = 'Tapas Kumar'    
WHERE id = '2';

--Delete columns
DELETE FROM student 
WHERE Name = "Manish Das";  

--Cheat Sheet
https://www.interviewbit.com/sql-cheat-sheet/

--AS, ORDER BY, DESC
select id, name as Student_Name
from student
where gender='F'
order by id desc;

--Drop Column 
ALTER TABLE student DROP COLUMN name;

--Alter Particular Column Data Type
ALTER TABLE student ALTER COLUMN age DROP DEFAULT;

--Multiple OR conditions
SELECT * FROM students WHERE name IN('Manish Das', 'Tapas Kumar Ghosh','Sumit Singh');

--Arithmatic Operations
SELECT 6/2 as Arithmatic_Operation;
--or
SELECT 'Hello World';

--display three values in three columns
SELECT 5 as one, 10 as two, 15 as three;
--or
SELECT 5, 10, 15;

--For Dummy Data https://www.w3resource.com/sql/sql-table.php

--to clear scren ctrl + l

--to choose distinct/unique from table columns
SELECT DISTINCT "WORKING_AREA" FROM agents;

--select specific people who live in that particular city using WHERE Clause
select name, city 
from salesman 
where city='Paris'

--Best source for practice
https://www.w3resource.com/sql-exercises/

--Multiple where clause
SELECT winner
  FROM nobel_win
 WHERE year = 1971
   AND subject = 'Literature';

--or

   SELECT winner 
FROM nobel_win
WHERE year>=1950
AND subject='Physics'

--fetch email ending with gmail.com
select * 
from nobel_win
where subject like '%gmail.com';

--fetch name contains kumar in middle
select * 
from nobel_win
where subject like '%kumar%'; --Tapas Kumar Ghosh, Brajesh Kumar Singh etc

--Union/UNION
--From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.
SELECT * FROM nobel_win  
WHERE (subject ='Physics' 
AND year=1970) 
UNION (SELECT * FROM nobel_win  WHERE (subject ='Economics' AND year=1971));

--Question: 20. From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.
SELECT *
 FROM nobel_win 
   WHERE year=1970
    AND subject NOT IN('Physiology','Economics');

--Question: 21. From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. 
SELECT * FROM nobel_win 
WHERE (subject ='Physiology' AND year<1971) 
UNION (SELECT * FROM nobel_win WHERE (subject ='Peace' AND year>=1974));

--Question 23. From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.
SELECT * 
 FROM nobel_win 
  WHERE subject NOT LIKE 'P%' 
   ORDER BY year DESC, winner;

--Question 25. From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.
SELECT *
FROM item_mast
WHERE pro_price >= 200 and pro_price <= 600

--or

SELECT *
FROM item_mast
WHERE pro_price between 200 and 600;

--Question 26. From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg. 
SELECT AVG(pro_price) FROM item_mast 
  WHERE pro_com=16;

--Question 27. From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'
SELECT pro_name as "Item_Name", pro_price as "Price in Rs" from item_mast

--Question 28. From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.
SELECT pro_name, pro_price 
     FROM item_mast
    WHERE pro_price >= 250
 ORDER BY pro_price DESC, pro_name;


--Question 29. From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code.
SELECT AVG(pro_price), pro_com
FROM item_mast
GROUP BY pro_com

--Question 30. Display all countires and their nobel winner count
SELECT count(winner), country 
FROM nobel_win
GROUP BY country

--Question 31. From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.
SELECT pro_name, pro_price
   FROM item_mast
   WHERE pro_price = 
    (SELECT MIN(pro_price) FROM item_mast);

--Question 32. From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.  
SELECT DISTINCT emp_lname
FROM emp_details;

-- Wildcards
WHERE CustomerName LIKE 'a%'	Finds any values that starts with "a"
WHERE CustomerName LIKE '%a'	Finds any values that ends with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a__%'	Finds any values that starts with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that starts with "a" and ends with "o"

%	Represents zero or more characters	bl% finds bl, black, blue, and blob
_	Represents a single character	h_t finds hot, hat, and hit
[]	Represents any single character within the brackets	h[oa]t finds hot and hat, but not hit
^	Represents any character not in the brackets	h[^oa]t finds hit, but not hot and hat
-	Represents any single character within the specified range	c[a-b]t finds cat and cbt

SELECT COUNT(City) as 'City_Count', city FROM Customers
group by city having city = 'London'
--Having is used with group by
--Where is used before group by

create table account (
	id int primary key,
	name varchar(100) UNIQUE,
	balance INT,
	constraint minimum_balance CHECK(balance>200)
)

INSERT INTO account values(1, 'Manish Das' ,23000)

INSERT INTO account values(2, 'Pritam Das' ,23000)

INSERT INTO account values(3, 'Akash Das' ,150) --Balance is less than constraint

select * from account

--Fetch Last 3 elements from sql tabke
SELECT TOP 3 from students --for SQL Server/MS Access)
--or
SELECT * from students
LIMIT 3 --postgreSQL, MySQL

--To create index
-- create table
CREATE TABLE Colleges (
  college_id INT PRIMARY KEY,
  college_code VARCHAR(20) NOT NULL,
  college_name VARCHAR(50)
);

-- create index
CREATE INDEX college_index
ON Colleges(college_code);


--AUTO_INCREMNET postgreSQL uses SMALLSERIAL, SERIAL & BIGSERIAL
create table dumpp (
	user_id smallserial,
	user_name varchar(200)
);

--PostgreSQL DEAFULT DATE for more information visit postgre sql docs or https://www.postgresqltutorial.com/postgresql-date-functions/
create table dumpp (
	user_id smallserial,
	user_name varchar(200),
	account_creation_date date DEFAULT CURRENT_DATE
);

insert into dumpp ( user_name) values
('Manish Das'),
('Sumit Singh Choudhary'),
('Shubham Singh');

select * from dumpp

--Joins - Inner Join
create table customers (
	customer_id int primary key not null,
	customer_name varchar(100) not null,
	customer_city varchar(100) not null,
	customer_age int not null
);

insert into customers values 
(1,'Manish Das','Dharmanagar',23),
(2,'Pritam Roy','Agartala',19),
(3,'Sumit Singh','Agartala',24),
(4,'Tapas Kumar Ghosh','Agartala',22),
(5,'Sandeep Gupta','Agartala',25);


create table orders (
	order_id int primary key not null,
	order_name varchar(100) not null,
	customer_id int
);

insert into orders values 
(1,'Pasta',3),
(2,'Sandwich',3),
(3,'Pizza',1),
(4,'Burger',2),
(5,'Noodles',7);



--Joins - Inner Join
select customers.customer_name, orders.order_name 
from customers JOIN orders ON customers.customer_id = orders.customer_id

select --what to select
from --left table 
JOIN --right table
ON --left table.matching column name 
= --right table.matching column name 


--INNER Joins
select customers.customer_name, orders.order_name 
from customers JOIN orders ON customers.customer_id = orders.customer_id

--LEFT Joins
SELECT customers.customer_name, orders.order_name
FROM customers LEFT JOIN orders
ON customers.customer_id = orders.customer_id

--RIGHT Joins
SELECT customers.customer_name, orders.order_name
FROM customers RIGHT JOIN orders
ON customers.customer_id = orders.customer_id

--OUTER Joins
SELECT customers.customer_name, orders.order_name
FROM customers RIGHT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
UNION
SELECT customers.customer_name, orders.order_name
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id

--For awsome visualization of joins visit this site
--https://joins.spathon.com/

--Join 3 tables
create table account (
	customer_balance INT NOT NULL,
	customer_id INT not nullc
);

INSERT INTO account values
(7560,2),
(9670,1),
(2340,3),
(3050,4)

--Join 3 tables quarie
SELECT customers.customer_id, customers.customer_name, 
customers.customer_city, orders.order_name,
account.customer_balance
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN account ON orders.customer_id = account.customer_id


--Explanantion
SELECT --First select all the columns which you want to display 
FROM --first table name
INNER JOIN --second table name 
ON --first table primary key = second table foreign key

INNER JOIN --third table 
ON --second table primary key and third table foreign key or vice versa --key thing is both column should similar things
--it is not mandatory that all 3 tables should have same common column, common should be only those two table to which we perform
--immidiate join

--Union
--The UNION operator is used to combine the result-set of two or more SELECT statements.
--but both table should have same number of columns

--Group By example
select COUNT(customer_city), customer_city from customers
group by customer_city

--Where exist
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price > 70);


--SELCT INTO
--It helps in copying data from one table to another table
--we can either copy all data or copy few columns

--Syntax 
SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

--Example where we copy all customer details where balance > 1000
SELECT *
INTO account2
FROM account
WHERE customer_balance > 1000

select * from account2

/* account 2 table

create table account2 (
	customer_balance INT NOT NULL,
	customer_id INT not null,
	order_id INT not null
);

INSERT INTO account2 values
(5560,4,1),
(7670,3,2),
(1340,1,3),
(8050,2,4)

*/

--we can also copy whole table without any condition
select * into account_backup from account

--Tip: SELECT INTO can also be used to create a new, empty table using the schema of another. Just add a WHERE clause that causes the query to return no data:

SELECT * INTO newtable
FROM oldtable
WHERE 1 = 0;

-- 1=1 means true and it will return all data

/* INSERT INTO
The INSERT INTO SELECT statement copies data from one table and inserts it into another table.

The INSERT INTO SELECT statement requires that the data types in source and target tables match. */

--Copy all columns from one table to another table:
INSERT INTO table2
SELECT * FROM table1
WHERE condition;


--Main difference in insert into table must be exist first and it is not the case in case of  select into

--Copy only some columns from one table into another table:
INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;

--INSERT INTO
create table accounts (
	customer_balance INT NOT NULL,
	customer_id INT not null,
	order_id INT not null,
	country varchar(100)
);

--Examplev
INSERT INTO accounts (customer_balance, customer_id,order_id)
SELECT customer_balance, customer_id, order_id FROM account_backup;

select * from accounts


--CASE very important

/* The SQL CASE Expression
The CASE expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.

If there is no ELSE part and no conditions are true, it returns NULL.

CASE Syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END; */

SELECT customer_balance, customer_id,
CASE
    WHEN customer_balance < 5000 THEN 'The balance is less than 5000' --be careful while making cases it it just like if else so mistake in logic can make big headche
    WHEN customer_balance > 3000 THEN 'The balance is greater than 2000'
    ELSE 'Average Balance'
END AS QuantityText
FROM accounts;


/* 
The following SQL will order the customers by City. However, if City is NULL, then order by Country:

Example */
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

--To update a row 
--in MySQL we can use replace into tablename values
--but in postgreSQL  we need to use on conflict
insert into accounts
values(9, 3)
ON CONFLICT (order_id) DO UPDATE
SET order_id = 3


--fetch last 3 or last 5 rows
select * from customers
order by customer_id desc limit 2 --result will be in opposite way 5, 4 not 4, 5

--to fix the above opposite issue
with t as (select * from customers order by customer_id desc limit 2)
select * from t order by customer_id asc

--This will also work

SELECT * FROM (
    SELECT * FROM customers 
	 ORDER BY customer_id DESC
	 LIMIT 2
) subquery
ORDER BY customer_id ASC;


--skip first few result
select * from customers 
order by customer_id 
offset 2 limit 2

select * from customers
order by customer_id desc fetch first 2 row only


--show the customer with maximum salary
select * from account2
where customer_balance = (select max(customer_balance) from account2)





