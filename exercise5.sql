--Exercise 5.1: Additional SQL Functions

SELECT ename, sal, comm, NVL(comm, '0') + sal "Total Compensation"
FROM emp
ORDER BY ename;

SELECT ename, sal, comm, COALESCE(comm, 0) + sal "Total Compensation"
FROM emp
ORDER BY ename;

SELECT departments.department_id, employees.first_name, employees.last_name, employees.hire_date
FROM departments
JOIN employees
ON departments.department_id = employees.department_id
WHERE departments.department_id in (30, 50) AND employees.hire_date > '01-JAN-1999' AND employees.hire_date < '01-JAN-2009'
ORDER BY departments.department_id, employees.hire_date;

SELECT departments.department_id, employees.first_name, employees.last_name, TO_CHAR(employees.hire_date, 'DD-MON-YYYY: HH24:MI:SS')
FROM departments
JOIN employees
ON departments.department_id = employees.department_id
WHERE departments.department_id = 30
ORDER BY employees.hire_date;


