--JOIN
--ORACLE JOIN

--CROSS JOIN(CATESIAN PRODUCT)
SELECT
    empno,
    ename,
    job,
    sal,
    emp.deptno     "edeptno",
    dept.deptno    "ddeptno",
    dname,
    loc
FROM
    emp,
    dept;
--table alias는 as를 기술하면안됨
SELECT
    empno,
    ename,
    job,
    sal,
    e.deptno    "edeptno",
    d.deptno    "ddeptno",
    dname,
    loc
FROM
    emp   e,
    dept  d;
--EQU JOIN(동등조인)
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp   e,
    dept  d
WHERE
    e.deptno = d.deptno;

SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
    emp   e,
    dept  d
WHERE
        e.deptno = d.deptno
    AND e.deptno = 10;
--NON-EQU JOIN(비동등조인)
SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    salgrade;

SELECT
    empno,
    ename,
    sal,
    grade,
    losal,
    hisal
FROM
    emp       e,
    salgrade  g
WHERE
        e.sal >= g.losal
    AND e.sal <= g.hisal;

--inner join(조인조건에 만족하는 행만 출력)
--부서에소속된사원정보만 출력(부서를 배정받은사원)
SELECT
    empno,
    ename,
    dname,
    loc
FROM
    emp   e,
    dept  d
WHERE
    e.deptno = d.deptno;

--outer join(조인조건에 만족하지않는행도 출력)

--left outer join[조인조건에 만족하지않는 emp행들출력]
--부서에소속된사원정보와 부서에 소속되지않은 사원정보모두출력(모든사원)
SELECT
    empno,
    ename,
    dname,
    loc
FROM
    emp   e,
    dept  d
WHERE
    e.deptno = d.deptno (+); -- +하면 null인 값까지 출력되는거같다.

--right outer join[조인조건에 만족하지않는 dept행들출력]
SELECT
    empno,
    ename,
    dname,
    loc
FROM
    emp   e,
    dept  d
WHERE
    e.deptno (+) = d.deptno; --홍길동 지워져서... 

--self join
--inner join(매니저번호가 존재하는 사원만 출력)
SELECT
    e.empno    "사원번호",
    e.ename    "사원이름",
    e.mgr      "사원매니저번호",
    m.empno    "매니저사원번호",
    m.ename    "매니저이름"
FROM
    emp  e,
    emp  m
WHERE
    e.mgr = m.empno;

--outer joinn(사원이 없는 매니저도 출력)
--right outer join
SELECT
    e.empno    "사원번호",
    e.ename    "사원이름",
    e.mgr      "사원매니저번호",
    m.empno    "매니저사원번호",
    m.ename    "매니저이름"
FROM
    emp  e,
    emp  m
WHERE
    e.mgr (+) = m.empno; --위랑 똑같은데 여기에 (+)만 들어감

--outer joinn(매니저없는 사원도 출력)
--left outer join
SELECT
    e.empno    "사원번호",
    e.ename    "사원이름",
    e.mgr      "사원매니저번호",
    m.empno    "매니저사원번호",
    m.ename    "매니저이름"
FROM
    emp  e,
    emp  m
WHERE
    e.mgr = m.empno (+); --위랑 똑같은데 여기에 (+)위치바뀜 

--3개 이상의 테이블조인
SELECT
    e.empno,
    e.ename,
    e.sal,
    e.deptno,
    g.losal,
    g.hisal,
    g.grade,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp       e,
    dept      d,
    salgrade  g
WHERE
        e.deptno = d.deptno (+)
    AND e.sal >= g.losal (+)
    AND e.sal <= g.hisal (+);

--SQL 1999(SQL3)조인(표준조인, ANSI조인)
SELECT
    *
FROM
         emp
    CROSS JOIN dept;
--select * from emp ,dept; (oracle)

--NATURAL JOIN  같은이름을가진컬럼을 비교한다.
--inner join 생략되있는건 전부 inner
SELECT
    empno,
    ename,
    dname
FROM
         emp e
    NATURAL JOIN dept d;

--left outer join
SELECT
    empno,
    ename,
    dname,
    loc
