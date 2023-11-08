/*
함수 (function)
    특정 기능들을 무듈화,재사용할 수 있게 복잡한 쿼리문을 간결하게 만들 수 있습니다.
    
[기본구조]
CREATE OR REPLACE FUCTION 함수이름 (매개변수1,매개변수2...)
RETURN datatype --반환되는 값의 유형
    IS(AS) --선언부
    BEGING
         [실행부]
    EXCEPTION
        [EXCEPTION 처리]
    RETURN 변수;
    END;

*/

-- 부서 이름 검색하는 함수
CREATE OR REPLACE FUNCTION fn_get_dept_name(p_dept_no NUMBER)
RETURN VARCHAR2
    IS 
        V_TEST_NAME VARCHAR2(30);
    BEGIN
        SELECT department_name
        INTO   V_TEST_NAME
        FROM   departments
        WHERE department_id = p_dept_no;

    RETURN V_TEST_NAME;
    END;
/

SELECT fn_get_dept_name(30) FROM dual;

-- 부서의 평균 급여를 계산하는 함수
CREATE OR REPLACE FUNCTION calculate_department_avg_salary(department_id NUMBER)
RETURN NUMBER
    IS
        V_avg_salary NUMBER := 0;
    BEGIN
        SELECT AVG(salary) 
        INTO   v_avg_salary
        FROM employees
        WHERE department_id = department_id;        
    RETURN v_avg_salary;    
    END;
/


SELECT AVG(salary) 
FROM employees
WHERE department_id = 20;
SELECT calculate_department_avg_salary(20) FROM dual;




/*
트리거 (trigger)
데이터 베이스에서 특정 이벤트가 발생할 걔
자동으로 실행되는 저장된 pl/sql 프로그램 입니다

before trigger (이전 트리거)
이전 트리거는 특정 이벤트 ( 예 : 행삽입, 업데이트, 삭제) 가 발생하기 전에 실행됩니다.

after trigger ( 이후 트리거)
이후 트리거는 특정 이벤트 (예 : 행삽입, 삭제,업데이트 ) 가 발생한 후에 실행됩니다.

old 와 new
트리거는 :old :new

:OLD와 :NEW
    트리거는 :OLD와 :NEW라고 하는 가상 레코드를 사용하여 데이터 변경에 
    대한 정보를 제공합니다.
    
    :OLD
        이전 행 값을 나타내는 가상 레코드입니다.
        업데이트 또는 삭제 이벤트에서 현재 데이터베이스의 이전 상태를 나타냅니다.
    :NEW
        새로운 행 값을 나타내는 가상 레코드입니다.
        삽입 또는 업데이트 이벤트에서 새로운 데이터를 나타냅니다.
    



*/



CREATE TABLE emp_audt_log(
    empno NUMBER,
    action VARCHAR2(25),
    log_date DATE
    );
    
SELECT * FROM emp_audt_log;
SELECT * FROM emp;

--  직원이 새로 추가될 때 로그를 기록하는 트리거

CREATE OR REPLACE TRIGGER emp_insert_log
AFTER INSERT ON emp
FOR EACH ROW  -- 해당 트리거가 각 행의 변경에 대해 실행되도록 지정하는 역할
BEGIN
     INSERT INTO emp_audt_log (empno,action,log_date)
     VALUES ( : new.empno,'insert',sysdate);
END;
/
    
-- EMP 테이블 INSERT 하기 트리거 테스트!
INSERT INTO emp (empno, ename, deptno)
VALUES (3, '김민재', 3);
COMMIT;


SELECT * FROM emp;
SELECT * FROM emp_audit_log;


ROLLBACK;

SELECT AVG(salary) 
FROM employees
WHERE department_id = 20;
SELECT calculate_department_avg_salary(20) FROM dual;

    

    