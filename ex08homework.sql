-- 1. 각 직원의 성(last_name)과 해당 직원의 매니저인 직원의 성(last_name) 조회하기
SELECT e.employee_id,e.last_name,d.manager_id,d.last_name AS manager_last_name
FROM employees e JOIN employees d
ON e.manager_id = d.manager_id;

-- 2. 각 직원의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기
SELECT e.last_name,d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
ORDER BY department_name;

-- 3. 각 부서의 이름(department_name)과 해당 부서의 평균 급여(avg_salary) 조회하기
--부서별 평균급여 구하기
/* SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id*/
-- 위 결과값 부서 아이디에 부서명 조인
SELECT d.department_name,AVG(e.salary)as AVG_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;


/*SELECT e.avg_salary,d.department_name
FROM (SELECT AVG(salary)as avg_salry FROM employees group by department_id)
e JOIN departments d
ON e.avg_salary = d.department_name;*/


-- 4. 각 부서의 이름(department_name)과 해당 부서의 최대 급여(max_salary) 조회하기
SELECT d.department_name, MAX(e.salary) AS MAX_SALARY
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
;