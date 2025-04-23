-- WHERE Clause

SELECT *
FROM parks_and_recreation.employee_salary
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name = 'Tom'
;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary <= 55000
;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE (occupation LIKE '%Manager') AND salary > 50000;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE ('%Dir%') OR occupation LIKE ('%Manager%');

# Reflection: when querying using LIKE in a same column, I must write the clause of WHERE first in its complete form then 
# continue with another WHERE clause
# SELECT *
# FROM parks_and_recreation.employee_salary
# WHERE occupation LIKE ('%Dir%') OR ('%Man%');
