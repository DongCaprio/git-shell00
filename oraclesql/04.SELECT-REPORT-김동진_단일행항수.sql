--단일행함수
--문자함수

select upper('kim'), lower('KIM'), initcap('tom') from dual; --대문자 소문자로 바꾸기
select empno, ename, upper(ename), lower(ename), initcap(ename) from emp; --initcap은 첫글자를 대문자로 변환한다
select empno, concat(ename, '님의 직급은 ') from emp;  --concat은 글짜 붙히기이다.
select empno, concat(concat(ename, '님의 직급은 '),job) from emp;
select empno, concat (concat(concat(ename, '님의 직급은 '),job), '입니다')from emp; --concat 3번써서 글짜 붙히기
select empno, ename ||'님의 직급은'||job||'입니다' from emp; --위에꺼랑 똑같음 이걸 훨신많이 씀 (concat보다 이걸 더 기억하자)

select 'ABCDEFGHIJK' ,substr('ABCDEFGHIJK', 6) from dual; --6번부터 전부자르기 (첫번째는 1)
select 'ABCDEFGHIJK', substr('ABCDEFGHIJK', 6, 1) from dual; --6번부터 1개자르기
select 'ABCDEFGHIJK', substr('ABCDEFGHIJK', 6, 2) from dual; --6번부터 2개자르기
select 'ABCDEFGHIJK', substr('ABCDEFGHIJK', 6, 3) from dual;

select empno, ename, job, substr(job, 6) from emp;
select empno, ename, job, substr(job, 6, 1) from emp; --6번째부터 1개자르기
--length
select empno, ename,length(ename), job,length(job) from emp;
select * from emp where length(ename) >= 6;

--instr
select 'ABADAFG', instr('ABADAFG', 'A') from dual;
select 'ABADAFG', instr('ABADAFG', 'A', 1, 1) from dual; --이거랑 위에꺼는 똑같다
select 'ABADAFG', instr('ABADAFG', 'A', 1, 3) from dual; --3번째 A의 위치를 알려준다
select 'ABADAFG', instr('ABADAFG', 'A', 2, 2) from dual; --2번째A부터 2번째 위치의 A의 위치알려줌(결론적으로 위와같음)

select 'ABADAFG', 
    instr('ABADAFG', 'A'),
    instr('ABADAFG', 'A' ,1,3),
    instr('ABADAFG', 'A' ,2, 2),
    instr('ABADAFG', 'A',2,3) --없으면 0을 반환
    from dual; --위랑 형식을 똑같음 근데 이렇게 한줄? 한 범위내에서도 표현가능
    
select tel from student;

desc student;
select * from student;
select tel, instr(tel,')',1,1) ")의 위치",instr(tel, '-', 1,1) "-의위치" from student;

--lpad, rpad
select empno, ename, sal, lpad(ename,8,'-'), lpad(sal,8,'0'), --8칸을하고 왼쪽빈칸은 -랑 0으로채운다
rpad(lpad(sal, 6,' '),9,'원') from emp; 

--trim
select empno, ename, --S잘라버리기 leading은앞쪽, trailing은 뒤쪽 (앞이든 뒤든 맨앞, 맨뒤 1개만 지우는거같다)
        job, 
        trim(leading 'S' from job) "leading",
        trim(trailing 'N' from job) "trailing",
        trim(both 'C' from job) "both" --both는 양쪽끝만
        from emp;

--replace
select empno, ename ,job, replace(job,'MAN', 'PERSON') from emp; --MAN은 PERSON으로 대체
select studno, name, replace(jumin, '7510231' , '*******') from student;
--숫자함수

select round(45.6789),  --round는 반올림
        round(45.6789, 0),
        round(45.6789, 1),
        round(45.6789, 2),
        round(45.6789, 3),
        round(45.6789, -1)
from dual;

--trunc는 잘라버리기
select trunc(45.6789, 0),
        trunc(45.6789, 1),
        trunc(45.6789, 3),
        trunc(45.6789, -1)        
