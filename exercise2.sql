SELECT  dname, deptno FROM DEPT;

SELECT * FROM DEPT;

SELECT dname AS Name, deptno AS "DEPT#", loc AS "Dept Location" FROM dept;

SELECT ename FROM emp;

SELECT DISTINCT deptno FROM emp ORDER BY deptno;

SELECT deptno, job FROM emp;

SELECT DISTINCT deptno, job FROM emp ORDER BY deptno;

SELECT ename FROM emp WHERE deptno = 30;

SELECT ename FROM emp WHERE hiredate = '17-DEC-1981';

SELECT ename FROM emp WHERE hiredate > '17-DEC-1981';

SELECT ename FROM emp WHERE job = 'clerk';

SELECT ename FROM emp WHERE job = 'CLERK';

SELECT ename FROM emp WHERE sal > 2500;

SELECT ename FROM emp WHERE sal between 1000 AND 1600;

SELECT ename FROM emp WHERE ename LIKE '%ER';

SELECT ename, empno FROM emp WHERE comm IS NULL;

SELECT ename, empno, comm FROM emp ORDER BY comm ASC;

SELECT ename, empno, comm FROM emp ORDER BY comm DESC; 

SELECT ename, empno, comm FROM emp ORDER BY comm DESC NULLS FIRST;

SELECT ename, empno, comm FROM emp ORDER BY comm DESC NULLS LAST;

