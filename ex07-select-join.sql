/*
****중요****
JOIN
    SQL에서 두개 이상의 테이블에서 관련된 행들을 결합하기 위한 연산.

*/
/*NATURAL JOIN 
두 테이블에서 데이터 유형과 이름이 일치하는 열을 기반으로 자동으로
테이블을 조인할 수 있습니다.*/
SELECT department_id, department_name,
        location_id, city
FROM departments -- departments 에서는 city가 조회안됨.
NATURAL JOIN locations; -- city를 조회하기 위해 ,2개의 테이블(locations)을 연결.

/*
USING 절로 조인
    명시적으로 결함을 수행하고자 하는 열을 정해줍니다.
*/
SELECT employee_id, last_name,location_id,department_id, department_name
FROM employees JOIN departments -- 사원테이블과 부서테이블을 연결.
USING (department_id);

/*
ON 절로 조인
    ON 절을 사용하여 조인 조건을 지정합니다.
    컬럼명이 다를 경우 ,
*/
SELECT e.employee_id,e.last_name,
        e.department_id, d.department_name, d.location_id
FROM employees e JOIN departments d
--사원 테이블 별칭 e / 부서테이블 별칭 d
ON e.department_id = d.department_id;
-- 사원테이블의 부서아이디와, 부서테이블의 부서아이디를 부서아이디로 조인.
--표준
SELECT e.employee_id, e.last_name,
    e.department_id , d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;
-- 동일한 값.오라클은 가능

-- ON 절 활용하여 3-WAY조인
SELECT e.employee_id, e.last_name, e.first_name,
    d.department_name, l.city
FROM employees e 
JOIN departments d 
ON e.department_id = d.department_id  --사원과 부서테이블  부서아이디로 연결
-- 하나의 커리로 생각 ( 그 쿼리에 조인을 건다고 생각)
JOIN locations l
ON d.location_id =l.location_id; -- 부서테이블, 위치 테이블 위치아이디로연결