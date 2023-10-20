/*
ORDER BY 절
    ORDER BY 절을 사용하여 검색된 행을 정렬합니다.
        ASC : 오름차순, 기본값(생략이 가능. 안쓰면 기본 오름차순)
        DESC : 내림차순
    SELECT 문의 맨 마지막에 옵니다.
    
    데이터 베이스에서 자료를 정렬 처리하고 데이터를 가져오는것이 편함
*/

SELECT last_name, job_id , department_id , hire_date
FROM employees
ORDER BY hire_date;

--내림차순 정렬
SELECT last_name,job_id,department_id , hire_date
FROM employees
ORDER BY hire_date DESC;

-- 열 alias 기준으로 정렬
SELECT last_name,job_id,department_id , salary*12 annsal
FROM employees
ORDER BY annsal;


-- 열 숫자 위치를 사용하여 정렬
SELECT last_name,job_id,department_id , hire_date
FROM employees
ORDER BY 3; -- 컬럼 속성값의 순서* depardepartment_id

-- 여러 열을 기준으로 정렬
SELECT last_name,job_id,department_id ,salary
FROM employees
ORDER BY department_id,salary DESC; -- 부서 아이디 정렬 -> 중복 일 경우 연봉으로 정리



