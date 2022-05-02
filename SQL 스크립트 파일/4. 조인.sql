-- [SQL문법] 4장. 조인(join)
-- 조인이란? 여러 테이블의 정보(컬럼)를 같이 출력하고자할때 조인 구문을 작성함.

use hr;

-- 조인 예제1
-- employees 테이블과 departments 테이블을 조인해서 사번, 이름, 급여, 부서이름을 출력하는 구문을 작성하시오.
select employee_id, last_name, salary, department_name
from employees join departments
on employees.department_id = departments.department_id;

-- employees 테이블과 departments 테이블을 조인해서 사번, 이름, 급여, 부서번호, 부서이름을 출력하는 구문을 작성하시오.
-- department_id 컬럼은 두 테이블에 동일하게 존재하는 컬럼명이므로 테이블명을 접두어로 붙여줘야함.
-- 두 테이블의 department_id 컬럼을 기준으로 조인을 하고 있기때문에 employees.department_id값과
-- departments.department_id값이 동일함.
select employee_id, last_name, salary, employees.department_id, department_name
from employees join departments
on employees.department_id = departments.department_id;

-- manager_id 컬럼은 두 테이블에 동일하게 존재하는 컬럼이므로 테이블명을 접두어로 붙여줘야함.
-- employees 테이블과 departments 테이블을 조인해서 사번, 이름, 매니저번호, 급여, 부서번호, 부서이름을 출력하시오.
select employee_id, last_name, employees.manager_id, salary, employees.department_id, department_name
from employees join departments
on employees.department_id = departments.department_id;

-- employees 테이블과 departments 테이블을 조인해서 사번, 이름, 급여, 부서번호, 부서이름, 부서의 매니저를 출력하시오.
select employee_id, last_name, salary, employees.department_id, department_name, departments.manager_id
from employees join departments
on employees.department_id = departments.department_id;

-- departments 테이블과 locations 테이블을 조인해서 부서번호, 부서이름, 도시명을 출력하시오.
select department_id, department_name, locations.location_id, city
from departments join locations
on departments.location_id = locations.location_id;

-- 조인 작업 시 컬럼명 앞에 테이블명을 접두어로 붙여주면 성능이 개선됨.
select departments.department_id, departments.department_name, locations.location_id, locations.city
from departments join locations
on departments.location_id = locations.location_id;

-- 성능 개선을 위해서 from절에 테이블 alias를 선언하여 컬럼명 앞에 테이블 alias를 붙여준다.
select d.department_id, d.department_name, l.location_id, l.city
from departments d join locations l
on d.location_id = l.location_id;

-- employees 테이블과 jobs 테이블을 조인해서 사번, 이름, 담당업무명, 메일주소, 급여를 출력하시오.
select e.employee_id, e.last_name, e.job_id, j.job_title, e.email, e.salary
from employees e join jobs j
on e.job_id = j.job_id;

-- employees 테이블과 departments 테이블을 조인해서 사번, 이름, 급여, 부서번호, 부서이름을 출력하되
-- 80번 부서에 소속된 사원만 출력하시오.
select e.employee_id, e.last_name, e.salary, d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id
where e.department_id = 80
order by e.last_name;

-- employees 테이블과 jobs 테이블을 조인해서 사번, 이름, 담당 업무 아이디, 담당 업무명, 메일주소, 급여를 출력하되
-- job_id가 SA로 시작되는 업무를 담당하는 직원의 정보만 출력하시오.
select e.employee_id, e.last_name, j.job_id, j.job_title, e.email, e.salary
from employees e join jobs j
on e.job_id = j.job_id
where e.job_id like 'SA%';

-- employees 테이블과 departments 테이블을 조인해서 사번, 이름, 급여, 커미션비율, 부서번호, 부서이름을 출력하되
-- 커미션을 받는 사원만 출력하시오.
select e.employee_id, e.last_name, e.salary, e.commission_pct, d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id
where e.commission_pct is not null;

-- employees 테이블과 departments 테이블을 조인해서 사번, 이름, 급여, 부서번호, 부서이름을 출력하되
-- 급여가 10000 달러 이상인 사원만 출력하시오.
-- 또한 급여를 기준으로 내림차순 정렬하여 출력하시오.
select e.employee_id, e.last_name, e.salary, d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id
where e.salary >= 10000
order by e.salary desc;

