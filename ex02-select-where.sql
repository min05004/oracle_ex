/*
WHERE 
    조건을 충족하는 행으로 query를 제한합니다.

*/

-- WHERE 절 사용
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

-- 부서번호가 90번인 사원만 select 안 내용 조회


/* 
문자열 및 날짜
  문자열 및 날짜 값은 작은 따옴표로 묶습니다.
  문자 값은 대소문자를 구분하고 날짜 값은 형식을 구분합니다.  

  기본 날짜 표현형식은 DD-MON-RR
*/
SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

-- 라스트 네임이 Whalen 인 사람을 조회

SELECT last_name, hire_date
FROM employees
WHERE hire_date = '03/06/17';
-- 홀 따음표로 묶어서 조회 , 오라클 디폴트 기본 날짜 : DD-MON-RR

/*
비교 연산자
    특정 표현식을 다른값이나 표현식과 비교하는 조건에서 사용됩니다.
    
    =   같음
    >   보다 큼
    >=  보다 크거나 같음
    <   보다 작음
    <=  보다 작거나 같음
    <>  같지 않음
    BETWEEN ... AND ...     두 값 사이(경계값 포함)
    IN(set)                 값 리스트 중 일치하는 값 검색(그중 하나만 일치해도 검색이 가능)
    LIKE                    일치하는 문자 패턴 검색
    IS NULL                 NULL 값인지 여부
*/

-- 비교 연산자 사용
SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

-- BETWEEN 연산자를 사용하는 범위 조건
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;
-- 비교연산자로 사용 
SELECT last_name, salary
FROM employees
WHERE salary >= 2500
AND salary <= 3500 -- 조건 추가시 두 조건이 모두 해당이 되어야만 조회가 됨
;

-- IN 연산자를 사용하는 멤버조건
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);-- 하나라도 해당이 되면 조회가능

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id = 100
OR manager_id = 101  -- 하나라도 해당이 되게 조회
OR manager_id = 201
;

/*
LIKE 연산자를 사용하여 패턴 일치
    LIKE 연산자를 사용하여 유효한 검색 문자열 값의 
    대체 문자 검색을 수행합니다.
    검색 조건에는 리터럴 문자나 숫자가 포함될 수 있습니다.
        % : 0개 이상의 문자를 나타냅니다.
        _ : 한 문자를 나타냅니다.
*/
SELECT first_name
FROM employees
WHERE first_name LIKE 'A%';
--A로 시작하는 사원의 조건을 모두 검색해라
-- WHERE first_name LIKE '%a%'; 이름 어디에나 a가 들어는(앞뒤 상관없음)


-- 대체 문자 결합
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';
-- 두번쨰 문자가 o인 사원들을 조회 한것.

-- ESCAPE 식별자
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA\_%' ESCAPE '\';
-- escape 문자를 하나 지정, sa_ 값을 검색하고 싶을떄

/*
NULL 조건 사용
    IS NULL 연산자로 NULL을 테스트 합니다.
*/
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

/*
논리 연산자를 사용하여 조건정의
    AND : 구성 요소 조건이 모두 참인 경우 TRUE 반환
    OR  : 구성 요소 조건 중 하나가 참인 경우 TRUE 반환
    NOT : 조건이 거짓인 경우 TRUE를 반환
*/

-- AND 연산자 사용(둘다 참)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%';

-- OR 연산자 사용(둘중 하나만 참이여도 가능)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%';

-- NOT 연산자 사용
SELECT last_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP'); -- 해당 조건에 포함되지 않은 것만 조회

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;