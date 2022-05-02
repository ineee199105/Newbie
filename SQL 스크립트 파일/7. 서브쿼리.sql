-- [SQL문법] 7장 서브쿼리(Subquery)
-- 서브쿼리란? 쿼리 구문 안에 또 다시 쿼리 구문이 포함되어 있는 형태
-- 알려지지 않은 값을 기준으로 쿼리구문 실행 시 활용됨
use hr;

-- 1. 단일행 서브쿼리
-- 서브쿼리로부터 하나의 행이 반환되는 유형
-- 단일행 비교연산자 사용 : =, >, >=, <, <=, <>

-- Abel보다 급여를 많이 받는 사원을 출력하시오.
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary
				FROM employees
				WHERE last_name = 'Abel');
             
-- 141번 사원과 동일한 업무를 담당하는 사원을 출력하시오.
SELECT last_name, job_id
FROM employees
WHERE job_id =
				(SELECT job_id
				 FROM employees
				 WHERE employee_id = 141);
                 
-- 최소급여를 받는 사원의 정보를 출력하시오.
SELECT last_name, job_id, salary
FROM employees
WHERE salary = 
				(SELECT MIN(salary) 
                 FROM employees);
                 
-- 부서별 최소급여가 30번 부서의 최소급여보다 큰 부서를 출력하시오.
SELECT department_id, MIN(salary)
FROM employees
WHERE department_id is not null
GROUP BY department_id
HAVING MIN(salary) >
					(SELECT MIN(salary) 
                     FROM employees
					 WHERE department_id = 30);
         
-- employees 테이블에서 부서별로 그룹화를 시켜서 부서별 최소급여를 구하되 최소급여만 출력하시오.
-- [group by절의 규칙] select절에 그룹함수에 포함된 컬럼과 그룹함수에 포함되지 않은 컬럼을 함께 
--                   출력하려면 그룹함수에 포함되지 않은 컬럼은 반드시 group by절에 포함되어 있어야 함!
--                   단, group by절에 포함된 컬럼이 select절에 포함되지 않아도 문법 오류 아님.
SELECT MIN(salary) 
FROM employees
GROUP BY department_id;

SELECT department_id, MIN(salary) 
FROM employees
GROUP BY department_id, job_id;

-- 부서별 최소급여와 동일한 급여를 받는 사원들을 출력하시오.
-- [오류] 단일행서브쿼리로부터 값이 여러개 반환되어 오류가 발생됨.
SELECT employee_id, last_name
FROM employees
WHERE salary = (SELECT MIN(salary) 
				FROM employees
				GROUP BY department_id);
-- [수정]
SELECT employee_id, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary) 
				 FROM employees
				 GROUP BY department_id);
              
-- Haas라고 하는 직원과 같은 업무 담당자를 출력하시오.
-- Haas라고 하는 직원이 존재하지 않음.
-- 단일행 서브쿼리로부터 결과값이 반환되지 않으면(=null) 메인 쿼리의 결과도 없다.
SELECT last_name, job_id
FROM employees
WHERE job_id = (SELECT job_id
				FROM employees
				WHERE last_name = 'Haas');
                
-- 2. 다중행 서브쿼리
-- 서브쿼리로부터 여러 행이 반환되는 유형
-- 다중행 비교연산자 사용 : IN(=, OR 성격), ANY(OR 성격), ALL(AND 성격)
-- (=, OR)   : IN (==) =ANY
-- (>, OR)   : >ANY   => 최소값보다 크면 true
-- (>=, OR)  : >=ANY  => 최소값보다 크거나 같으면 true
-- (<, OR)   : <ANY   => 최대값보다 작으면 true
-- (<=, OR)  : <=ANY  => 최대값보다 작거나 같으면 true
-- (<>, OR)  : <>ANY  => 활용도가 낮음!
-- (=, AND)  : =ALL   => 활용도가 낮음!
-- (>, AND)  : >ALL   => 최대값보다 크면 true
-- (>=, AND) : >=ALL  => 최대값보다 크거나 같으면 true
-- (<, AND)  : <ALL   => 최소값보다 작으면 true
-- (<=, AND) : <=ALL  => 최소값보다 작거나 같으면 true
-- (<>, AND) : NOT IN (==) <>ALL

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary
					FROM employees
					WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary 
					FROM employees
					WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

-- 서브쿼리 유형 : 단일행 서브쿼리		 다중행 서브쿼리
--            (단일행 비교연산자)   (다중행 비교연산자)

--              단일컬럼 서브쿼리    다중컬럼 서브쿼리
--               (비쌍 비교)         (쌍 비교)

-- (다중행 서브쿼리 + 다중컬럼 서브쿼리) 예제
SELECT employee_id, first_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, min(salary) 
								  FROM employees
								  GROUP BY department_id)
ORDER BY department_id;

-- employees 테이블에서 자기자신이 매니저가 아닌 최하위 직원을 출력하시오.
-- 서브쿼리로부터 반환되는 결과리스트에 null값이 있는데 메인쿼리에서 and의 성격을 가지는
-- not in 또는 <>all의 비교연산자를 사용하는 경우 메인쿼리의 결과 또한 null이 출력됨!
-- (결과가 출력되지 않음)
SELECT last_name
FROM employees
WHERE employee_id NOT IN (SELECT manager_id
						  FROM employees);
-- (수정)
SELECT last_name
FROM employees
WHERE employee_id NOT IN (SELECT manager_id
						  FROM employees
                          WHERE manager_id is not null);

-- [연습문제]
-- 1. 
SELECT last_name, hire_date
FROM employees
WHERE department_id = (SELECT department_id
					   FROM employees
		               WHERE last_name = 'Abel')
AND last_name <> 'Abel';

-- 2.
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary)
 	            FROM employees)
	            ORDER BY salary;

-- 3.
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (SELECT department_id
		                FROM employees
		                WHERE last_name like '%u%');

-- 4. 
SELECT employee_id, last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM departments
                        WHERE location_id = 1700);

-- 5. 
SELECT employee_id, last_name, salary
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM employees
                        WHERE last_name like '%u%')
AND salary > (SELECT AVG(salary)
              FROM employees);
              
-- 6. employees 테이블에서 본인이 매니저의 역할을 하는 사원들의 employee_id, last_name을 출력하시오. 
select employee_id, last_name
from employees
where employee_id in (select manager_id
					  from employees);
 
-- 7. employees 테이블과 departments 테이블을 사용하여 구문을 작성하시오. 
-- 직원이 소속되어 있지 않은 빈 부서의 department_id, department_name을 출력하시오.
select department_id, department_name
from departments
where department_id not in (select department_id
						    from employees
                            where department_id is not null);
						