/* Q1
 * Show first_name as the alias "FName", last_name as the alias "LName",
 * and salary of the employees whose salary is higher than the salary of an 
 * employee whose last_name is 'Sciarra'. Add "ORDER BY salary DESC".
 * What is the LName of the first tuple in the result?
 */
SELECT  first_name  AS "FName",
        last_name   AS "LName",
        salary
FROM    employees
WHERE   salary >
(
    SELECT  salary
    FROM    employees
    WHERE   last_name = 'Sciarra'
)
ORDER BY salary DESC;

/* Q2
 * Show the email and phone number of the employees working in the
 * 'Finance' department. Add "ORDER BY email ASC".
 * What is the email of the first tuple in the result?
 */
SELECT  email,
        phone_number
FROM    employees JOIN departments USING(department_id)
WHERE   depart_name = 'Finance'
ORDER BY email ASC;

/* Q3
 * Show the first_name, last_name, and salary of the employees who have a 
 * manager, where the manager is working for departments based in the
 * United Kingdom. Note that departments based in United Kingdom means 
 * country_id is 'UK' in the locations table.
 * List these employees in the order of highest to lowest salary.
 * What is the highest salary?
 * [Hint: If employee A's manager_id is 100, this means that a employee with 
 * employee_id of 100 is the manager of A.]
 */
SELECT  E1.first_name,
        E1.last_name,
        E1.salary
FROM    employees E1
WHERE   E1.manager_id IN
(
    SELECT  E2.employee_id
    FROM    employees E2
    WHERE   E2.department_id IN
    (
        SELECT  department_id
        FROM    departments
        WHERE   location_id IN
        (
            SELECT  location_id
            FROM    locations
            WHERE   country_id = 'UK'
        )
    )
)
ORDER BY E1.salary DESC;

/* Q4
 * Show first_name as the alias "FName" and last_name as the alias "LName" of 
 * the employees who are managers.  Add "ORDER BY FName"
 * What is the FName of the first tuple in the result?
 * [Hint: If employee A's manager_id is 100, this means that a employee with 
 * employee_id of 100 is the manager of A.]
 */
SELECT  E1.first_name   AS "FName",
        E1.last_name    AS "LName"
FROM    employees E1 JOIN employees E2 
        ON E1.employee_id = E2.manager_id
ORDER BY FName;

/* Q5
 * Show first_name, last_name and hire_date of the employees who are paid more 
 * than the average salary of all employees.
 * What is the hire_date of the employee who is hired the earliest to the 
 * company? Write your answer in the form of YYYY-MM-DD.
 */
SELECT  first_name,
        last_name,
        hire_date
FROM    employees
WHERE   salary >
(
    SELECT  AVG(salary)
    FROM    employees
)
ORDER BY hire_date ASC;

/* Q6
 * Show first_name as the alias "FName", last_name as the alias "LName", and 
 * salary of the employees whose salary is equivalent to his/her job(job_id)'s 
 * min_salary. Note that min_salary is the attribute in the 'jobs' table.
 * What is the common salary of these employees?
 * [Hint: all the salaries of the result tuples should be the same.]
 */
SELECT  first_name  AS "FName",
        last_name   AS "LName",
        salary
FROM    employees JOIN jobs USING(job_id)
WHERE   salary = min_salary;

/* Q7
 * Show the email of the employees who work in the department (department_id) 
 * 30 and who earn less than the average salary of all employees.
 * Add "ORDER BY email".
 * What is the email of the first tuple in the result?
 */
SELECT  email
FROM    employees
WHERE   department_id = 30
AND     salary <
(
    SELECT  AVG(salary)
    FROM    employees
)
ORDER BY email;

/* Q8
 * Show all the attributes of the employee whose salary is equal to Austin's
 * salary.
 * What is the last_name of the employee except 'Austin' in the result?
 */
SELECT  *
FROM    employees
WHERE   salary =
(
    SELECT  salary
    FROM    employees
    WHERE   last_name = 'Austin'
)
AND     last_name <> 'Austin';

/* Q9
 * What is the last_name of the employee who earns the least among all 
 * employees?
 */
SELECT  last_name
FROM    employees
WHERE   salary =
(
    SELECT  MIN(salary)
    FROM    employees
);

/* Q10
 * Show the ID of the employees who receive a salary higher than the average 
 * salary of the department that they belong to.
 * Add "ORDER BY employee_id desc".
 * What is the employee_id of the first tuple in the result?
 */
SELECT  E1.employee_id
FROM    employees E1
WHERE   salary >
(
    SELECT  AVG(E2.salary)
    FROM    employees E2
    WHERE   E1.department_id = E2.department_id
)
ORDER BY employee_id DESC;

/* Q11
 * Show the last_name of all employees receiving the second highest salary when 
 * all employees' salaries are listed without duplication.
 * Add "ORDER BY last_name".
 * What is the last_name of the first tuple in the result?
 */
SELECT  E1.last_name
FROM    employees E1
WHERE   2 =
(
    SELECT  COUNT(DISTINCT E2.salary)
    FROM    employees E2
    WHERE   E1.salary <= E2.salary
)
ORDER BY last_name;

/* Q12
 * What is the fifth lowest salary when all employees’ salaries are listed 
 * without duplication?
 */
SELECT  DISTINCT E1.salary
FROM    employees E1
WHERE   5 =
(
    SELECT  COUNT(DISTINCT E2.salary)
    FROM    employees E2
    WHERE   E1.salary >= E2.salary
);

/* Q13
 * Show all attributes of the last 15 records in the 'employees' table, in the 
 * ascending order of employee_id.
 * What is the hire_date of the first tuple in the result?
 * Write your answer in the form of YYYY-MM-DD.
 */
SELECT  *
FROM
(
    SELECT  *
    FROM    employees
    ORDER BY employee_id DESC
    LIMIT   15
)
ORDER BY employee_id ASC
LIMIT 1;

/* Q14
 * What is the sum of the five minimum salaries when all employees' salaries 
 * are listed without duplication?
 */
SELECT  SUM(F.salary)
FROM
(
    SELECT  DISTINCT E1.salary
    FROM    employees E1
    WHERE   5 >=
    (
        SELECT  COUNT(DISTINCT E2.salary)
        FROM    employees E2
        WHERE   E1.salary >= E2.salary
    )
) F;

/* Q15
 * What is the sum of the five maximum salaries when all employees' salaries 
 * are listed without duplication?
 */
SELECT  SUM(F.salary)
FROM
(
    SELECT  DISTINCT E1.salary
    FROM    employees E1
    WHERE   5 >=
    (
        SELECT  COUNT(DISTINCT E2.salary)
        FROM    employees E2
        WHERE   E1.salary <= E2.salary
    )
) F;