-- [SQL문법] 1장. select 구문
-- 데이터베이스(스키마) 목록 확인
show databases;

-- 스키마 전환
use hr;

-- 스키마 내 테이블 목록 확인
show tables;

-- 테이블의 구조 조회
desc employees;
desc departments;

-- [참고] employees 테이블의 commission_pct 컬럼값 update
desc employees;

alter table employees
modify commission_pct double(22,2);

update employees
set commission_pct = 0.1
where commission_pct is not null;

select employee_id, last_name, salary, commission_pct
from employees;

-- 사원들이 1년동안 받은 수당을 출력하시오.
-- null값이 포함된 산술식의 결과는 null이다.
-- 100 * null = null
-- 100 - null = null
-- 100 + null = null
-- 100 / null = null
-- 12 * 2400 + 300 / null * 200 = null
-- null값을 원하는 값으로 변경해서 작업을 하고 싶은 경우 => 함수 사용!!! (함수 단원에서 나옴)
select last_name, salary, commission_pct, 12*salary*commission_pct
from employees;

-- column alias(별명, 별칭) 예제
select last_name "이름", salary "급여", commission_pct "수당 비율", 
	   12*salary*commission_pct as "1년 수당"
from employees;

-- distinct 키워드 : 중복값 제거
-- employees 테이블에서 사원들이 소속된 부서 리스트를 출력하시오.
-- 107명의 사원들이 소속된 부서리스트가 출력은 되나 중복된값이 모두 출력됨.
select department_id
from employees;

-- 107명의 사원들이 소속된 부서리스트를 출력하되 중복된값을 제거하고 출력됨.
select distinct department_id
from employees;

-- employees 테이블로부터 employee_id, last_name, job_id, hire_date를 출력하되 컬럼 제목을 각각 
-- Emp #, Employee, Job, Hire Date로 지정하여 출력하시오.
select employee_id "Emp #", last_name "Employee", job_id "Job", hire_date "Hire Date"
from employees;

-- employees 테이블로부터 사원들이 담당하고 있는 업무 리스트를 출력하시오.
select distinct job_id
from employees;