-- exercise 12.1: Working with Triggers

CREATE OR REPLACE FUNCTION func_salary
(parm_job_id IN employees.job_id%TYPE)
RETURN jobs.min_salary%TYPE IS
return_value jobs.min_salary%TYPE;
BEGIN
SELECT jobs.min_salary
INTO return_value
FROM jobs 
WHERE jobs.job_id = parm_job_id;
RETURN return_value;
END func_salary;
/
CREATE OR REPLACE TRIGGER emp_before_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
:NEW.salary := func_salary(:NEW.job_id);
END;
/
INSERT INTO employees (employee_id, last_name, email,
hire_date, job_id)
VALUES (9999, 'ABBY', 'SABBYZGMAIL', '18-SEP-10',
'PU_CLERK');
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE employee_id = 9999 AND job_id = 'PU_CLERK';

rollback;
select * from employees;