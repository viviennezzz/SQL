-- Exercise 11.1: Stored Procedures, Functions, and Packages

CREATE OR REPLACE PROCEDURE update_emp
    (parm_employee_id IN employees.employee_id%TYPE
    ,parm_last_name IN employees.last_name%TYPE
    ,parm_email IN employees.email%TYPE
    ,parm_hire_date IN employees.hire_date%TYPE
    ,parm_job_id IN employees.job_id%TYPE
    ,parm_salary IN employees.salary%TYPE) IS
BEGIN
    UPDATE employees
    SET salary = parm_salary
    WHERE employee_id = parm_employee_id
    AND last_name = parm_last_name
    AND hire_date = parm_hire_date
    AND job_id = parm_job_id;
    
    IF SQL%NOTFOUND THEN
        INSERT INTO employees (employee_id, last_name, email, hire_date, job_id, salary)
        VALUES(parm_employee_id, parm_last_name, parm_email, parm_hire_date, parm_job_id, parm_salary);
    END IF;
END update_emp;
/

BEGIN
update_emp(110, 'Chen', 'JCHEN', '28-SEP-1997', 'FI_ACCOUNT', 2000);
END;
/
BEGIN
update_emp(999, 'Johnston', 'SJOHNSTON', '28-SEP-2010',
'PU_CLERK', 2000);
END;
/
SELECT employee_id, last_name, email, hire_date, job_id, salary
FROM employees
WHERE last_name IN ('Chen', 'Johnston');
ROLLBACK;


DROP PROCEDURE update_emp;
CREATE OR REPLACE PACKAGE pack_employee IS
PROCEDURE update_emp
(parm_employee_id IN employees.employee_id%TYPE
,parm_last_name IN employees.last_name%TYPE
,parm_email IN employees.email%TYPE
,parm_hire_date IN employees.hire_date%TYPE
,parm_job_id IN employees.job_id%TYPE
,parm_salary IN employees.salary%TYPE
,parm_department_id IN employees.department_id%TYPE);
END pack_employee;
/
 CREATE OR REPLACE PACKAGE BODY pack_employee IS
FUNCTION check_manager
(parm_department_id IN employees.department_id%TYPE)
RETURN NUMBER IS
dept_mgr_id NUMBER := NULL;
BEGIN
SELECT manager_id
INTO dept_mgr_id
FROM departments
WHERE department_id = parm_department_id;
RETURN dept_mgr_id;
END check_manager;
PROCEDURE update_emp
(parm_employee_id IN employees.employee_id%TYPE
,parm_last_name IN employees.last_name%TYPE
,parm_email IN employees.email%TYPE
,parm_hire_date IN employees.hire_date%TYPE
,parm_job_id IN employees.job_id%TYPE
,parm_salary IN employees.salary%TYPE
,parm_department_id IN employees.department_id%TYPE) IS
BEGIN
UPDATE employees
SET salary = parm_salary
WHERE employee_id = parm_employee_id
AND last_name = parm_last_name
AND hire_date = parm_hire_date
AND job_id = parm_job_id;
IF SQL%NOTFOUND THEN
IF check_manager (parm_department_id)
IS NOT NULL THEN
INSERT INTO employees (employee_id,last_name, email, hire_date, job_id, salary,
department_id)
VALUES (parm_employee_id, parm_last_name, parm_email, parm_hire_date, parm_job_id,
parm_salary, parm_department_id);
END IF;
END IF;
END update_emp;
END pack_employee;
/
BEGIN
pack_employee.update_emp(999, 'Johnston', 'SJOHNSTON',
'28-SEP-2010', 'PU_CLERK', 2000, 100);
END;
/
SELECT employee_id, last_name, email,
hire_date, job_id, salary
FROM employees
WHERE last_name IN ('Johnston');
ROLLBACK;