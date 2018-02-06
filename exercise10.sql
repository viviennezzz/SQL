-- Exercise 10.1: Building Anonymous Blocks

DECLARE
    emp_rec employees%ROWTYPE;
BEGIN
    SELECT * INTO emp_rec FROM employees
    WHERE last_name = 'Austin';
    IF emp_rec.commission_pct IS NULL OR emp_rec.commission_pct = 0 THEN
    UPDATE employees 
    SET salary = salary + 500;
    ELSIF emp_rec.commission_pct < 0.2 THEN
    UPDATE employees 
    SET salary = salary + 300;
    ELSE
    UPDATE employees 
    SET salary = salary + 100;
    END IF;
END;
/

SELECT last_name, salary
FROM employees
WHERE last_name = 'Austin';

rollback;

-- Exercise 10.2: Using Cursors

DECLARE
    new_salary NUMBER(4) := 5000;
    v_date date := '01-JAN-1994';
    CURSOR employee_cursor (in_date_hired DATE) IS 
    SELECT hire_date FROM employees 
    WHERE hire_date < v_date
    FOR UPDATE;
    cursor_record employee_cursor%ROWTYPE;
BEGIN
    OPEN employee_cursor(v_date);
    LOOP
    FETCH employee_cursor INTO cursor_record;
    EXIT WHEN employee_cursor%NOTFOUND;
    UPDATE employees
    SET salary = new_salary
    WHERE CURRENT OF employee_cursor;
    END LOOP;
CLOSE employee_cursor;
END;
/
SELECT last_name, salary, hire_date 
FROM employees
WHERE salary = 5000;

rollback;

-- Use the FOR-LOOP cursor instead of the regular cusor with a LOOP

DECLARE
    new_salary NUMBER(4) := 5000;
    v_date date := '01-JAN-1994';
    CURSOR employee_cursor (in_date_hired DATE) IS 
    SELECT hire_date FROM employees 
    WHERE hire_date < v_date
    FOR UPDATE;
    cursor_record employee_cursor%ROWTYPE;
BEGIN
    FOR cursor_record in employee_cursor(v_date) 
    LOOP
    UPDATE employees
    SET salary = new_salary
    WHERE CURRENT OF employee_cursor;
    END LOOP;
END;
/
SELECT last_name, salary, hire_date 
FROM employees
WHERE salary = 5000;

rollback;