SELECT ename, TO_CHAR(sal,'$9,999') FROM emp ORDER BY sal;

SELECT ename, TO_CHAR(hiredate,'yyyy-mm-dd') FROM emp ORDER BY hiredate;

SELECT SYSDATE, TO_CHAR(sysdate, 'hh:mm:ss') AS TIME FROM dual;


