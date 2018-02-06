SELECT * FROM Employees;

SELECT * FROM Departments;

SELECT * FROM Employees, Departments;

SELECT employee_id, first_name, last_name, department_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id
WHERE employees.first_name LIKE 'S%';

--Exercise 4.1

SELECT locations.city, departments.location_id, departments.department_name
FROM locations
JOIN departments
ON locations.location_id = departments.location_id;

SELECT countries.country_name, locations.city
FROM locations
JOIN countries
on locations.country_id = countries.country_id;

SELECT countries.country_name, locations.city, departments.department_name 
FROM locations
JOIN countries ON locations.country_id = countries.country_id
JOIN departments ON departments.location_id = locations.location_id;

SELECT employees.employee_id, employees.first_name, employees.last_name, job_history.job_id
FROM employees
JOIN job_history
ON employees.employee_id = job_history.employee_id
ORDER BY employees.employee_id;

SELECT jobs.job_title, job_history.employee_id, job_history.start_date
FROM jobs
JOIN job_history 
ON jobs.job_id = job_history.job_id
WHERE job_history.start_date > '01-JAN-1990';

SELECT jobs.job_title, job_history.employee_id, job_history.start_date, employees.first_name, employees.last_name
FROM jobs
JOIN job_history 
ON jobs.job_id = job_history.job_id
JOIN employees
ON employees.employee_id = job_history.employee_id;

--Exercise 4.2

SELECT employees.employee_id, employees.first_name, employees.last_name, job_history.job_id
FROM job_history 
Right OUTER JOIN employees
ON employees.employee_id = job_history.employee_id
ORDER BY employees.employee_id;

SELECT jobs.job_title, job_history.employee_id
FROM jobs
LEFT OUTER JOIN job_history 
ON jobs.job_id = job_history.job_id;

SELECT jobs.job_title, job_history.employee_id
FROM jobs
LEFT OUTER JOIN job_history 
ON jobs.job_id = job_history.job_id
WHERE jobs.min_salary > 9000;

SELECT jobs.job_title, job_history.employee_id, job_history.start_date
FROM jobs
LEFT OUTER JOIN job_history 
ON jobs.job_id = job_history.job_id
WHERE job_history.start_date > '01-JAN-1990' OR job_history.start_date IS NULL;

SELECT jobs.job_title, job_history.employee_id, job_history.start_date, employees.first_name, employees.last_name
FROM jobs
LEFT OUTER JOIN job_history 
ON jobs.job_id = job_history.job_id
LEFT OUTER JOIN employees
ON job_history.employee_id = employees.employee_id;

SELECT jobs.job_title, job_history.employee_id, job_history.start_date, employees.first_name, employees.last_name
FROM employees
LEFT OUTER JOIN job_history
ON job_history.employee_id = employees.employee_id
LEFT OUTER JOIN jobs
ON jobs.job_id = job_history.job_id;




