-- Strings statements: LENGTH, LEFT, RIGHT, SUBSTRING, CONCAT

USE parks_and_recrearions;

SELECT first_name, last_name, CONCAT(LEFT(first_name,1), LEFT(last_name,1)) AS Initials
FROM employee_demographics;

SELECT birth, LEFT(birth,4) AS Year, SUBSTRING(birth,6,2) AS Month, RIGHT(birth,2) AS Day
FROM employee_demographics
ORDER BY first_name DESC;

/* Coding in progress */


