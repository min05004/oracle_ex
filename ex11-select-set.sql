/*
집합 연산자
    여러 테이블 또는 집합의 결과를 조합하고 조작하는 연산자
    select 리스트의 표현식은 컬럼 개수가  일치해야 합니다.
    데이터 유형도 일치해야 합니다.
    컬럼에 대한 타입이 같아야 함 : DESC employees 로 확인해보기
    
UNION , UNION ALL , INTERSECT, MINUS

*/

-- UNION 연산자 : 두개의 쿼리를 합치고, 중복된 행을 제거합니다. 
-- join과 다른 점은 가로가 아닌 세로로 합쳐줌.
SELECT employee_id, job_id
FROM employees
UNION -- 같은 데이터 중복값 제거.
SELECT employee_id,job_id
FROM job_history
ORDER BY employee_id;

--UNION ALL 연산자 : 두개의 쿼리 결과를 합치고 , 중복된 행 포함 모두 반환.
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id;

-- INTERSECT 연산자 : 두개 쿼리 결과 중에서 공통된 행만 반환 (교집합)
-- join으로 같은 결과값 도출해보기
SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- MINUS 연산자 : 첫번째 쿼리 결과 중에서 두번째 쿼리 결과에 존재하지 않는 행만 반환. (교집합만 제외)
SELECT employee_id,job_id
FROM employees
MINUS
SELECT employee_id,job_id
FROM job_history;


-- 데이터 유형 일치시켜야 합니다.(열 수를 맞춘다는 의미, 타입(문자,숫자..)은 꼭 맞춰야 함)
SELECT location_id,department_name AS "Department", TO_CHAR(NULL)"Warehouse location"
FROM departments
UNION
SELECT location_id,TO_CHAR(NULL) AS "Department", state_province
FROM locations;

DESC employees;

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id = 60
UNION ALL 
SELECT 108, 'KIM', 60 
FROM dual
;