from dual;

select ceil(15.3), floor(15.3) from dual; --올림과 내림 (결과값은 반드시 정수값만 나온다)
select ceil(-15.3), floor(-15.3) from dual;

--조편성
select 1,2,3,4,5,6 from dual;
select ceil(1/3),ceil(2/3),ceil(3/3),ceil(4/3),ceil(5/3),ceil(6/3) from dual;
--123은 1조 456은 2조 이런식으로 사용

--날짜함수
select sysdate from dual; --날짜나옴
select systimestamp from dual; --날짜에 시분초까지

select sysdate +7 "7일후 "from dual; --숫자를 더하면 무조건 날짜에 그 숫자만큼 더한것을 반환
select sysdate -7 "7일후 "from dual; --숫자더하기는 날짜기준!!
select sysdate - to_date('1998/4/3', 'YYYY/MM/DD') "살아온날" from dual; 
select empno,ename,sal,hiredate,round(sysdate-hiredate) "근무일수" from emp;

select temp.*, round((sysdate-birth_date)/7) "근무주수" from temp; --전체보기와 같이 어떠한값을 보려고할때는 .*을 사용하자

select empno, ename, hiredate, --between으로 사이값 파악가능
        trunc(months_between(sysdate, hiredate)) "근무달수",
        add_months(hiredate,6) "입사 6개월후",
        next_day(hiredate, '금') "입사후 첫번째 금요일",
        last_day(hiredate) "입사월의 마지막날"
from emp;

select sysdate ,
        add_months(sysdate,6) "6개월후",
        next_day(sysdate,'금') "금요일",
        last_day(sysdate) "이번달의 마지막날"
from dual;

--extract function(Date--> 년,월,일,시,분,초를 숫자로 추출)
select sysdate,
        extract(year from sysdate),
        extract(month from sysdate),
        extract(day from sysdate)
from dual; --그런데 시분초는 sysdate말고 systimestamp를 이용해서 추출해야한다.

--시분초 추출 systimestamp (여기서는 시분초말고 당연히 년월일도 가능)
select systimestamp, 
        extract(year from systimestamp),
        extract(month from SYSTIMESTAMP),
        extract(day from SYSTIMESTAMP),
        extract(hour from SYSTIMESTAMP),
        extract(minute from systimestamp),
        extract(second from systimestamp)
        from dual;



select temp.*,
    birth_date,
    extract(year from birth_date),
    extract(month from birth_date),
    extract(day from birth_date)
    from temp;

--round(date), trunc(date)
select sysdate,
        round(sysdate, 'month'), --month는 15일 기준으로 달을 바꿈
        round(sysdate, 'year'), --달을기준
        trunc(sysdate, 'month'),
        trunc(sysdate, 'year') --달기준으로 내림
from dual;

select empno, ename,hiredate, round(hiredate, 'month'), round(hiredate, 'year') from emp; --month는 일을기준으로 반올림하여 월이바뀜

--변환함수
--묵시적
select * from emp where hiredate = '1981/11/17';
select * from emp where hiredate = to_date('1981/11/17', 'YYYY/MM/DD');
select * from emp where hiredate >= to_date('1981/11/17', 'YYYY/MM/DD'); --큰게 더 최근
select * from emp where hiredate <= to_date('1981/11/17', 'YYYY/MM/DD');

select * from emp where empno='7839';
select * from emp where empno=to_number('7839');

--to_char() 날짜--> 문자
select sysdate,  --내가 정한 대로 출력가능
        to_char(sysdate, 'YYYY/MM/DD') ,
        to_char(sysdate, 'YYYY MM DD') ,
        to_char(sysdate, 'YYYY-MM-DD') ,
        to_char(sysdate, 'YYYY-MM--DD HH24:MI:SS') ,
        to_char(sysdate, 'YEAR-MONTH-DAY'),  --영문으로표시ㅣ(깃허브참고)
        to_char(sysdate, 'YEAR/MON/DY'),
        to_char(sysdate, 'YYYY'),
        to_char(sysdate, 'YY'),
        to_char(sysdate, 'MM'),
        to_char(sysdate, 'DD'),
        to_char(sysdate, 'HH')
        from dual;
        
