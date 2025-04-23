-- Join statement

USE parks_and_recreation
SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics AS edemo LEFT JOIN employee_salary AS esal
  ON edemo.employee_id = esal.employee_id;

SELECT *
FROM employee_demographics INNER JOIN employee_salary
  ON employee_demographics.employee_id = employee_salary.employee_id;

/* Reflection: 
The JOIN statement can be understood as is, as the name suggests. It joins two or more tables into one, single table
There are LEFT and RIGHT for this statement. The LEFT JOIN takes the table that is on the left (or mentioned first
in the code algorithm) as the primary table, and then take the right table (table that comes/mentioned after the
first table in the code) to be combined into the primary table. Another way to comprehend this logic is by understanding
the linguistic structure of the statement. LEFT JOIN is equal to "join whatever that is in the right to the LEFT".
Or, one may find it easier to understand by simply switching the LEFT and JOIN statement -> JOIN (to the) LEFT.
The same logic can be applied to the RIGHT JOIN statement.

However, I failed to understand the difference between INNER JOIN and LEFT JOIN. When I use the same line of code
but only change the statement from INNER JOIN to LEFT JOIN (and vice versa), they both returns the same table.
Why is that? What is the difference between the two? Surely there must be at least a difference for that two
statements. If there are no difference, there is no need to use or even create them separately in the first place.

Update 18:11 2025-04-17
I found out that the difference between INNER JOIN and LEFT JOIN lie in the way the join is applied.
INNER JOIN will join the left and right table but on a condition: the join is based on the similar data that are
available on both sides. On the other hand, LEFT JOIN will return NULL rows if the secondary table has no similar
data in common with the primary table.
*/
