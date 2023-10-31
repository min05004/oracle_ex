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

DECLARE  --변수 정의 ; 값을 담을 수 있는 하나의 공간.
     V_STRD_DT VARCHAR2(8);
     V_STRD_DEPTNO NUMBER;
     V_DNAME VARCHAR2(50);
     V_LOC VARCHAR2(50);
     V_RESULT_MSG VARCHAR2(500) DEFAULT 'SUCCESS';
     
BEGIN  --로직 시작
    V_STRD_DT := TO_CHAR(SYSDATE,'YYYYMMDD'); -- 현재 시간을 20231030 표현
    V_STRD_DEPTNO := 10; 
    -- 값을 넣어줌 
    SELECT T1.department_id
    ,T1.drpartment_name
    ,T1.location_id
    INTO V_DEPTNO
    ,V_DNAME
    ,V_LOC -- SELECT조회된 결과를 각각의 변수에 넣어줌
    FROM departments T1
    WHERE T1.department_id = V_STRD_DEPTNO; 
    -- 10으로 조회했을 때 나온 결과
    
    --조회 결과 변수 설정
    V_RESULT_MSG := 'RESULT > DEPTNO'|| V_DEPTNO|| ', DNAME='|| V_DNAME|| ', LOC='||V_LOC;
    --조회 결과 출력
    DBMS_OUTPUT.PUT_LINE(V_RESULT_MSG);
EXCEPTION
    WHEN VALUE_ERROR THEN
    V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], VALUE_ERROR_MESSAGE => '||SQLERRM;
    DBMS_OUTPUT.PUT_LINE(V_RESULT_MSG);
WHEN OTHERS THEN
    V_RESULT_MSG :='SQLCODE['||SQLCODE||'], MESSAGE => '||SQLERRM;
    