-- [SQL문법] 5-3장. 단일행함수 - 변환함수, 제어흐름함수, 시스템 정보 함수

use hr;

-- 변환함수
select now();

select employee_id, last_name, hire_date
from employees;

select date_format(now(), '%Y/%M/%d %H:%i:%s') as "Now";
select date_format(now(), '%Y-%b-%d %W') as "Now";

select employee_id, date_format(hire_date, '%Y-%M-%d %W') as "입사일"
from employees;

select cast("123" as signed), cast("-123.55" as signed);
select cast("123" as unsigned), cast("123.45" as unsigned);

select cast('2022/03/18' as date) as '날짜';
select cast('2022@03@18' as date) as '날짜';

select cast('2022-01-02 21:24:33.123' as date) as "DATE", 
       cast('2022-01-02 21:24:33.123' as time) as "TIME", 
       cast('2022-01-02 21:24:33.123' as datetime) as "DATETIME";
       
-- 제어흐름함수
select if(100>200, '참이다', '거짓이다') as "결과";
select if(100<200, '참이다', '거짓이다') as "결과";

select employee_id, salary, if(salary>10000, '1등급', '2등급') as "급여 등급"
from employees;

-- (예제1) employees 테이블로부터 employee_id, last_name, hire_date, 매니저의 last_name, 매니저의 hire_date를
--       출력하는 구문을 작성하시오.
select e1.employee_id, e1.last_name as "직원 이름", e1.hire_date as "직원 입사일", 
       e2.last_name as "매니저 이름", e2.hire_date as "매니저 입사일"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

-- (예제2) employees 테이블로부터 employee_id, last_name, hire_date, 매니저의 last_name, 매니저의 hire_date를
--        출력하고, 마지막 컬럼에 직원 입사일이 매니저 입사일보다 이전 날짜인 경우 "먼저", 나중 이상 날짜인 경우 "나중"이라고
--        출력하는 구문을 작성하시오.
select e1.employee_id, e1.last_name as "직원 이름", e1.hire_date as "직원 입사일", 
       e2.last_name as "매니저 이름", e2.hire_date as "매니저 입사일",
       if(e1.hire_date < e2.hire_date, '먼저', '나중') as "비교결과"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

select ifnull(null, '널이군요') as "결과1", ifnull(100, '널이군요') as "결과2";

select employee_id, last_name, ifnull(manager_id, '사장입니다.') as "매니저 정보", 
       salary, ifnull(commission_pct, 0) as "커미션 정보", ifnull(department_id, '미정') as "부서 정보"
from employees;

select nullif(100, 100) as "결과1", nullif(100, 200) as "결과2";

select employee_id, first_name, last_name, 
       nullif(length(first_name), length(last_name)) as "결과"
from employees;

select case 10 when 1 then '일' 
               when 5 then '오' 
               when 10 then '십' 
               else '모름' 
end as "case예제";

select employee_id, last_name, department_id, 
	   case department_id when 10 then '부서 10' 
						  when 50 then '부서 50' 
                          when 100 then '부서 100' 
                          when 150 then '부서 150' 
                          when 200 then '부서 200' 
                          else '기타 부서' 
       end as "부서 정보"
from employees;

select case when 100 > 200 then '결과1'
            when 200 > 200 then '결과2'
            when 300 > 200 then '결과3'
            else '결과4'
end as "출력";

select employee_id, last_name, salary,
       case when salary > 20000 then 'A 등급'
            when salary > 15000 then 'B 등급'
            when salary > 10000 then 'C 등급'
            else 'D 등급'
		end as "급여 등급"
from employees
order by salary desc;

-- 시스템 정보 함수
select user(), current_user(), session_user();
select database(), schema();
select version();

-- [연습문제]
-- 1. employees 테이블로부터 사원들의 last_name과 commission_pct를 출력하되 커미션을 받는 
--    사원은 자신의 커미션 비율을 출력하고, 커미션을 받지 않는 사원은 "No Commission"을 
--    출력하는 구문을 작성하시오.
SELECT last_name, ifnull(commission_pct, 'No Commission') COMM
FROM employees;

-- 2. employees 테이블로부터 JOB_ID 값을 기반으로 모든 사원의 등급을 표시하는 query를 작성하시오.
SELECT job_id, CASE job_id WHEN 'ST_CLERK' THEN 'E'
                           WHEN 'SA_REP' THEN 'D'
                           WHEN 'IT_PROG' THEN 'C'
                           WHEN 'ST_MAN' THEN 'B'
                           WHEN 'AD_PRES' THEN 'A'
                           ELSE '0' END as GRADE
FROM employees;