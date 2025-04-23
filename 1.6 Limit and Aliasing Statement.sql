-- Limit and Aliasing Statement

-- Limit
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 4;

-- Aliasing
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;

# Reflection: Limit is "limiting" the rows of data that want to be shown (LIMIT)
# Aliasing is giving name to the created column (AS)
