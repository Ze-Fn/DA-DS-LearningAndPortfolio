-- Strings statements: LENGTH, LEFT, RIGHT, SUBSTRING, CONCAT

USE parks_and_recrearions;

SELECT first_name, last_name, CONCAT(LEFT(first_name,1), LEFT(last_name,1)) AS Initials
FROM employee_demographics;

SELECT birth_date, LEFT(birth_date,4) AS Year, SUBSTRING(birth_date,6,2) AS Month, RIGHT(birth_date,2) AS Day
FROM employee_demographics
ORDER BY first_name DESC;


/* Strings statements are pretty much similar to the strings statements found in Excel. I think I can get used to it without any problem */


