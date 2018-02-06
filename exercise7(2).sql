-- Exercise 7.2a: GROUP BY and Having

SELECT department_id, COUNT(employee_id) AS COUNT, MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary)) AS "Avg Salary"
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, COUNT(employee_id) AS COUNT, MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary)) AS "Avg Salary"
FROM employees
GROUP BY department_id
ORDER BY "Avg Salary";

SELECT department_id, COUNT(employee_id) AS COUNT, MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary)) AS "Avg Salary", (ROUND(AVG(salary))-MIN(salary)) AS "Above Avg"
FROM employees
GROUP BY department_id
ORDER BY "Above Avg" DESC;

SELECT manager_id, COUNT(employee_id) AS COUNT, MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary)) AS "Avg Salary", (ROUND(AVG(salary))-MIN(salary)) AS "Above Avg"
FROM employees
GROUP BY manager_id
ORDER BY "Above Avg" DESC;

SELECT department_id AS DEPTID, manager_id AS MGRID, COUNT(employee_id) AS COUNT, MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary)) AS "Avg Salary", (ROUND(AVG(salary))-MIN(salary)) AS "Above Avg"
FROM employees
GROUP BY manager_id, department_id
ORDER BY "Above Avg" DESC;

SELECT department_id AS DEPTID, manager_id AS MGRID, COUNT(employee_id) AS COUNT, MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary)) AS "Avg Salary", (ROUND(AVG(salary))-MIN(salary)) AS "Above Avg"
FROM employees
GROUP BY manager_id, department_id
HAVING count(employee_id) > 5
ORDER BY "Above Avg" DESC;

SELECT TRUNC(department_id,-2) "Depts by 100s", SUM(SALARY), AVG(SALARY), COUNT(*)  
FROM employees
GROUP BY TRUNC(department_id, -2)
ORDER BY "Depts by 100s";

SELECT ROUND(AVG(AVG(salary))) AS "Avg  of Dept Avgs"
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM employees;

-- Exercise 7.2b: Using Multiple Tables and Subqueries

SELECT d.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 0
ORDER BY d.department_id;

SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees e2)
ORDER BY salary desc;

SELECT e.employee_id, e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary = (SELECT MAX(salary) FROM employees e2);

SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.commission_pct
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees e2) AND e.commission_pct > (SELECT AVG(commission_pct) FROM employees e3)
ORDER BY e.last_name;

SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE e.department_id = 
(SELECT department_id from departments 
WHERE departments.location_id = 
(SELECT locations.location_id
from locations 
join departments on locations.location_id = departments.location_id 
WHERE locations.city = 'London'));



