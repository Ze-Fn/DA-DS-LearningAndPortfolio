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
    WHERE birth_date > '1985-01-01'
    ),
CTE_Example2 AS
	(SELECT first_name, 
    last_name, 
    salary, 
    employee_id
    FROM employee_salary AS esal
    WHERE salary > 25000
    )
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;

/* Second Exercise */
WITH FullName_edemo AS
	(SELECT first_name, last_name
    FROM employee_demographics
    ),
FullName_esal AS
    (SELECT first_name, last_name
    FROM employee_salary
	),
salary AS
	(SELECT salary
    FROM employee_salary
    ),
gender AS
	(SELECT gender
    FROM employee_demographics
    )
SELECT *
FROM FullName_edemo
UNION
SELECT *
FROM FullName_esal
;

/* Reflection:
I've been wondering how can I merge two CTEs and then combine the ecombined the two CTEs with other CTEs?
(FullName_edemo UNION FullName_esal) AS Compiled_FN then (Complied_FN JOIN gender, salary ON first_name AND last_name
I haven't figure it out how to execute that */

/* Below is first_name and last_name being UNION'ed (employee_demographics AND employee_salary) and then RIGHT JOIN'ed FullNames AND employee_salary.
It's not combining two CTEs but it get the job done (see reflection above for context) */
WITH FullNames AS
	(SELECT edemo.first_name, edemo.last_name
    FROM employee_demographics AS edemo
    UNION DISTINCT
    SELECT esal.first_name, esal.last_name
    FROM employee_salary AS esal)
SELECT FullNames.first_name, FullNames.last_name, occupation, salary
FROM FullNames
RIGHT JOIN employee_salary
	ON employee_salary.first_name = FullNames.first_name
WHERE salary >= 20000;
