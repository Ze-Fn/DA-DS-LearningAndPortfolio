-- Window functions

USE parks_and_recreations;
SELECT gender, AVG(salary) OVER(PARTITION BY gender) AS avg_sal_gend
FROM employee_demographics AS edemo
JOIN employee_salary AS esal
	ON edemo.employee_id = esal.employee_id
;

/* The first window function is OVER(PARTITION BY ...). This function will return
the average salary (see the SELECT argument) based on gender (see `OVER(PARTITION 
BY ...`). The value of that average is stored in its individual row. So, what we 
see is not like:
|gender|	|avg_sal_gend|
Female		avg_sal_fml
Male		avg_sal_ml

but rather,
|gender|	|avg_sal_gend|
Female		avg_sal_fml
Female		avg_sal_fml
Female		avg_sal_fml
Male		avg_sal_ml
Male		avg_sal_ml
Male		avg_sal_ml
*/

SELECT esal.first_name, 
esal.last_name, 
edemo.gender, 
esal.salary, 
SUM(salary) OVER(PARTITION BY gender ORDER BY salary DESC) AS Sum_Sal_Roll
FROM employee_demographics AS edemo
JOIN employee_salary AS esal
	ON edemo.employee_id = esal.employee_id
;

/* The second window function is the "Rolling Sum". This function uses a set of statements
(see ln 32) that create a rolling calculation. Run the code and see the result grid.
The first row of salary and Sum_Sal_Roll have the same values: 75000. On the second row, 
however, the Sum_Sal_Roll is not 60000, it's 135000. The value of 135000 comes from the
addition of the previous value of Sum_Sal_Roll (i.e. the first row) and the second row
of salary. Hence, the value of Sum_Sal_Roll will always get additions until it comes to
a different section of gender (see `OVER(PARTITION BY ...)` argument in ln 32)
*/

SELECT edemo.first_name, 
edemo.last_name,
edemo.gender,
esal.salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS Row_Num
FROM employee_demographics AS edemo
JOIN employee_salary AS esal
	ON edemo.employee_id = esal.employee_id;

/* The third window function is ROW_NUMBER. This function creates a new column containing
number in an ascending manner. That is all. However, since these lines of arguments 
contain OVER(PARTITION BY ...), the ROW_NUMBER restarts to 1 whenever there algorithm 
reaches new partition. */

SELECT edemo.first_name,
edemo.last_name,
edemo.gender,
esal.salary,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS 'Rank'
FROM employee_demographics AS edemo
JOIN employee_salary  AS esal
	ON edemo.employee_id = esal.employee_id;
    
/* The fourth window function is RANK. It gives a ranking system based on the partition.
However, whenever there are identical values, the numbering will return the same number.
Run the code above and see at the Result Grid, specifically at the rows where the salary 
is 50000. The Rank for the two rows returns 5 two times and the next rank number skips 
number 6 and goes to 7. */

SELECT edemo.first_name,
edemo.last_name,
edemo.gender,
esal.salary,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS 'Rank_no_skip'
FROM employee_demographics AS edemo
JOIN employee_salary AS esal
	ON edemo.employee_id = esal.employee_id;
