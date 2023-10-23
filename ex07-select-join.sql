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


-- 조인에 추가 조건 적용

SELECT e.employee_id,e.last_name,e.manager_id,e.department_id,
d.department_id,d.location_id
FROM employees e JOIN departments d
on e.department_id = d.department_id
AND e.manager_id =149
JOIN locations l
ON d.location_id = l.location_id;

/*
테이블 자체 조인
      on절을 사용하는 self join

*/

SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON worker.manager_id = manager.employee_id
;

/*
Nonequijoin
     등호 연산자 외의 다른 연산자를 포함하는 조인 조건

SELECT * FROM job_grades;
INSERT INTO job_grades VALUES ('A',1000,2999);
INSERT INTO job_grades VALUES ('B',3000,5999);
INSERT INTO job_grades VALUES ('C',6000,9999);
INSERT INTO job_grades VALUES ('D',10000,14999);
INSERT INTO job_grades VALUES ('E',15000,24999);
INSERT INTO job_grades VALUES ('F',25000,40000);

COMMIT;
*/

CREATE TABLE job_grades (
grade_level CHAR(1),
lowest_sal NUMBER(8,2) NOT NULL, -- 데이터를 넣을떄 빈값은 안됨(NOT NULL)
highest_sal NUMBER(8,2) NOT NULL);

SELECT * FROM job_grades;

SELECT e.last_name,e.salary,j.grade_level
FROM employees e JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

/*
INNER JOIN  / OUTER JOIN
    INNER JOIN
    일치하지 않는 행은 출력에 표시되지 않습니다.
    (교집합 해당 출력)
    
    OUTER JOIN 
    한 테이블의 행을 기반으로 다른 테이블과의 연결이 없는 행까지 포함하여 반환합니다.
    

*/
/*
LEFT OUTER JOIN
    DEPARTMENTS 테이블에 대응되는 행이 없어도 
    왼쪽 테이블인 EMPLOYEES 테이블의 모든 행을 검색합니다.

*/
SELECT e.last_name, e.department_id , d.department_name
FROM employees e LEFT OUTER JOIN departments d  -- 왼쪽 테이블이 기준 (from 기준으로)사원테이블 전체 + 사원에 해당되는 부서 매칭이 됨.
ON e.department_id = d.department_id;

/*
RIGHT OUTER JOIN
    *성능상 left 가 더 나음...!
    employees 테이블에 대응되는 행이 없어도 오른쪽 테이블인 departments 테이블의 모든행을 검색.
*/

SELECT e.last_name,d.department_id,d.department_name
FROM employees e RIGHT OUTER JOIN departments d -- 사원이 없는 부서까지 다 나옴.
ON e.department_id = d.department_id;

SELECT e.last_name,d.department_id,d.department_name
FROM employees e, departments d 
WHERE e.department_id = d.department_id(+); -- (+) 가 어디에 있느냐에 따라 LEFT,RIGHT 달라짐.


/*
FULL OUTER JOIN
    DEPARTMENT, EMPLOYEES 대응되는 행이 없어도
    테이블의 모든행을 검색합니다.

*/
SELECT e.last_name,d.department_id,d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;  -- 두 테이블의 값이 다 나옴.

/*
Cartesian product
    조인 조건이 잘못됬거나 완전히 생략된 경우 결과가 모든행의 조합이 표시되는
    Cartesian product로 나타냅니다.
*/
SELECT last_name, department_name
FROM employees
CROSS JOIN departments; -- 모든 경우의 수 다 나옴.


