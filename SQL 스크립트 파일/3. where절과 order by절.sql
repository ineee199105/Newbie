-- [SQL문법] 2장. 조건문(where)과 정렬(order by)을 사용한 select 구문
-- [문법] select 컬럼명1, 컬럼명2, ...
--       from 테이블명
--      [where 좌변 = 우변]
--      [order by 컬럼명 asc | desc];

-- 스키마 전환
use hr;

-- where절 예제
select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

select employee_id, last_name, salary
from employees
where last_name = 'whalen';

select employee_id, last_name, salary
from employees
where last_name = 'KING';

select employee_id, last_name, hire_date, department_id
from employees
where hire_date = '1996_02_17';

-- [비교연산자1] between A and B : 범위검색
select employee_id, last_name, salary
from employees
where salary between 2500 and 3500;

select employee_id, last_name, salary
from employees
where salary >= 2500 and salary <= 3500;

select employee_id, last_name, hire_date
from employees
where hire_date between '2000-01-01' and '2000-12-31';

select employee_id, last_name, job_id
from employees
where last_name between 'Abel' and 'Dehaan';

-- [비교연산자2] in : 다중행 비교연산자로 우변에 값리스트가 올 수 있음.
--                  =과 OR의 성격을 내포함.
--                  우변의 값리스트와 비교해서 하나 이상 동일(=)하면 true를 반환함.
-- employees 테이블에서 매니저(manager_id)가 100, 101, 201인 사원을 출력하시오.
select employee_id, last_name, manager_id, department_id
from employees
where manager_id = 100 or manager_id = 101 or manager_id = 201;

select employee_id, last_name, manager_id, department_id
from employees
where manager_id in (100, 101, 201);

select employee_id, last_name, department_id
from employees
where last_name in ('King', 'Abel', 'Bell', 'Kochhar');

-- [비교연산자3] like : 패턴 일치 여부를 비교하는 연산자
--                   패턴 작성 시 사용되는 기호 1) % : 0 또는 여러개 
--                                        2) _ : 반드시 1개
-- last_name이 a로 시작되는 사원을 출력하시오.
select employee_id, last_name, job_id, department_id
from employees
where last_name like 'a%';

-- last_name에 a가 포함된 사원을 출력하시오.
select employee_id, last_name, job_id, department_id
from employees
where last_name like '%a%';

-- last_name이 a로 끝나는 사원을 출력하시오.
select employee_id, last_name, job_id, department_id
from employees
where last_name like '%a';

-- last_name의 끝에서 세번째가 a인 사원을 출력하시오.
select employee_id, last_name, job_id, department_id
from employees
where last_name like '%a__';

-- job_id가 SA로 시작하고 P로 끝나는 업무 담당자를 출력하시오.
select employee_id, last_name, job_id, department_id
from employees
where job_id like 'SA%P';

-- [예제] employees 테이블로부터 employee_id, last_name, salary, department_id를 출력하되
--       last_name에 'a'와 'e'가 모두 포함된 사원만 출력하시오.(단, 순서는 상관없음)
select employee_id, last_name, salary, department_id
from employees
where last_name like '%a%e%' or last_name like '%e%a%';

select employee_id, last_name, salary, department_id
from employees
where last_name like '%a%' and last_name like '%e%';

-- [비교연산자4] is null : 값이 null인지를 비교해주는 연산자
-- employees 테이블에서 사장의 정보를 출력하시오.
select employee_id, last_name, manager_id
from employees
where manager_id is null;

-- employees 테이블에서 부서가 없는 신입사원 정보를 출력하시오.
select employee_id, last_name, job_id, salary, department_id
from employees
where department_id is null;

-- employees 테이블에서 커미션을 받지 않는 사원들의 정보블 출력하시오.
select employee_id, last_name, salary, commission_pct
from employees
where commission_pct is null;

-- [논리연산자] AND : 모두 만족이 되는 경우 true를 반환함.
--           OR : 하나이상 만족이 되는 경우 true를 반환함.
--           NOT : 부정(반대)을 의미하는 논리연산자로 비교연산자와 조합으로 활용됨.
--                 not between A and B : A 미만 B 초과
--                 not in : (<>, and) 우변에 있는 값리스트와 비교해서 모두 같지 않아야 true가 됨.
--                 not like : 패턴과 일치하지 않는 경우 true가 됨.
--                 is not null : 값이 null이 아닌(실제값) 경우 true가 됨.
-- employees 테이블로부터 커미션을 받는 사원의 정보를 출력하시오.
select employee_id, last_name, salary, commission_pct
from employees
where commission_pct is not null;

-- order by 절 : 정렬 구문
--              쿼리구문의 마지막에 위치해야함.
-- order by절 예제
-- order by절에 컬럼명을 작성하는 방법
select employee_id, last_name, salary, hire_date, department_id
from employees
order by last_name desc;

select employee_id, last_name, salary, hire_date, department_id
from employees
order by hire_date;

-- order by절에 표현식이나 alias명을 작성하는 방법
select employee_id, last_name, 12*salary "annsal", department_id
from employees
order by 12*salary desc;

select employee_id, last_name, 12*salary "annsal", department_id
from employees
order by "annsal" desc;

-- order by절에 위치표기법을 작성하는 방법
select employee_id, last_name, salary, hire_date, department_id
from employees
order by 2 desc;

-- 여러 컬럼을 기준으로 정렬을 원하는 경우
select employee_id, last_name, department_id, salary
from employees
order by department_id, salary desc;

-- 출력되지 않는 컬럼을 기준으로도 정렬할 수 있음!
-- 결과가 명확하지 않기때문에 잘 활용하지 않을 뿐이다.
select employee_id, last_name
from employees
order by salary desc;

-- 1. employees 테이블로부터 2000년도에 입사한 모든 사원의 last_name과 hire_date를 출력하시오. 
-- between을 사용한 답안
select last_name, hire_date
from employees
where hire_date between '2000-01-01' and '2000-12-31';

-- like를 사용한 답안
select last_name, hire_date
from employees
where hire_date like '2000%';

-- 2. employees 테이블로부터 커미션을 받지 않는 모든 사원의 last_name, salary, commission_pct를 
--    출력하되 salary를 기준으로 내림차순 정렬하시오.
select last_name, salary, commission_pct
from employees
where commission_pct is null
order by salary desc;