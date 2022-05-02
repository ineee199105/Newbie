-- [SQL문법] 5-1장. 단일행함수 - 문자함수
-- 함수란? 인수를 받아들여서 정해진 작업(조작)을 한 후 하나의 결과값을 반환해줌.
--       SQL함수는 단일행함수와 다중행함수(그룹함수)로 나눠짐.

select ascii('A'), char(65);

select employee_id, length(employee_id), last_name, length(last_name)
from employees;

select length('abc'), bit_length('abc'), char_length('abc'); 
select length('가나다'), bit_length('가나다'), char_length('가나다'); 

select employee_id, concat(first_name, last_name) as "이름"
from employees;

select employee_id, concat(first_name, ' ', last_name, ' ', job_id, ' ', salary) as "결과"
from employees;

select employee_id, concat_ws(' ', first_name, last_name, job_id, salary) as "결과"
from employees;

select concat_ws('/', '2025', '01', '01');

select concat_ws('--', last_name, job_id, salary) as "결과"
from employees;

select instr('하나둘셋', '둘');

select last_name, instr(last_name, 'a')
from employees;

select last_name, instr(last_name, 'ab')
from employees;

select lower('abcdEFGH'), upper('abcdEFGH');

select employee_id, upper(last_name), lower(job_id), lower(email)
from employees;

select concat('The job id for ' , upper(last_name) , ' is ' , lower(job_id))
from employees;

select left('abcdefghi', 3), right('abcdefghi', 3);

select last_name, left(last_name, 2), right(last_name, 2)
from employees;

select left('901215-1122334', 6);

select lpad(last_name, 20, '_') as "L-name", rpad(first_name, 20, '_') as "F-name"
from employees;

select ltrim(' SQL 문법 '), rtrim('     SQL 문법    ');

select trim(' SQL 문법 '), trim(both '_' from '__SQL_문법___');

select employee_id, last_name, phone_number, replace(PHONE_NUMBER, '.', '-') as "phone"
from employees;

select concat('MySQL', space(10), 'DBMS') as value;

select employee_id, concat(first_name, space(5), last_name) as name
from employees;

select last_name, substr(last_name, 2, 3), substring(last_name, 2, 3)
from employees;

select last_name, substr(last_name, 3, 2), substr(last_name, -3, 2)
from employees;

select substr('901215-1122334', 1, 6);

-- [연습문제]
select last_name as "Name", length(last_name) as "Length"
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'
order by last_name;

select last_name, lpad(salary, 15, '$') as salary
from employees;

select concat(last_name, ' ', rpad(' ', salary/1000+1, '*')) as "EMPLOYEES_AND_THEIR_SAL"
from employees
order by salary desc;