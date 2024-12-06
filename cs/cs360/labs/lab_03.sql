/* Q1
 * What is the number of first names without duplicates in the employees table?
 */
SELECT  COUNT(DISTINCT first_name)
FROM    employees;

/* Q2
 * What is the sum of the salaries for "ST_CLERK" employees?
 */
SELECT  SUM(salary)
FROM    employees
WHERE   job_id = "ST_CLERK";

/* Q3
 * What is the minimum salary among the employees whose salary is more than 
 * 10000?
 */
SELECT  MIN(salary)
FROM    employees
WHERE   salary > 10000;

/* Q4
 * What is the maximum salary among the employees whose department is 60?
 */
SELECT  MAX(salary)
FROM    employees
WHERE   department_id = 60;

/* Q5
 * Show the minimum salary as the alias "MinimumSalary" and the number as the 
 * alias "Count" of the employees whose first name is "John".
 * What is the "Count" in the result?
 */
SELECT  MIN(salary) AS "MinimumSalary",
        COUNT(first_name) AS "Count"
FROM    employees
WHERE   first_name = "John"

/* Q6
 * Show the sum as the alias "TOTAL", the highest as the alias "TOP",
 * lowest as the alias "BOTTOM", and average as the alias "AVG" of the 
 * salaries of the employees working for department 60.
 * What is the "AVG" in the result? Write your answer as an integer.
 */
SELECT  SUM(salary) AS "TOTAL",
        MAX(salary) AS "TOP",
        MIN(salary) AS "BOTTOM",
        AVG(salary) AS "AVG"
FROM    employees
WHERE   department_id = 60;

/* Q7
 * Show how many employees, whose salary is more than 3000, earn the same 
 * salary. Add "ORDER BY salary".
 * What is the count of the first tuple in the result?
 */
SELECT  COUNT(salary)
FROM    employees
WHERE   salary > 3000
GROUP BY salary
ORDER BY salary;

/* Q8
 * Show the mean of the maximum salary and the minimum salary
 * as the alias "AVG_MaxMin".
 * What is the mean in the result? Write your answer as an integer.
 */
SELECT  (MAX(salary) + MIN(salary))/2 AS "AVG_MaxMin"
FROM    employees;

/* Q9
 * Show the average salary of the employees belonging to each manager
 * as the alias "Avg_Salary".
 * What is the manager_id with the minimum "Avg_Salary"?
 */
SELECT  AVG(salary) AS "Avg_Salary",
        manager_id
FROM    employees
GROUP BY manager_id
ORDER BY "Avg_Salary" ASC;

/* Q10
 * Show the average salary of the employees belonging to a department
 * as the alias "Avg_Salary".
 * What is the department_id with the minimum “Avg_Salary”?
 */
SELECT  AVG(salary) AS "Avg_Salary",
        department_id
FROM    employees
GROUP BY department_id
ORDER BY "Avg_Salary" ASC;

/* Q11
 * Show the average salary of the employees who earn less than 3000 for each 
 * job_id except for "AC_MGR".
 * What is the job_id with the minimum of the average salaries?
 */
SELECT  AVG(salary) AS "Avg_Salary",
        job_id
FROM    employees
WHERE   salary < 3000
GROUP BY job_id
HAVING  job_id <> "AC_MGR"
ORDER BY "Avg_Salary" ASC;

/* Q12
 * Show the average salary as the alias "Avg" and the difference between the 
 * average and the minimum salary as the alias "Difference" of employees for
 * each job_id.
 * What is the job id with the minimum "Avg" in the result?
 */
SELECT  AVG(salary) AS "Avg",
        AVG(salary)-MIN(salary) AS "Difference",
        job_id
FROM    employees
GROUP BY job_id
ORDER BY "Avg" ASC;

/* Q13
 * Show the department_id and the average salary of the employees working for 
 * the department where the average is less than 3500.
 * What is the department_id with the minimum of the average salary in the 
 * result?
 */
SELECT  department_id,
        AVG(salary) AS "Avg_Salary"
FROM    employees
GROUP BY department_id
HAVING  AVG(salary) < 3500
ORDER BY "Avg_Salary" ASC;

/* Q14
 * Show the maximum salary for each department having exactly five employees. 
 * What is the maximum salary in the result? Write your answer as an integer.
 */
SELECT  MAX(salary) AS "MAX"
FROM    employees
GROUP BY department_id
HAVING  COUNT(*) = 5
ORDER BY "MAX" DESC;