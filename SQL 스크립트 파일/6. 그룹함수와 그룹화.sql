-- [SQL문법] 6장 그룹함수와 그룹화
-- 그룹함수 : 행그룹을 조작해서 하나의 결과를 반환하는 함수
--          (특징) null값에 대해서 작업을 하지 않음!!!		
use hr;

-- min, max 함수
-- 모든 데이터타입에 사용 가능함.
select min(salary) as "최소 급여", max(salary) as "최대 급여"
from employees;

select min(hire_date) as "가장 예전 입사일", max(hire_date) as "가장 최근 입사일"
from employees;

select min(last_name) as "최소값", max(last_name) as "최대값"
from employees;

-- sum, avg 함수
-- 숫자 형식에만 사용 가능함.
select sum(salary) as "급여 합계", avg(salary) as "평균 급여"
from employees;

select sum(salary) as "급여 합계", round(avg(salary), 2) as "평균 급여"
from employees
where job_id like '%REP%';

-- count 함수
-- 모든 데이터타입에 사용 가능함.

-- employees 테이블로부터 전 직원의 수를 출력하시오.
select count(*)
from employees;

select count(employee_id)
from employees;

-- employees 테이블로부터 커미션을 받는 직원의 수를 출력하시오. 
select count(commission_pct)
from employees;

-- 80번 이하의 부서에 소속된 사원의 수를 출력하시오.
select count(*)
from employees 
where department_id <= 80; 

-- 80번 이하의 부서에 소속된 사원 중 커미션을 받는 사원의 수를 출력하시오.
select count(commission_pct)
from employees 
where department_id <= 80; 

-- employees 테이블에서 직원들이 소속된 부서의 수를 출력하시오.
-- (오답) 부서가 있는 사원의 수
select count(department_id) 
from employees;
-- (정답)
select count(distinct department_id) as "직원이 소속된 부서의 수"
from employees;

-- (예제) employees 테이블로부터 전체 사원의 커미션 평균을 출력하시오.
--       컬럼명은 avg_comm 으로 출력하고, 소수점 둘째자리까지 반올림해서 출력하시오.
-- (오답) 커미션을 받는 사원들의 커미션 평균
select round(avg(commission_pct),2) as avg_comm
from employees;
-- (정답)
select round(avg(ifnull(commission_pct, 0)),2) as avg_comm
from employees;

select round(sum(commission_pct)/count(employee_id), 2) as avg_comm
from employees;

-- 그룹화
-- [문법] select 컬럼명1, 컬럼명2
--       from 테이블명
--       where 행 제한 조건문
--       group by 그룹화의 기준이 되는 컬럼명
--       having 행그룹 제한 조건문(=그룹함수가 포함된 조건문)
--       order by 정렬의 기준이 되는 컬럼명 [asc | desc];

-- [group by절이 포함된 쿼리구문 작성 시 주의사항]
-- select절에 있는 컬럼 리스트 중 그룹함수에 포함되어 있는 컬럼과
-- 그룹함수에 포함되어 있지 않은 컬럼이 함께 출력이 되려면
-- 그룹함수에 포함되어 있지 않은 컬럼은 반드시 group by절에 포함되어 있어야 함!!!

-- employees테이블로부터 부서별 평균 급여를 출력하시오.
select department_id, round(avg(salary)) as "부서별 평균 급여"
from employees
group by department_id;

-- employees테이블로부터 부서 내 업무별 평균 급여를 출력하시오.
select department_id, job_id, round(avg(salary)) as "부서별 평균 급여"
from employees
group by department_id, job_id
order by department_id;

select job_id, sum(salary) payroll
from employees
where job_id not like '%rep%'
group by job_id
having sum(salary) > 13000
order by sum(salary);

-- [연습문제]
-- 1.
select round(avg(ifnull(commission_pct, 0)),2) as avg_comm
from employees;

-- 2.
SELECT job_id, ROUND(MAX(salary),0) "Maximum",
               ROUND(MIN(salary),0) "Minimum",
               ROUND(SUM(salary),0) "Sum",
               ROUND(AVG(salary),0) "Average"
FROM employees
GROUP BY job_id;

-- 3.
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

-- 4.
SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC;

-- 5.
SELECT MAX(salary) - MIN(salary) DIFFERENCE
FROM employees;

-- 6.
SELECT COUNT(*) total, SUM(if(year(hire_date)=1995,1,0)) "1995", 
					   SUM(if(year(hire_date)=1996,1,0)) "1996",
                       SUM(if(year(hire_date)=1997,1,0)) "1997",
                       SUM(if(year(hire_date)=1997,1,0)) "1998"
FROM employees;