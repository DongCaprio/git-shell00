--set(집합연산자)
-- union(합집합-중복제거)

--cde가 중복되는거같다

select val from a;
select num, val from b;

select val from a
union
select val from b; --중복이 알아서 합쳐진다

--union all(합집합-중복)
select val from a
union all
select val from b; --중복된것도 그대로 출력됨

--intersect(교집합)
select val from a
intersect
select val from b;

--minus(차집합)  --위에 a랑 b랑 순서를 바꿨을 때 다른 결과가 나온다
select val from a
minus
select val from b;

--전체사원들의 급여, 전체사원들의 급여총합
select empno, ename, sal from emp
union
select null, '급여의총합', sum(sal) from emp;