FROM
    emp   e
    NATURAL LEFT OUTER JOIN dept  d;
--right outer join
SELECT
    empno,
    ename,
    dname,
    loc
FROM
    emp   e
    NATURAL RIGHT OUTER JOIN dept  d;
--full outer join
SELECT
    empno,
    ename,
    dname,
    loc
FROM
    emp   e
    NATURAL FULL OUTER JOIN dept  d;

--자동정렬(ctrl + f7)
-- 대소문자변경 단축키(alt + ')

--using 구분 (동일이름의 컬럼이 여러 개인 경우 조인 컬럼을 지정)
--inner join

--join-on 이용한 join
--inner join
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.deptno,
    d.dname,
    d.loc
FROM
         emp e
    INNER JOIN dept d ON e.deptno = d.deptno;
--left
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp   e
    LEFT JOIN dept  d ON e.deptno = d.deptno;
--right
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp   e
    RIGHT OUTER JOIN dept  d ON e.deptno = d.deptno;
    
    --full outer join
SELECT
    e.empno,
    e.ename,
    e.deptno,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp   e
    FULL OUTER JOIN dept  d ON e.deptno = d.deptno;
    
    --self join
    --inner join  아무것도 안쓰면 inner이다
SELECT
    e.empno    "사원번호",
    e.ename    "사원이름",
    m.empno    "매니저사원번호",
    m.ename    "매니저이름"
FROM
         emp e
    JOIN emp m ON e.mgr = m.empno;
    
       --left outer join (매니저가 없는 사원도 포함)
SELECT
    e.empno    "사원번호",
    e.ename    "사원이름",
    m.empno    "매니저사원번호",
    m.ename    "매니저이름"
FROM
    emp  e
    LEFT OUTER JOIN emp  m ON e.mgr = m.empno;
    
           --right outer join(사원이 없는 매니저도 포함) --> 매니저가 아닌 사원
SELECT
    e.empno    "사원번호",
    e.ename    "사원이름",
    m.empno    "매니저사원번호",
    m.ename    "매니저이름"
FROM
    emp  e
    RIGHT OUTER JOIN emp  m ON e.mgr = m.empno;
    
    
--join on 이용한 join

/*
on 조인 조건에서 필터링하는 경우  vs where 구문에서 필터랑하는 경우
***outer join시에 차이가 발생!! (inner는 동일) 
*/

SELECT
    e.empno,
    e.ename,
    e.sal,
    d.dname,
    d.loc
FROM
    emp   e
    LEFT OUTER JOIN dept  d ON e.deptno = d.deptno
                              AND e.sal >= 1000;
--위와밑에 비교(서로다른 결과가 나온다) where를 쓰는것이 더 좋다
SELECT
    e.empno,
    e.ename,
    e.sal,
    d.dname,
    d.loc
FROM
    emp   e
    LEFT OUTER JOIN dept  d ON e.deptno = d.deptno
WHERE
    e.sal > 1000;
    
select d.deptno, d.dname, e.sal from emp e right outer join dept d on e.deptno=d.deptno;

/*
급여가 2000이 넘는 직원들에 대해 각 부서별 급여의 합을 구하시오.
*/
-- 1. 원데이타(부서,급여)
select d.deptno,d.dname,e.sal from emp e right outer join dept d on e.deptno=d.deptno;
-- 2.각 부서별 급여의 합을 구하시오.
select d.deptno,decode(sum(e.sal),null,0,sum(e.sal)) "부서별급여합계" 
from emp e right outer join dept d on e.deptno=d.deptno
group by d.deptno
order by d.deptno asc;

-- 3.급여가 2000이 넘는 직원들에 대해 각 부서별 급여의 합을 구하시오

select d.deptno,decode(sum(e.sal),null,0,sum(e.sal)) "부서별급여합계" 
from emp e right outer join dept d on e.deptno=d.deptno
where e.sal>2000
group by d.deptno
order by d.deptno asc;


select d.deptno,decode(sum(e.sal),null,0,sum(e.sal)) "부서별급여합계" 
from emp e right outer join dept d on e.deptno=d.deptno and e.sal>2000
group by d.deptno
order by d.deptno asc;

