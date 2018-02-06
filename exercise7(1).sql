--Exercise 7.1: Using the Aggregate Functions

SELECT COUNT(*) AS COUNT FROM emp;

SELECT empno, ename, sal, comm FROM emp ORDER BY sal;

SELECT COUNT(sal) AS COUNT, COUNT(DISTINCT sal) AS CDISTINCT 
FROM emp 
WHERE sal IS NOT NULL;

SELECT COUNT(DISTINCT comm) AS COUNT, SUM(comm) AS SUM, AVG(comm) AS AVERAGE
FROM emp
WHERE comm IS NOT NULL;

SELECT COUNT(DISTINCT comm) AS COUNT, SUM(comm) AS SUM, AVG(comm) AS AVERAGE, AVG(COALESCE(comm, 0)) AS AVERAGE
FROM emp;

SELECT MAX(sal) AS MAXIMUM, MIN(sal) AS MINIMUM FROM emp;

SELECT MAX(hiredate) AS MAXIMUM, MIN(hiredate) AS MINIMUM FROM emp;

