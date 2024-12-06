/* Q1
 * Show first_name as the alias "FName", last_name as the alias "LName",
 * and salary for all employees whose salary is not in the range of $8,000 to
 * $12,000 in ascending alphabetical order by last_name.
 * What is the salary of the first tuple in the result?
 */
SELECT  first_name  AS "FName",
        last_name   AS "LName",
        salary
FROM    employees
WHERE   salary NOT BETWEEN 8000 AND 12000
ORDER BY last_name ASC;

/* Q2
 * Show first_name as the alias "FName", last_name as the alias "LName",
 * and department ID of all employees in departments whose department_id is
 * 30 or 100. Add "ORDER BY department_id ASC".
 *  What is the "LName" of the first tuple in the result?
 */
SELECT  first_name  AS "FName",
        last_name   AS "LName",
        department_id
FROM    employees
WHERE   department_id = 30
OR      department_id = 100
ORDER BY department_id ASC;

/* Q3
 * Show first_name as the alias "FName", last_name as the alias "LName",
 * and salary for all employees whose salary is not in the range of $8,000
 * to $12,000 and who are in departments 30 or 100 in ascending alphabetical 
 * order by last_name.
 * What is the "LName" of the first tuple in the result?
 */
SELECT  first_name  AS "FName",
        last_name   AS "LName",
        salary
FROM    employees
WHERE   salary NOT BETWEEN 8000 AND 12000
AND     (department_id = 30 OR department_id = 100)
ORDER BY last_name ASC;

/* Q4
 * Show first_name as the alias "FName" of all employees who have both "a"
 * and "e" in their first name in ascending alphabetical order by first_name. 
 * What is the "FName" of the first tuple in the result?
 */
SELECT  first_name  AS "FName"
FROM    employees
WHERE   "FName"     LIKE "%a%e%" OR "%e%a%"
ORDER BY first_name ASC;

/* Q5
 * Show last_name as the alias "LName", job_id, and salary for all employees 
 * whose job is a programmer('IT_PROG') or a shipping clerk('SH_CLERK'),
 * and whose salary is not equal to $4,200, $6,000, or $12,000 in
 * ascending alphabetical order by last_name.
 * What is the "LName" of the first tuple in the result?
 */
SELECT  last_name   AS "LName",
        job_id,
        salary
FROM    employees
WHERE   job_id IN ('IT_PROG', 'SH_CLERK')
AND     salary NOT IN (4200, 6000, 12000)
ORDER BY last_name ASC;

/* Q6
 * Show last_name as the alias "LName" of employees whose last name has
 * exactly 5 characters in descending alphabetical order by last_name.
 * What is the "LName" of the first tuple in the result?
 */
SELECT  last_name   AS "LName"
FROM    employees
WHERE   last_name LIKE "_____"
ORDER BY last_name DESC;

/* Q7
 * Show last_name as the alias "LName" of  the employees whose last name has 
 * 'e' as the 4th character in descending alphabetical order by last_name.
 * What is the "LName" of the first tuple in the result?
 */
SELECT  last_name   AS "LName"
FROM    employees
WHERE   last_name LIKE "___e%"
ORDER BY last_name DESC;

/* Q8
 * Retrieve job IDs from the employees table without duplicates in ascending 
 * alphabetical order by job_id.
 * What is the job_id of the first tuple in the result?
 */
SELECT  DISTINCT job_id
FROM    employees
ORDER BY job_id ASC;

/* Q9
 * Show first_name as the alias "FName", last_name as the alias "LName", 
 * salary, and 15% of salary as the alias "PF" of all employees.
 * Add "ORDER BY PF ASC".
 * What is the PF of the first tuple in the result (integer value)?
 */
SELECT  first_name  AS "FName",
        last_name   AS "LName",
        salary,
        salary*0.15 AS "PF"
FROM    employees
ORDER BY PF ASC;