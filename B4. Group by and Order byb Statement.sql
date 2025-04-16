-- Group by + Order by statement
-- Group by
SELECT *
FROM employee_salary;

SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- Order by
SELECT *
FROM employee_demographics
ORDER BY  first_name ASC;

# Reflection: It's kind of similar to that of Filtering and Ordering in Excel. I don't have any problem with this.
# Everything is basically Excel but on text-based