/*
DML(data manipulation Language)
    DB에서 데이터를 조작하고 처리하는 sql입니다.
    
    INSERT 문: 테이블에서 새로운 레코드 삽입
    UPDATE 문 : 테이블에서 기존 레코드를 갱신
    DELETE 문 : 테이블에서 특정 레코드를 삭제
    
    SELECT 는 DML 포함될 수 있지만, 보통 DQL로 분류합니다.

*/

/*
INSERT 문
[기본형식]
    INSERT INTO 테이블명 ( 컬럼명1,컬럼명2...)
    VALUES(값1,값2....);
    
    또는
    
    INSERT INTO 테이블명( 컬럼명1,컬럼명2,....) subquery;
    
*/

SELECT * FROM departments;

INSERT INTO departments
    (department_id,department_name,manager_id,location_id)
VALUES
    (280,'Public Relations',100,1700);
    
COMMIT; -- DML 결과를 영구적으로 DB에 반영

--null 값을 가진 행 삽입
--열 생략
INSERT INTO departments(department_id,department_name)
VALUES (290,'Purchasing'); -- 넣은 값만 나오고 넣지 않은 값은 null로 표기.
COMMIT;


--null 키워드 지정
INSERT INTO departments -- 모든 속성값 넣을거면 생략이 가능.
VALUES (300,'Finance',null,null);
ROLLBACK; --DML문의 실행결과를 취소합니다.(commit을 안했다면 가능..!)

DESC departments;
COMMIT;

/*
INSERT subquery
*/

CREATE TABLE sales_reps
AS (
    SELECT employee_id id,last_name name,salary, commission_pct
    FROM employees
    WHERE 1 = 2 -- 구조만 복사해서 테이블을 만들기 위해 false값을 줌.
);

SELECT * FROM sales_reps;

--job_id 'REP' 포함된 사원
INSERT INTO sales_reps(id,name,salary,commission_pct)
SELECT employee_id As id, last_name AS name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

SELECT * FROM sales_reps;

/*
UPDATE 문 : 테이블의 기존 값을 수정합니다.
[기본형식]
    UPDATE 테이블명
    SET
        컬럼명1 = 수정값,컬럼명2 =수정값...
    WHERE 조건절
*/

UPDATE  sales_reps
SET 
    salary = 1200,
    commission_pct = 0.5
WHERE id =156;

SELECT * FROM sales_reps;
COMMIT;

UPDATE sales_reps
SET salary =500
WHERE salary >1000;

ROLLBACK;

SELECT * FROM sales_reps
WHERE id = 202;
commit;

/*
DELETE 문 - 테이블에서 기존행을 제거할 수 있습니다.

*/
DELETE FROM sales_reps
WHERE id = 202;

SELECT * FROM sales_reps;
ROLLBACK;
COMMIT;

/*
TRUNCATE 문
테이블을 빈 상태로, 테이블 구조 그대로 남겨둔 채 테이블에서 모든 행을 제거합니다.
DML문이 아니라 DDL*데이터 정의어) 문이므로 쉽게 언두할 수 없다.
-- 공장 초기화 느낌, 복구가 어려움! 사용하지말것,,,비추
*/

TRUNCATE TABLE salse_reps;

/*
트랜잭션 (Transaction)
데이터 처리의 한 단위
오라클에서 발생한ㄴ 여러 개의 sql 명령문을 하나의
논리적인 작업 단위로 처리하는데 이를 트랜잭션이라고 함.


    COMMIT : SQL 문의 결과를 영구적으로 DB에 반영
    ROLLBACK : SQL 문의 실행결과를 실행취소
    SQVEPOINT : 트랜잭션의 한지점에 표시하는 임시저장점.
*/

CREATE TABLE member (
    num NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    addr VARCHAR2(50)
)
;

INSERT INTO member VALUES(1, '피카츄', '태초마을');
COMMIT;
INSERT INTO member VALUES(2, '라이츄', '태초마을');
INSERT INTO member VALUES(3, '파이리', '태초마을');
INSERT INTO member VALUES(4, '꼬부기', '태초마을');
INSERT INTO member VALUES(5, '버터플', '태초마을');
SAVEPOINT mypoint;
INSERT INTO member VALUES(6, '야도란', '태초마을');
INSERT INTO member VALUES(7, '피존투', '태초마을');
INSERT INTO member VALUES(8, '또가스', '태초마을');
ROLLBACK TO mypoint;

commit;


SELECT * FROM member;



