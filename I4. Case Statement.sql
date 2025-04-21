-- CASE Statements

USE parks_and_recreations;
SELECT *, 
CASE
	WHEN age >= 50 THEN 'Old'
    WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 49 THEN 'Middle'
END AS Label
FROM employee_demographics;

/* The CASE statement is basically equivalent to the IF function in many computer language, even in Excel. 
The difference from that of IF in Excel is that CASE statement uses a more human-like language. It's very
semantic compared to that of IF in Excel. We put CASE, WHEN, THEN, and END. The argument is clear and can
be understood by those with small to zero experience in coding, unlike IF statement in Excel where it does
not specify eplicitly in the formula which part is the condition and which part is the instruction, they 
are just separated by commas.
