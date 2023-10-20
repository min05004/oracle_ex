/*
여러행 그룹 함수
    AVG() - 평균
    MAX() - 최대값
    MIN() - 최소값
    SUM() - 합계
    
*/

SELECT AVG(salary) AS avg_salary,
        MAX(salary) AS max_salary,
        MIN(salary) AS min_salary,
        SUM(salary) AS sum_salary
FROM employees
WHERE job_id LIKE '%REP%';

--COUNT() 함수 NULL값이 아닌 모든 행의 개수를 반환.
SELECT COUNT(*) AS totsl_employees
from employees
where department_id = 50;

-- null 값이 포함되어 있으면 카운트가 안됨. NVL()사용하면 카운트 됨.
SELECT COUNT(commission_pct)AS non_null_commiission_count
FROM employees
WHERE department_id =50;

-- COUNT(DISTINCT expr) 은 특정 표현식을 기준으로 중복을 제거한 행의 개수 반환
SELECT COUNT(DISTINCT department_id) AS distinct_department_count
FROM employees;

--항상from을 꼭 체크!!! 어느 테이블인지 -> 조건 -> 해당되는 컬럼 조회


-- NVL함수를 활용하여 null 값을 다른 값으로 대체한 후 AVG() 함수 사용.
SElECT AVG(NVL(commission_pct,0)) AS avg_commission
FROM employees;


/*
Group By
    여러 행을 지정된 컬럼 기준으로 그룹화 하여 집계 함수를 적용하기 위한 구문
HAVING
    GRUOP BY 와 함께 사용되며 ,그룹화된 결과에 조건을 적용할 때 사용됩니다.
    
    WHER - 개별행의 조건
    HAVING - 그룹의 조건


*/

-- 부서별 평균 급여를 구합니다.
SELECT department_id,AVG(salary)as avg_salry
FROM employees
GROUP BY department_id;

-- GROUP BY 절에서 여러 열을 기준으로 그룹화 합니다.
SELECT department_id,job_id,SUM(salary) as total_salary -- 4번
FROM employees --1번
WHERE department_id > 40 --부서번호가 40번 초과인 사람 조회. 2번
GROUP BY department_id, job_id --부서 안에서 그룹한번,그 안에서 잡 아이디로 그룹 , 3번
ORDER BY department_id ASC;


--HAVING 절 사용
--부서별 최대 급여가 10000보다 큰 부서를 찾습니다.
SELECT department_id, MAX(salary) as max_salary
FROM employees
--WHERE salary >10000 연봉 만이상 으로 먼저 추리고 그룹화 해도 결과 값이 동일.
GROUP BY department_id -- 부서번호로 그룹
HAVING MAX(salary) > 10000; -- 그룹된것에 조건을 걸었음.

--직무별 총 급여가 13000보다 큰 직무를 찾습니다.

SELECT job_id, SUM(salary) as total_salary
FROM employees
GROUP BY job_id
HAVING SUM (salary) >13000
ORDER BY total_salary;

-- 그룹함수 함수중첩 가능
SELECT department_id,(AVG(salary))as max_avg_salary
FROM employees
GROUP BY department_id