-- employees 테이블과 departments 테이블을 조인해서 부서번호, 부서이름, 부서의 매니저 아이디, 부서의 매니저 이름을 출력하시오.
select d.department_id, d.department_name, d.manager_id, e.last_name "부서의 매니저 이름"
from departments d join employees e
on d.manager_id = e.employee_id;

-- N개의 테이블 조인하는 방법
-- 테이블 개수  |  조인조건수
-- ---------------------
--    2      |     1
--    3      |     2
--    N      |    N-1
-- ---------------------
-- employees, departments, locations 테이블을 조인해서 직원 정보, 부서 정보, 위치 정보를 함께 출력하시오.
-- 사번, 직원이름, 급여, 부서이름, 도시명을 출력하시오.
select e.employee_id, e.last_name, e.salary, d.department_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

-- employees, departments, locations 테이블을 조인해서 작업하시오.
-- Toronto에서 근무하는 직원의 사번, 직원이름, 부서이름을 출력하는 구문을 작성하시오.
select e.employee_id, e.last_name, d.department_name
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city = 'toronto';

-- Self join(자체조인) : 하나의 테이블을 마치 다른 테이블인듯 테이블 alias를 달리 부여하여 
--                     자기 자신 테이블과 조인하는 유형
-- 직원의 사번, 직원의 이름, 직원의 급여, 매니저 이름을 출력하는 구문을 작성하시오.
select e1.employee_id, e1.last_name, e1.salary, e1.manager_id, e2.last_name as "매니저이름"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

-- 샘플 테이블 생성
create table job_grades
(grade_level varchar(10),
 lowest_sal bigint,
 highestsal bigint);
 
 insert into job_grades
 values ('A', 1000, 2999),
		('B', 3000, 5999),
        ('C', 6000, 9999),
        ('D', 10000, 14999),
        ('E', 15000, 24999),
        ('F', 25000, 40000);
        
select *
from job_grades;

-- 컬럼명 변경하는 구문
alter table job_grades
rename column highestsal to highest_sal;

-- equi join vs non-equi join
-- equi join : 조인조건문에 동등연산자(=)를 사용한 조인 유형
-- non-equi join : 조인조건문에 동등연산자가 아닌 그 외 다른 비교연산자를 사용한 조인 유형
select e.employee_id, e.last_name, e.salary, j.grade_level
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal;

-- inner join vs outer join
-- inner join(내부조인) : 조인조건을 만족하는 행만 반환하는 조인 유형
-- outer join(외부조인) : 조인조건을 만족하는 행은 물론이고 조인조건을 만족하지 않는 행까지 반환하는 조인 유형
--						left outer join : 조인조건을 만족하지 않는 왼쪽 테이블의 행을 반환해 주는 조인 유형
--						right outer join : 조인조건을 만족하지 않는 오른쪽 테이블의 행을 반환해 주는 조인 유형
--						full outer join : 조인조건을 만족하지 않는 양쪽 테이블의 행을 모두 반환해 주는 조인 유형

-- [inner join 예제]
-- employees 테이블과 departments 테이블을 조인하여 사원의 정보와 함께 부서 정보를 함께 출력하시오.
select e.employee_id, e.last_name, d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

select employee_id, last_name, department_id
from employees
where department_id is null;

select *
from departments;

-- [left outer join 예제]
select e.employee_id, e.last_name, d.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

-- [right outer join 예제]
select e.employee_id, e.last_name, d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

-- [연습문제]
-- employees 테이블로부터 모든 사원의 last_name, employee_id, 매니저 이름, manager_id를 함께 출력하시오.
select w.last_name as "직원이름", w.employee_id as "직원ID", 
       m.last_name as "매니저이름", w.manager_id as "매니저ID"
from employees w join employees m
on w.manager_id = m.employee_id;

select w.last_name as "직원이름", w.employee_id as "직원ID", 
       m.last_name as "매니저이름", m.employee_id as "매니저ID"
from employees w join employees m
on w.manager_id = m.employee_id;

-- [오답]
-- 직원의 정보와 직원의 매니저 이름과 매니저의 매니저 ID가 출력되는 구문임!
select w.last_name as "직원이름", w.employee_id as "직원ID", 
       m.last_name as "매니저이름", m.manager_id as "매니저의 매니저ID"
from employees w join employees m
on w.manager_id = m.employee_id;