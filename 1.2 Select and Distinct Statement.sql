-- Select and Distinct Statement

USE parks_and_recreation;
SELECT * 
FROM parks_and_recreation.employee_demographics;

# SELECT 
# first_name, 
# last_name,
# birth_date,
# age,
# age + 10
# FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

/* SELECT statement returns the column desired from a table. DISTINCT, on the other hand, returns 
