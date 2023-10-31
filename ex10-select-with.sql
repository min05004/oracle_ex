/*
with 절
    WITH 절은 서브쿼리 결과를 임시로 정의하고 사용할 수 있는 기능.
    공통테이블 표현식 CTE(common table expression)
    
    주로 복잡한 쿼리를 간결하게 작성하거나 가독성을 높이는데 활용됩니다.
    

*/

-- 부서별 평균 급여를 계산하는 쿼리
WITH AvgSalByDept As (
    SELECT
        department_id,
        AVG(salary)AS avgsalary
    FROM employees
    GROUP BY department_id) -- with 절 안에 쿼리값:  AvgSalByDept 테이블이 생김
    
SELECT d.department_name, AvgSalByDept.avgsalary
FROM departments d
JOIN AvgSalByDept
ON d.department_id = AvgSalByDept.department_id
AND d.department_id =10;


-- with 절로 계층 표현
WITH RecursiveCTE (id,name,manager_id,depth) AS ( -- RecursiveCTE 컬럼  만들기
    SELECT employee_id, last_name, manager_id , 1 -- RecursiveCTE 컬럼 안에 값 넣기
    FROM employees
    WHERE manager_id IS NULL -- 호출할 때 처음 실행되는 쿼리,
    UNION ALL -- 아래 데이터 합해줌
    SELECT e.employee_id, e.last_name, e.manager_id, rc.depth +1
    FROM employees e
    INNER JOIN RecursiveCTE rc ON e.manager_id = rc.id)
    -- 임시 테이블
SELECT id,name,manager_id,depth
FROM RecursiveCTE;
-- 호출 