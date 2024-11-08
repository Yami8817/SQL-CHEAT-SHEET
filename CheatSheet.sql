CREATE DATABASE information;
USE information;

CREATE TABLE employees (
    employeeID INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    position VARCHAR(100),
    salary INT,
    department VARCHAR(100),
    contact VARCHAR(100)
);

INSERT INTO employees (employeeID, firstName, lastName, position, salary, department, contact)
VALUES  
    (028818, "Yami", "Isuzu", "Developer", 9000, "Software Engineering", "Yami@gmail.com"),
    (038910, "Alan", "Reeves", "Developer", 9000, "Software Engineering", "AlanR@gmail.com"),
    (060827, "Roy", "Chang", "Lead", 15000, "Software Engineering", "RoyChang@gmail.com"),
    (042580, "Steve", "Brown", "Database Administrator", 9000, "Database Management", "Brown@gmail.com"),
    (098827, "Mario", "Star", "Database Administrator", 9000, "Database Management", "superMario@gmail.com"),
    (067280, "Tyler", "Smith", "Lead", 12500, "Database Management", "TySmith@gmail.com");

-- BASIC SQL STATEMENTS (DDL and DML)

-- 1. CREATE - Creates a database or table (already shown above).
-- 2. ALTER - Modifies the structure of an existing table (examples below).
-- 3. DELETE - Removes rows from a table based on conditions.
-- 4. DROP - Deletes a table or database entirely.

-- RETRIEVING DATA FROM THE TABLE WITH SPECIFIC CONDITIONS

-- 1. Retrieve employees whose first name starts with "R"
SELECT * FROM employees
WHERE firstName LIKE "R%";

-- 2. Retrieve employees whose first name ends with "N"
SELECT * FROM employees
WHERE firstName LIKE "%N";

-- 3. Retrieve employees whose first name contains the letter "Y"
SELECT * FROM employees
WHERE firstName LIKE "%Y%";

-- 4. Retrieve employees whose first name is exactly 4 letters long
SELECT * FROM employees
WHERE LENGTH(firstName) = 4;

-- 5. Retrieve employees with the position of "Lead"
SELECT * FROM employees
WHERE position = "Lead";

-- 6. Retrieve employees with the position of "Lead" AND salary of 15000
SELECT * FROM employees
WHERE position = "Lead" AND salary = 15000;

-- 7. Retrieve employees with the position of "Lead" OR salary greater than 15000
SELECT * FROM employees
WHERE position = "Lead" OR salary > 15000;

-- 8. Retrieve employees whose salary is between 5000 and 10000
SELECT * FROM employees
WHERE salary BETWEEN 5000 AND 10000;

-- ALTERING TABLE STRUCTURE

-- 1. Add a new column to the table
ALTER TABLE employees
ADD COLUMN dateOfEmployment DATE AFTER contact;

-- 2. Change column name (example: changing "contact" to "email")
ALTER TABLE employees
CHANGE COLUMN contact email VARCHAR(100);

-- UPDATING DATA IN THE TABLE

-- Note: To update records, you may need to disable safe update mode:
-- SET SQL_SAFE_UPDATES = 0;

-- 1. Update salary for all Developers
UPDATE employees
SET salary = 9500
WHERE position = "Developer";

-- 2. Multiple updates at the same time
UPDATE employees
SET salary = 9300
WHERE employeeID IN (042580, 098827);

-- RETRIEVING DATA IN ORDER

-- 1. Order employees by first name in descending order, Z-A or Highest to lowest for INT
SELECT * FROM employees
ORDER BY firstName DESC;

-- 2. Order employees by employeeID in ascending order, A-Z or Lowest to highest for INT
SELECT * FROM employees
ORDER BY employeeID ASC;

-- 3. Retrieve unique positions
SELECT DISTINCT position
FROM employees;

-- USING GROUP BY AND HAVING CLAUSES

-- 1. Group employees by position and calculate total salary for each position
SELECT position, SUM(salary) AS TotalSalary
FROM employees
GROUP BY position;

-- 2. Retrieve departments with more than one employee in each position
SELECT department, position, COUNT(*) AS NumberOfEmployees
FROM employees
GROUP BY department, position
HAVING COUNT(*) > 1;

-- AGGREGATE FUNCTIONS

-- 1. COUNT - Count the number of rows
SELECT COUNT(*) AS totalEmployees
FROM employees;

-- 2. MIN - Find the minimum salary
SELECT MIN(salary) AS MinSalary
FROM employees;

-- 3. MAX - Find the maximum salary
SELECT MAX(salary) AS MaxSalary
FROM employees;

-- 4. SUM - Calculate the total salary
SELECT SUM(salary) AS TotalSalary
FROM employees;

-- 5. AVG - Calculate the average salary
SELECT AVG(salary) AS AvgSalary
FROM employees;
