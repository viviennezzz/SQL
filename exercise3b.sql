SELECT ROUND(salary,-3) AS RDSAL, TRUNC(salary,-3) AS TSAL, salary FROM employees WHERE department_id = 30 ORDER BY salary;

SELECT LOWER(first_name) AS LNAME, UPPER(last_name) AS UNAME FROM employees WHERE department_id = 30 ORDER BY LNAME;

SELECT substr(first_name, 1, 1) || '. ' || last_name AS NAME FROM employees WHERE department_id = 30 ORDER BY NAME;

SELECT street_address, LTRIM(street_address, '0123456789 -')  AS "Street Name" FROM locations ORDER BY "Street Name";

SELECT street_address, LENGTH(street_address) AS Length FROM locations ORDER BY Length;

SELECT location_id, street_address, city, state_province FROM locations WHERE REGEXP_LIKE(UPPER(street_address), '*RU(E|A)*') ORDER BY location_id desc;

