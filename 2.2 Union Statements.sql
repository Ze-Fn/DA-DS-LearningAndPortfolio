-- Union Statement

USE parks_and_recreation;
SELECT *
FROM employee_demographics;

USE parks_and_recreation;
SELECT *
FROM employee_salary;

-- Selecting which Schema to use
USE parks_and_recreation;
-- This will make a label for Male employee who are 50 or more years old under a new colum named "Label"
SELECT first_name, last_name, 'Old Male' AS Label
FROM employee_demographics
WHERE age >= 50 AND gender = 'Male'
  
UNION

-- This one will return "Old Female" if the age condition is met and store it in the "Label" column
SELECT first_name, last_name, 'Old Female' AS Label
FROM employee_demographics
WHERE age >= 45 AND gender = 'Female'
  
UNION

-- The last one is a labeling for those who are paid more than 70000, and will be stored in the "Label" column
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary >= 70000

-- This last line of code will order the list by first_name in a descending manner
ORDER BY first_name;


/* Reflection: UNION statement has the same function as JOIN, but there is a difference. Different with that of JOIN where column(s) in joined to the sides, UNION joins column(s) into the bottom of the table. */
