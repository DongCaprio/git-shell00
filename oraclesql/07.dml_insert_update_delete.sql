--DML
--insert

desc dept;
select * from dept;

insert into dept(deptno, dname,loc) values(90, '인사과', '서울');
insert into dept(loc, dname, deptno) values('부산', '개발과', 70);
insert into dept values(80, '홍보과','인천'); --value앞에 순서를 기술안하면 원래 초기 설정되어있는 순서대로 입력됨
--null값입력
insert into dept(deptno, dname, loc) values(91, null, null); --널값가능
insert into dept(deptno,dname) values(92, '생산1과'); 
insert into dept(deptno) values(93); --생략하면 알아서 널값으로 들어감

insert into dept values(94, '생산2과', null); -- 앞에 아무것도 기술하지않은경우는 반드시 values()안에 3개가 들어가야한다.
--pk null()은 불가!!!  deptno는 pk값이므로 필수적으로 필요해서 null이 불가능하다.
insert into dept(deptno, dname, loc) values(null, '마케팅','제주');
insert into dept values(null, '마케팅','제주'); --이거랑 위에줄과 동일(둘다 실행불가 pk값이 null이므로)


rollback;