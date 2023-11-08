/*
PL/SQL 
    SQL 을 확장한 절차적 언어 입니다.
    여러 SQL을 하나의 블록으로 구성하여 SQL제어할 수 있습니다.

프로시저(Prpcedure)
    데이터베이스에서 실행가능한 하나 이상의 SQL문을 묶어서 하나의
    논리적 작업 단위로 만든 데이터베이스 객체 입니다.
*/

/*
익명 프로시저 -- 일회용 프로시저 DB에 저장되지 않습니다.
[기본 구조]
    DECLARE - 변수정의
    BEGIN - 처리 로직 시작
    EXCEPTION -- 예외처리
    END -- 로직 종료

*/
--실행결과를 출력하도록 설정

SET SERVEROUTPUT ON;

SET TIMING ON;


DECLARE     -- 변수 정의
    V_STRD_DT       VARCHAR2(8);
    V_STRD_DEPTNO   NUMBER;
    V_DEPTNO        NUMBER;
    V_DNAME         VARCHAR2(50);
    V_LOC           VARCHAR2(50);
    V_RESULT_MSG    VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN       -- 로직 시작
    V_STRD_DT := TO_CHAR(SYSDATE, 'YYYYMMDD');
    V_STRD_DEPTNO := 10;
    
    SELECT T1.department_id
         , T1.department_name
         , T1.location_id
      INTO V_DEPTNO
         , V_DNAME
         , V_LOC
    FROM departments T1
    WHERE T1.department_id = V_STRD_DEPTNO;
    -- 조회 결과 변수 설정
    V_RESULT_MSG := 'RESULT > DEPTNO='||V_DEPTNO||', DNAME='||V_DNAME||', LOC='||V_LOC;
    -- 조회 결과 출력
    DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
EXCEPTION  -- 예외처리
    WHEN VALUE_ERROR THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], VALUE_ERROR_MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
    WHEN OTHERS THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
END; -- 작업 종료


/*
프로시저
[기본구조]

CREAT OR REPLACE PROCEDURE  프로시저이름 ( 매개변수1,매개변수2...)  -- 입력값을 받아서 선언부,실행부에 사용가능.
    IS 또는 (AS)
        [선언부]
    BRGIN
        [실행부]
    [EXCEPTION]
        [EXCEPTION 처리]
    END;

*/



CREATE OR REPLACE PROCEDURE print_hello_proc    -- 매개변수 없으면 () 생략가능
    IS  -- 프로시저 선언부 
        msg VARCHAR2(20) := 'hello world';  -- 변수 초기값 선언
    BEGIN   -- 프로시저 실행문 작성
        DBMS_OUTPUT.PUT_LINE(msg);
    END;
/ -- 오류 해결하기

EXEC print_hello_proc;



/*
IN 매개변수
    값이 프로시저 안으로 들어감.

*/
CREATE TABLE emp2 AS
SELECT employee_id empno,last_name name,salary,department_id deptno
FROM employees;

CREATE OR REPLACE PROCEDURE update_emp_salary_proc(eno IN NUMBER)
     IS
     BEGIN
        UPDATE emp2 SET
        salary = salary*1.1
        WHERE empno = eno;
        
        commit;
    END;
/    
 
 --
 
SELECT * FROM emp2
WHERE empno =115;

exec update_emp_salary_proc(115);

/*
out 매개변수
     프로시저의 반환값이 없으므로 out 매개변수로 값을 받을 수 있다.

*/
CREATE OR REPLACE PROCEDURE find_emp_proc(v_eno IN NUMBER,
    v_fname OUT NVARCHAR2,v_lname OUT NVARCHAR2,v_sal OUT NUMBER) -- in으로 들어간 것은 값으로 들어가지만 out 으로 들어간건 참조값(주소값)이 들어감.
    IS
    BEGIN
        select first_name,last_name,salary
        into v_fname,v_lname,v_sal -- 주소값을 찾아가서 
        from employees where employee_id = v_eno;
    end;
    /
VARIABLE v_fname NVARCHAR2(25);
VARIABLE v_lname NVARCHAR2(25);
VARIABLE v_sal NUMBER;

EXECUTE find_emp_proc(115, :v_fname,:v_lname,:v_sal);
print v_fname;
print v_lname;
print v_sal;


/*
IN OUt 매개변수
     IN OUT 동시에 사용할 수 있는 매개변수

*/

CREATE OR REPLACE PROCEDURE find_sal(v_io IN OUT NUMBER) -- 주소값 저장과 값저장 둘다 가능)
IS
 BEGIN 
    SELECT salary
    INTO v_io
    FROM employees where employee_id = v_io;
end;
/

VAR v_io NUMBER; -- 변수 선언
EXEC :v_io :=115; --값 115 넣어주기
PRINT v_io;
EXEC find_sal(:v_io); -- find_sal에 변수 넣기 
PRINT v_io;


  
    