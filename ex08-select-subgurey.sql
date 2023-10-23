/*
subquery 구문
    select 문의 포함되는 select 문 입니다.


*/

-- 단일행 서브쿼리 - 스칼라 서브쿼리
SELECT last_name,salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name ='Abel'); -- abel 보다 급여 많이 받는 사람

-- subguery 에서 그룹함수 사용
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

/*
여러행 서브 쿼리 - 로우 서브쿼리.테이블 서브쿼리
    IN
        리스트의 임의 멤버와 같음
    ANY
        = ,<>,>,<,<=,>= 연산자가 앞에 있어야 합니다.
        < ANY 는 최대값보다 작음을 의미합니다.
        > ANY 는 최솟값보다 큼을 의미합니다.
        = ANY 는 IN과 같습니다.
        
    ALL
        > ALL 은 최대값보다 큼을 의미
        > ALL 은 최솟값보다 작음을 의미
        
*/
--() 안 조건에 해당되는 사원 조회
SELECT employee_id,last_name,salary,job_id
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
-- 9000,6000,4800,4200가 해당되는 값 조회.or절과 동일
AND job_id <> 'IT_PROG';

SELECT employee_id,last_name,salary,job_id
FROM employees
WHERE salary <ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
-- 해당 급여의 최대값보다 작은 (9000미만)
AND job_id <> 'IT_PROG';


SELECT employee_id,last_name,salary,job_id
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';


/*
EXISTS 연산자
    서브쿼리에서 최소한 한 개의 행을 반환하면 true로 평가
    조회해서 하나라도 찾으면 그 다음것을 찾지않아 속도가 빠름 - 성능 유리
    
*/
-- 상관 서브쿼리
SELECT * FROM departments -- 1번 조회 / 부서테이블을 출력할건대 () 안 내용을
WHERE NOT EXISTS -- not이 붙으면 반전되서 값이 반환
    (SELECT * FROM employees
    WHERE employees.department_id = departments.department_id);


SELECT * FROM departments
WHERE department_id NOT IN
    (SELECT department_id FROM employees
    WHERE employees.department_id = departments.department_id);
    -- 위랑 동일한 값
    
/*
서브쿼리의 NULL 값.
     반환되는 값 중 하나가 null이면 전체 쿼리가 행을 반환하지 않습니다.
     nill 값을 비교하는 모든 조건은 결과가 null이기 때문.
    
*/

SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN
        (SELECT mgr.manager_id FROM employees mgr
        WHERE mgr.manager_id IS NOT NULL);
        -- 매니저가 아닌 사원들만 나옴.
        --null 값이 들어가있으면 나오지 않음.
        
/*
인라인 뷰 서브쿼리(inline view subquery)
    서브쿼리를 임시 테이블 뷰로 사용하는 서브쿼리
*/
SELECT e.employee_id,e.last_name,d.department_name,d.department_id
FROM employees e
JOIN (SELECT department_id,department_name 
                FROM departments
                 WHERE department_id <50)d -- 가상의 서브쿼리가 됨
ON e.department_id = d.department_id;

-- 스칼라
