/* Q1
 * Show the location_id as the alias "Lid", city, and country_name as the alias 
 * "CName" of all locations in the ascending order of location_id. 
 * What is the city of the first tuple in the result?
 */
SELECT  location_id "Lid",
        city,
        country_name "CName"
FROM    locations
JOIN    countries USING(country_id)
ORDER BY location_id ASC;

/* Q2
 * Show the first_name as the alias "FName", last_name as the alias "LName", 
 * department ID, and department name of all employees in the ascending 
 * alphabetical order of the first_name (FName).
 * What is the last_name (LName) of the first tuple in the result?
 */
SELECT  first_name "FName",
        last_name "LName",
        department_id,
        depart_name
FROM    employees JOIN departments USING(department_id)
ORDER BY first_name ASC;

/* Q3
 * Show the employee_id as the alias "EmpID", last_name as the alias "LName", 
 * his/her manager_id as the alias "ManID", and manager's last name as the 
 * alias "ManLName" in the ascending alphabetical order of employee_id (EmpID). 
 * What is the manager's last_name (ManLName) of the first tuple in the result?
 */
SELECT  E.employee_id "EmpID",
        E.last_name "LName",
        M.employee_id "ManID",
        M.last_name "ManLName"
FROM    employees E
JOIN    employees M
ON      E.manager_id = M.employee_id
ORDER BY "EmpID" ASC;

/* Q4
 * Show the first_name as the alias "FName", last_name as the alias "LName", 
 * and hire_date as the alias "HireDate" who were hired after 'Jones' in the 
 * ascending order of hire_date. ('Jones' is a last name.)
 * What is the last_name (LName) of the first tuple in the result?
 */
SELECT  first_name "FName",
        last_name "LName",
        hire_date "HireDate"
FROM    employees
WHERE   hire_date >
(
    SELECT  hire_date
    FROM    employees
    WHERE   last_name = 'Jones'
)
ORDER BY hire_date ASC;

/* Q5
 * Show the department name as the alias "DeptName" and number of employees in 
 * the department as the alias "NumDept" in the ascending alphabetical order of 
 * the department name (DeptName).
 * What is the number of employees of the first tuple in the result?
 */
SELECT  depart_name "DeptName",
        COUNT(*) "NumDept"
FROM    employees
JOIN    departments USING(department_id)
GROUP BY department_id
ORDER BY "DeptName" ASC;

/* Q6
 * Show the employee_id as the alias "EmpID", job title, and number of years 
 * between ending date and starting date as the alias "Years" for all jobs in 
 * the department 90 from the 'job_history' table in the ascending alphabetical 
 * order of the job title.
 * What is the value of "Years" of the first tuple in the result?
 * (Hint: difference in years can be calculated by simple substraction)
 */
SELECT  employee_id "EmpID",
        job_title,
        end_date,
        start_date
FROM    job_history
JOIN    jobs USING(job_id)
ORDER BY job_title ASC;

/* Q7
 * Show the department ID as the alias "DeptID", department name as the alias 
 * "DeptName", and manager's first name as the alias "ManFName" in the 
 * ascending order of department_id.
 * What is the manager's first_name (ManFName) of the first tuple in the result?
 */
SELECT  D.department_id "DeptID",
        D.depart_name "DeptName",
        M.first_name "ManFName"
FROM    departments D,
        employees M
WHERE   D.manager_id = M.employee_id
ORDER BY "DeptID" ASC;

/* Q8
 * Show the department name as the alias "DeptName", manager's first name as 
 * the alias "ManFName", and city in the ascending alphabetical order of the 
 * department name (DeptName).
 * What is the manager's first_name (ManFName) of the first tuple in the result?
 */
SELECT  D.depart_name "DeptName",
        M.first_name "ManFName",
        L.city
FROM    departments D,
        employees M,
        locations L
WHERE   D.manager_id = M.employee_id
AND     D.location_id = L.location_id
ORDER BY "DeptName" ASC;

/* Q9
 * Show the job_title as the alias "JobTitle" and average salary of employees 
 * for each job in the ascending alphabetical order of job_title (JobTitle). 
 * What is the average salary of the first tuple in the result? Write an integer
 */
SELECT  job_title "JobTitle",
        AVG(salary)
FROM    employees
JOIN    jobs USING(job_id)
GROUP BY job_id
ORDER BY job_title ASC;

/* Q10
 * Show the job_title as the alias "JobTitle", employee's first name as the 
 * alias "EmpFName", and difference between his/her salary and minimum salary 
 * for the job as the alias "Diff" in the ascending alphabetical order of 
 * employee's first_name (EmpFName).
 * What is the value of "Diff" of the first tuple in the result?
 */
SELECT  job_title "JobTitle",
        first_name "EmpFName",
        salary - min_salary "Diff"
FROM    employees
JOIN    jobs USING(job_id)
ORDER BY "EmpFName" ASC;

/* Q11
 * Show the job history (all attributes in 'job_history') of any employee who's 
 * current salary is more than 10000 in the ascending order of department_id. 
 * What is the employee_id of the first tuple in the result?
 */
SELECT  H.*
FROM    employees E
JOIN    job_history H USING(employee_id)
WHERE   E.salary > 10000
ORDER BY department_id ASC;