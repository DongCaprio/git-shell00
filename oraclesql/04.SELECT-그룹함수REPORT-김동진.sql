select * from emp;
--1
select deptno
from emp
group by deptno
having count(*) >= 6
order by deptno;

--2
select deptno , --decode는 if else와 비슷/ job이 '~~~'과 동일하면 그에맞는 sal을 출력
        sum(decode(job, 'CLERK', sal)) CLERK ,-- CLERK, sum(0) MANAGER ,sum(0) PRESIDENT,sum(0) ANALYST,sum(0) SALESMAN
        sum(decode(job, 'MANAGER', sal)) MANAMGER,
        sum(decode(job, 'PRESIDENT', sal)) PRESIDENT,
        sum(decode(job, 'ANALYST', sal)) ANALYST ,
        sum(decode(job, 'SALESMAN', sal)) SALESMAN
from emp
group by deptno
order by deptno;


--3
select to_char(hiredate, 'YYYY') 년, to_char(hiredate, 'MM') 월, sum(sal)
from emp
group by to_char(hiredate, 'YYYY'), to_char(hiredate, 'MM')
order by to_char(hiredate, 'YYYY'), to_char(hiredate, 'MM');


--4-1
select deptno, sum(sal)*12 "연봉" from emp 
group by deptno
order by deptno;
--4-2 --nvl2는 null이 아니면 1번째값 null이면 2번째값 반환
select deptno, sum(sal)*12 + nvl2(sum(comm)*12,sum(comm)*12, 0) "연봉" from emp
group by deptno
order by deptno;

--5 --그룹핑은 having쓰기!
select job, sum(sal) from emp
group by job
having job <> 'SALESMAN';



