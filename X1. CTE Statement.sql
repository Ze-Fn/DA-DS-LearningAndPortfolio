-- CTEs (Common Table Expressions)

WITH CTE_Example AS
	(SELECT first_name, last_name, gender, birth_date
    FROM employee_demographics
    WHERE birth_date > '1985-01-01'
    )
SELECT *
FROM CTE_Example;

WITH CTE_Example AS
	(SELECT first_name, 
    last_name, 
    gender, 
    birth_date, 
    employee_id
    FROM employee_demographics as edemo
    -- WHERE birth_date > '1985-01-01'
    ),
CTE_Example2 AS
	(SELECT first_name, 
    last_name, 
    salary, 
    employee_id
    FROM employee_salary AS esal
    -- WHERE salary > 25000
    )
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;