select emp_id, emp_name,birth_date 
from temp 
where to_char(birth_date, 'MM') ='12';

select emp_id, emp_name,birth_date 
from temp 
where to_char(birth_date, 'DAY') ='화요일';

--to_char()  숫자 -> 문자

select 1234567.8888,
        to_char(1234567.8888, '999,999.9999'),
        to_char(1234567.8888, '9,999,999.99'),
        to_char(1234567.8888, '9,999,999.9999'),
        to_char(1234567.8888, '999,999,999.999999'),
        to_char(1234567.8888, '099,999,999.999999'),
        to_char(1234567.8888, 'L9,999,999'),
        to_char(1234567.8888, '$9,999,999')
        from dual;

select emp.*, 
        to_char(sal, '99,999.9'),
        to_char(sal, 'L99,999.9'),
        to_char(sal, '$99,999.9'),
        to_char(sal, 'L09,999.9')
        from emp;

-- to_number() 문자-->숫자
select * from emp where sal > to_number('1000');
select '1234'+'1', '23.4567'+0.12 from dual; --이거랑 밑에꺼랑 똑같다
select ('1234')+to_number('1'), to_number('23.4567')+0.12 from dual;

--to date() 문자->날짜
select empno, ename, hiredate ,to_char(hiredate, 'YYYY/MM/DD')
from emp 
where hiredate >= to_date('1981/01/01','YYYY/MM/DD') 
and hiredate<= to_date('1981/12/31', 'YYYY/MM/DD');

insert into emp values(9999, 'KIM', 'CLERK', null, to_date('2020/05/04', 'YYYY/MM/DD'),300,30,40); 
select *from emp order by hiredate desc;
rollback;

--일반함수
--nv1, nv12
--nv1함수는 null인경우 지정값 출력
--nv2함수는 null이 아닌경우 지정값1을 출력하고 null인 경우 지정값2를 출력한다.
select empno,ename,sal,comm ,sal+comm "총급여" from emp;--????
select empno,ename,sal,comm ,nvl(comm,0),        sal+nvl(comm,0)            "총급여" from emp;
select empno,ename,sal,comm ,nvl2(comm,comm,0),  sal+nvl2(comm,comm,0)     "총급여" from emp;
select empno,ename,sal,comm ,nvl2(comm,comm,0),  nvl2(comm,sal+comm,sal+0) "총급여" from emp;

--decode
--decode(컬럼, 조건1, 결과1, 조건2, 결과2 ```) if else와 비슷
select decode('LEE', 'KIM',1000,'LEE',2000,'PARK',3000) from dual;
select decode('SALESMAN', 'CLERK',1000,'SALESMAN',2000,'PRESIDENT',3000) from dual;
select decode(job, 
                'CLERK', sal*1.2, 
                'ANALYST', sal*1.3, 
                'MANAGER', sal*1.4, 
                'PRESIDENT', sal*1.5,
                'SALESMAN', sal*1.6 )
                "직급별 계산급여 "from emp;--job과 일치하는것에 sal변화  (IF문과 비슷)

select empno, ename, sal, job, 
        nvl(decode(job, 'SALESMAN', sal*1.6),sal) "직급별 계산급여 "from emp;--직급별 계산급여 salsman만 직급*1.6 하고 나머지는 sal그대로
                
--case구문
select empno, ename, sal, job, 
    (
        case when job = 'CLERK' and 1=1 then sal*1.2
             when job = 'ANLYST' then sal*1.2
             when job = 'MANAGER' then sal*1.2
             when job = 'PRESIDENT' then sal*1.2
        else sal
        end
       )    "직급별 계산급여" from emp;


































