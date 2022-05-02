-- [SQL문법] 5-2장. 단일행함수 - 숫자함수, 날짜함수

use hr;

-- 숫자함수
-- (숫자)  1  2  3 . 4  5  6
-- (자리) -2 -1  0   1  2  3
select round(45.923, 2), round(45.923, 0), round(45.923), round(45.923, -1);
select truncate(45.923, 2), truncate(45.923, 0), truncate(45.923, -1);

select employee_id, last_name, salary, truncate(salary * 1.05, -2) as "5% 인상된 급여"
from employees;

-- 일의 자리까지 올림   ceil(숫자)
-- 일의 자리까지 반올림  round(숫자) = round(숫자, 0)
-- 일의 자리까지 버림   floor(숫자) = truncate(숫자, 0)

select ceil(45.923), ceil(52.1);
select floor(45.923), floor(52.1);

select 157 / 10, mod(157, 10), 157 mod 10, 157 % 10;

select last_name, salary, mod(salary, 5000)
from employees
where job_id = 'SA_REP';

-- 날짜함수
select now(), sysdate(), current_timestamp();
select now(), current_date(), current_time();

select year(now()), month(now()), day(now()), 
       hour(now()), minute(now()), second(now());

select last_name, hire_date, year(hire_date), month(hire_date), day(hire_date)
from employees
where department_id = 90;

-- [예제] orders 테이블에서 2월 구매 내역만 출력하는 구문을 작성하시오.

use shopdb;

select *
from orders
where month(order_date) = 2;

use hr;

select current_date(), current_time(), date(now()), time(now());

use shopdb;

select *
from orders;

select order_num, member_id, prod_id, date(order_date) as "구매일자"
from orders;

use hr;

select last_name, hire_date, 
       adddate(hire_date, interval 6 month) as "입사 6개월 후", 
       subdate(hire_date, interval 7 day) as "입사 7일전"
from employees
where department_id = 60;

select addtime('2022-01-01 23:59:59', '1:1:1') as "결과1",
       addtime('15:00:00', '2:10:10') as "결과2";
       
select subtime('2022-01-01 23:59:59', '1:1:1') as "결과1", 
	   subtime('15:00:00', '2:10:10') as "결과2";
       
select datediff('2022-12-31', now()), datediff(now(), '2022-12-31');

select employee_id, last_name, hire_date,
       datediff(now(), hire_date) as "근무일수"
from employees;

select datediff(now(), '2022-02-21');
select datediff('2022-07-27', now());

select dayofweek(now()), monthname(now()), dayofyear(now());

select employee_id, last_name, hire_date, monthname(hire_date) as "입사한 월"
from employees;

select last_day('2022-04-15');

select employee_id, last_name, hire_date, last_day(hire_date) as "입사월의 마지막 날짜"
from employees;

select quarter('2022-01-31'), quarter('2022-02-05'), quarter('2022-03-15'), 
       quarter('2022-04-02'), quarter('2022-05-10'), quarter('2022-06-25'), 
       quarter('2022-07-10'), quarter('2022-08-09'), quarter('2022-09-16'), 
       quarter('2022-10-14'), quarter('2022-11-11'), quarter('2022-12-25');
       
-- [연습문제]
-- 1. employees 테이블로부터 전 사원의 employee_id, last_name, salary를 출력하고 마지막 컬럼에는 
--    15.5% 인상된 급여(일의 자리에서 반올림)를 New salary라는 제목으로 출력하는 구문을 작성하시오.
SELECT employee_id, last_name, salary, ROUND(salary * 1.155, 0) as "New Salary"
FROM employees; 

-- 2. employees 테이블로부터 사원들의 employee_id, last_name, salary, 15.5% 인상된 급여(New Salary), 
--    새 급여에서 이전 급여를 뺀 값(Increase)을 출력하는 구문을 작성하시오. 
--    (단, 4번째, 5번째 컬럼은 일의 자리에서 반올림하여 정수로 표현하시오.)
SELECT employee_id, last_name, salary,
       ROUND(salary * 1.155, 0) as "New Salary",
       ROUND(salary * 1.155, 0) - salary as "Increase"
FROM employees;

-- 3. employees 테이블로부터 2월에 입사한 사원들의 employee_id, last_name, job_id, hire_date, 
--    department_id를 출력하시오.
select employee_id, last_name, job_id, hire_date, department_id
from employees
where month(hire_date) = 2;

-- 4. employees 테이블로부터 1990년부터 1995년에 입사한 사원들의 employee_id, last_name, hire_date, 
--    salary, department_id를 출력하시오.
select employee_id, last_name, job_id, hire_date, department_id
from employees
where year(hire_date) between 1990 and 1995;

-- 5. employess 테이블로부터 오늘 날짜를 기준으로 근무한 주수가 1200주 미만인 사원들의 last_name, 
--    hire_date, 근무한 일수, 근무한 주수를 출력하는 구문을 작성하시오. 
select last_name, hire_date, datediff(now(), hire_date) as "근무한 일수", 
        floor(datediff(now(), hire_date) / 7) as "근무한 주수"
from employees
where datediff(now(), hire_date) / 7 < 1200;

-- 6. employees 테이블로부터 전 사원들의 employee_id, last_name, hire_date, 입사한 날짜에 해당되는 
--    분기를 출력하는 구문을 작성하시오.
select employee_id, last_name, hire_date, concat(quarter(hire_date), '분기') as "입사한 분기"
from employees;