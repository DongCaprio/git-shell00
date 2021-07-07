select * from student; --전체보기

--1번
--1의 결과1
select name, substr(jumin, 3, 4) "Birthday" from student where deptno1 = 101;
--1의 결과2
select name, substr(jumin,3,2)||'월' ||substr(jumin,5,2)||'일'  "Birthday" from student where deptno1 = 101;

--2번
select name, tel, substr(tel, 1, instr(tel,')')-1 )  "AREA CODE" from student where deptno1 = 201;

--3번
-- 3-1
select name , jumin , rpad(substr(jumin, 1,6), 13, '*') "REPLACE" from student;
-- 3-2
select name , jumin , substr(jumin, 1,6)||'-'||'*******' "REPLACE" from student;

--4번
select name, tel ,  substr(tel, 1, instr(tel,'-'))||'****' "REPLACE" from student;