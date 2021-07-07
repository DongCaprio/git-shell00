--1. 연봉계산
select emp_name, salary/18, salary*2/18 from temp;

select * from temp; --전체정보확인
desc temp;

--2. 교통비 10만원 추가(짝수달은 20만원 추가)
select emp_name, salary/18+100000 "100000+SAL", salary*2/18+200000 "200000+SAL" from temp;

--3. TEMP자료 중 EMP_ID ,EMP_NAME을 각각 '사번', '이름'으로 변경
select emp_id "사번", emp_name "성명" from temp;

--4.성명을 보여줄때 직급을 괄호 안에 넣기
select emp_name||'('||lev||' )' "성명 "from temp;
--4.2 직급옆에 ' '붙히기
select emp_name||''''||lev||'''' "성명" from temp;

--6. 성명, 생년월일 작음따옴표로 묶어서 하나의 문자열로 만들어 sql작성

SELECT ''''||emp_name||birth_date||'''' "NAME_BIRTH" from temp;

select empno, ename, job , deptno from emp where 1=1;
select empno, ename, job, deptno from emp where deptno=30;

select empno, ename, job, hiredate
from emp 
where job='SALESMAN'; --이렇게 3줄로 나눠써도가능/ ;로 구분만 잘하기

--비교연산자
select * from emp where sal = 2000;
select * from emp where sal >= 2000;
select * from emp where sal <= 2000;
select * from emp where sal <> 2000;

select * from emp where job = 'SALESMAN';
select * from emp where job != 'SALESMAN';
select * from emp where job ^= 'SALESMAN';
select * from emp where job <> 'SALESMAN';

select * from emp where job < 'MANAAGER'; --이것도 실행이 된다(문자열기준 작은거큰걸로 구분가능)
select * from emp where ename > 'K'; --여기서는 K는 대문자소문자 비교!(K와 k는 다르다)
select * from emp where ename < 'K'; 

--is null, is not null
select * from emp  where comm = null; --이거는 안되는 구문(실행안됨)이렇게 코딩X
select * from emp where comm is null; --null 비교는 이렇게 is null과 is not null로 한다.
select * from emp where comm is not null;

select * from emp where mgr is null ;
select * from emp where mgr is not null;

--between
select * from emp where sal between 1000 and 2000;
select * from emp where sal >=1000 and sal<= 2000; --바로위에줄과 밑에줄은 동일한 결과

--in
select * from emp where empno in(7369, 7788, 7839);--3개와 동일한 empno가 뽑혀나옴, 만약 일치하지않는게 있다면 오류는 안뜨고 그냥 안뜬다 ex) 11이렇게 있으면 그냥 그건 안뜸
select * from emp where empno=7369 or empno = 7788 or empno= 7839; --이건 바로위에 줄과 동일(이게 더 귀찮음으로 위에꺼 많이쓴다)
select * from emp where job in('SALESMAN' , 'CLERK');
select * from emp where job = 'SALESMAN' or job = 'CLERK'; --바로위에줄과 밑에줄은 동일

--LIKE연산( % , _ )
select empno, ename, sal from emp where ename like 'S%'; -- S%는 S로 시작하는얘들 전부를 지칭
select empno, ename, sal from emp where ename like '%S'; --마지막이 s로 끝나는것 (%를 잘쓰자. 많이씀 꼭 알기 글자수는 상관X)
select empno, ename, sal from emp where ename like '%S%'; --s가 중간이든 첫번째든 끝이든 결론은 S가 들어가는 모든것 출력
select empno, ename, sal from emp where ename like '____'; --이름이 4글자인애 출력
select empno, ename, sal from emp where ename like '%T_'; --앞에 뭐가오든 안오든 상관없지만 T뒤에는 반드시 1글자가 있어야된다. 2글자도 안됨
select empno, ename, sal from emp where ename like '_L___'; --총 5글자인데 2번째 글자가 L인것
select empno, ename, sal from emp where ename like '__L%'; --3번째 글짜가 L인데 뒤에는 아무거나(글자수) 상관없음
select * from temp where emp_name like '%동'; --뭔지몰라도 마지막글자가 동

select * from emp where ename like '%\%%' escape '\'; --escape연산자 지정은 마지막에 내맘대로 대부분\로 한다.
select * from emp where ename like '%\_%' escape '\'; --이것도 위에줄과 마찬가지

select * from emp where hiredate like '80/12/17';
--여기서는 emp말고 temp로 확인
select * from temp;
select * from temp where emp_id like '1996____'; --1996년에 입사한애(뒤에 _가 4개이므로 뒤에는 아무거나와도되지만 반드시 4글자가와야된다)
select * from temp where emp_id like '1996____' and lev != '과장'; --1996에 입사하고 과장이 아닌 사람
select * from emp where hiredate like '__/12/__';

--논리연산
select * from temp where emp_id like '1996____' and lev <> '과장';
select * from temp where emp_id like '1996____' and lev ^= '과장';

select * from emp where job ='SALESMAN' and sal >= 1500;
select * from emp where hiredate like '__/12/__';
select * from emp where sal>=2001 and sal <=3000 and job = 'MANAGER';
select * from emp where sal>=2001 and sal <=3000 or job = 'MANAGER';
select * from emp where job = 'SALESMAN' or job ='CLERK';

/*
5) TEMP테이블에서 HOBBY가 NULL이 아닌 사람의 성명을 읽어오는 SQL을 작성
*/
select * from temp where hobby is not null;

--7) emp테이블을 이용해서 취미가 있는 사람 중 직급이 과장인 사람의 사번, 성명 취미를 읽어오는 sql작성
select emp_id "사번", emp_name "성명", hobby "취미", lev "직급" from temp 
where hobby is not null and lev ='과장';  --이렇게 길면 2줄로 나눠서 작성

--정렬
select * from emp where 1=1 order by empno; --아무것도 안하면 오름차순
select * from emp where 1=1 order by empno asc; -- asc 쓰면 오름차순(그러나 asc는 생략가능해서 생략해서쓴다 보통)
select * from emp where 1=1 order by empno desc; --desc 쓰면 내림차순
--order는 저 윗줄에서 마지막으로 작업됨(select 먼저전부 되고 마지막에 정렬된다)
select * from emp order by sal desc; --급여높은순
--숫자정렬
select empno, ename, sal "월급", sal*12 "연봉" from emp;
select empno, ename, sal "월급", sal*12 "연봉"from emp order by "연봉" desc; --급여 곱하기12의 내림차순으로 정렬
select empno, ename, sal, sal*12 from emp order by 2 desc; --여기서 숫자는 컬럼 2면 ename순으로 정렬(여기서는 시작인덱스가 1임 0아님)
select empno, ename, sal, sal*12 from emp order by 4 ; --4번째꺼 오름차순 (sal * 12)
--문자정렬
select * from emp order by ename;
select * from emp order by ename asc;
select * from emp order by ename desc; --이름도 오름차순 내림차순 가능

--날짜정렬
select empno, ename, hiredate from emp order by hiredate; --시간 옛날꺼부터 요즘순으로 나옴
select empno, ename, hiredate from emp order by hiredate desc; --시간 최근꺼부터 옛날순으로 나옴
select * from temp order by birth_date;
select * from temp order by birth_date desc;

--2차정렬
select empno, ename,sal from emp order by sal desc; --샐러리순으로정렬(근데 sal이 같은사람존재)
select empno, ename,sal from emp order by sal desc, empno; --샐러리순으로정렬(근데 sal이 같은 경우에는 empno순으로 정렬 여기서도 desc, asc가능)(3차 정렬도 가능함)



































