-- [SQL문법] 8장 데이터조작어(DML)
use hr;
-- 1. 데이터 삽입(insert)
desc departments;

desc employees;

select *
from departments;

-- 테이블 뒤 컬럼명 생략 시 테이블의 기본컬럼 순서대로 모든 값을 나열해야함.
insert into departments
values (280, 'Mysql', 107, 1700);

-- 테이블 뒤 컬럼명 작성 시 values절에 값과 순서 및 개수 일치되어야 함.
insert into departments(department_name, manager_id, department_id, location_id)
values ('Oracle', 200, 290, 1700);

-- null값을 삽입하는 방법1 : 수동 삽입
insert into departments
values (300, 'Java', null, null);

-- null값을 삽입하는 방법2 : 자동 삽입
insert into departments(department_id, department_name)
values (310, 'Jsp');

select *
from departments
order by department_id desc;

-- subquery가 사용된 insert 구문 - (예제1)
-- sales_reps 예제 테이블 생성
create table sales_reps
( id int,
  name varchar(20),
  salary int,
  commission_pct double(22,2) );
  
desc sales_reps;

-- employees 테이블로부터 데이터 복사해서 삽입
insert into sales_reps(id, name, salary, commission_pct)
	select employee_id, last_name, salary, commission_pct
    from employees
    where job_id like '%REP%';

select *
from sales_reps;

-- subquery가 사용된 insert 구문 - (예제2)
-- copy_emp 예제 테이블 생성
-- employees 테이블과 구조는 동일하고 비어 있는 테이블 생성
create table copy_emp
as select *
   from employees
   where 1=2;
   
desc copy_emp;

select *
from copy_emp;

-- employees 테이블로부터 데이터 복사해서 삽입
insert into copy_emp
	select *
    from employees;

select *
from copy_emp;

-- 2. 데이터 수정(update)
-- 113번 사원의 부서를 50으로 수정하시오.
update employees
set department_id = 50
where employee_id = 113;

select employee_id, department_id
from employees
where employee_id = 113;

-- MySQL Workbench - [Query] - [Auto-Commit Transactions] 해제 후 작업하기
-- update 시 where절을 생략하면 모든 행이 update됨 - (예제1)
update copy_emp
set department_id = 110;
-- 미리보기
select employee_id, last_name, department_id
from copy_emp;
-- 작업 취소
rollback;
-- 확인
select employee_id, last_name, department_id
from copy_emp;

-- update 시 where절을 생략하면 모든 행이 update됨 - (예제2)
-- 전 사원의 급여를 5% 인상시키는 작업
update copy_emp
set salary = salary * 1.05;
-- 미리보기
select employee_id, last_name, salary
from copy_emp;
-- 작업 저장
commit;

-- update 구문에 서브쿼리가 사용된 예제 1
-- 113번 사원의 job_id, salary를 205번 사원의 job_id, salary와 동일하게 update 시킴.
-- update 작업 전 data 확인
select employee_id, job_id, salary
from employees
where employee_id = 205;    -- AC_MGR / 12000

select employee_id, job_id, salary
from copy_emp
where employee_id = 113;    -- FI_ACCOUNT / 7245

-- 서브쿼리를 활용한 update 작업 수행
update copy_emp
set job_id = ( select job_id
			   from employees
               where employee_id = 205 ), 
	salary = ( select salary
               from employees
               where employee_id = 205 )
where employee_id = 113;

-- 미리보기
select employee_id, job_id, salary
from copy_emp
where employee_id = 113;    -- AC_MGR / 12000

-- update 구문에 서브쿼리가 사용된 예제 2
-- location_id가 1800인 부서에 소속된 사원들의 급여를 10% 인상하시오.
update copy_emp
set salary = salary * 1.1
where department_id = (select department_id
					   from departments
                       where location_id = 1800);
-- 미리보기
select employee_id, last_name, salary, department_id
from copy_emp
where department_id = (select department_id
					   from departments
                       where location_id = 1800);
-- 작업 저장 (update 두 번 한번에 저장됨)
commit;



