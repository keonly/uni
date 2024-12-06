/* Q1
 * Show first_name as the alias "FName" and last_name as the alias "LName" from 
 * the given "employees" table. Add "ORDER BY last_name ASC".
 * What is the "LName" of the first tuple in the result?
 */
SELECT  first_name  AS "FName",
        last_name   AS "LName"
FROM    employees
ORDER BY last_name ASC;

/* Q2
 * Show department_id as the alias "DEPT_ID" without any duplicates from the 
 * given "employees" table. Add "ORDER BY DEPT_ID ASC".
 * What is the "DEPT_ID"(integer) of the first tuple in the result?
 */
SELECT DISTINCT department_id AS "DEPT_ID"
FROM    employees
ORDER BY DEPT_ID ASC;

/* Q3
 * List all information (attributes) of all employees in the (alphabetically) 
 * descending order of first_name.
 * What is the first_name of the first tuple in the result?
 */
SELECT  *
FROM    employees
ORDER BY first_name DESC;

/* Q4
 * Show first_name as the alias "FName", last_name as the alias "LName", 
 * salary, and pension fund as the alias "PF" of all employees. The pension 
 * fund is calculated as 12% of salary. Add "ORDER BY PF ASC".
 * What is the "PF" of the first tuple in the result?
 */
SELECT  first_name  AS "FName",
        last_name   AS "LName",
        salary,
        salary*0.12 AS "PF"
FROM    employees
ORDER BY PF ASC;

/* Q5
 * Show employee_id as the alias "EMPLY_ID", first_name as the alias "FName", 
 * last_name as the alias "LName", and salary. Add "ORDER BY salary ASC".
 * What is the salary of the first tuple in the result?
 */
SELECT  employee_id AS "EMPLY_ID",
        first_name  AS "FName",
        last_name   AS "LName",
        salary
FROM    employees
ORDER BY salary ASC;

/* Q6
 * What is the sum of all employees' salaries?
 */
SELECT  SUM(salary)
FROM    employees;

/* Q7
 * What is the sum of the maximum salary and the minimum salary from all 
 * employees?
 */
SELECT  MAX(salary)+MIN(salary)
FROM    employees;

/* Q8
 * What is the average salary of all employees?
 * Please round up to the second digit after the decimal point.
 */
SELECT  AVG(salary)
FROM    employees;

/* Q9
 * What is the number of all available jobs based on job_id without any 
 * duplicates?
 */
SELECT  COUNT(DISTINCT job_id)
FROM    employees;

/* Q10
 * Show first_name in the upper case as the alias "FName_Upper". 
 * Add "ORDER BY FName_Upper ASC".
 * What is the "FName_Upper" of the first tuple in the result?
 */
SELECT  UPPER(first_name) AS "FName_Upper"
FROM    employees
ORDER BY FName_Upper ASC;

/* Q11
 * What is 155*177+815? */
SELECT  155*177+815;

/* Q12
 * Show the 'Employee Name' by composing a full name with first_name and 
 * last_name for all employees. For example, Jae-Gil Lee, Doyoung Kim, etc.  
 * Add "ORDER BY 'Employee Name' DESC". 
 * What is the second 'Employee Name' in the result?
 */
SELECT  first_name || ' ' || last_name AS "Employee Name"
FROM    employees
ORDER BY 'Employee Name' DESC;

/* Q13
 * Show first_name as the alias "FName", last_name as the alias "LName", and
 * the sum of the length of first_name and that of last_name as the alias 
 * "Name Length". For example, if first_name is Jae-Gil and last_name is Lee, 
 * then the "Name Length" should be 10. 
 * Add "ORDER BY last_name DESC".
 * What is the "Name Length" of the first tuple in the result?
 */
SELECT  first_name AS "FName",
        last_name  AS "LName",
        LENGTH(first_name || last_name) AS "Name Length"
FROM    employees
ORDER BY last_name DESC;

/* Q14
 * Retrieve the first 10 records, with employee_id as the alias "EMPLY_ID"
 * and first_name as the alias "FName".
 * What is the "FName" of the last tuple in the result?
 */
SELECT  employee_id AS "EMPLY_ID",
        first_name  AS "FName"
FROM    employees
LIMIT   10;

/* Q15
 * Show first_name as the alias "FName", last_name as the alias "LName",
 * and the monthly salary as the alias "Monthly Salary", assuming that
 * salary in the table is the annual salary.
 * Add "ORDER BY first_name ASC".
 * What is the "Monthly Salary" of the first tuple in the result?
 * Please round off all decimal places
 */
SELECT  first_name AS "FName",
        last_name  AS "LName",
        salary/12  AS "Monthly Salary"
FROM    employees
ORDER BY first_name ASC;