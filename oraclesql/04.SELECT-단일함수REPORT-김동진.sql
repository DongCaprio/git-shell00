select * from emp;

--1. 입사일이 12월인 사원의 사번, 사원명, 입사일
select empno "사번", ename 사원명, hiredate 입사일 from emp where to_char(hiredate, 'MM') = '12';

--2
select empno, ename, lpad(sal,10,'*') "급여" from emp;

--3
select empno, ename, replace(hiredate,'/','-') 입사일 from emp;

--4
select empno, ename, sal , (case when sal > 4000 then 'A' 
                                 when sal > 3000 then 'B'   
                                 when sal > 2000 then 'C'
                                 when sal > 1000 then 'D'
                                 else 'E' end)  "등급"
from emp
order by sal;