/*

프로시저 제어문
*/

-- 1. 반복문
/*
FOR LOOP
FOR index in 시작값..END값 LOOP
    [실행문]
END LOOP;
*/

BEGIN
    FOR I IN 1..4 LOOP
        IF MOD(I, 2) = 0 THEN
            dbms_output.put_line( I || '는 짝수!!');
        ELSE 
            dbms_output.put_line( I || '는 홀수!!');
        END IF;
    END LOOP;
END;
/

-- FOR 문안에 SELECT문 예제

BEGIN
    FOR NUM_LIST IN
        (
            SELECT 1 AS NUM FROM DUAL
            UNION ALL
            SELECT 2 AS NUM FROM DUAL
            UNION ALL
            SELECT 3 AS NUM FROM DUAL
            UNION ALL
            SELECT 4 AS NUM FROM DUAL
        )
        LOOP
            IF MOD(NUM_LIST.NUM, 2) = 0 THEN
                dbms_output.put_line( NUM_LIST.NUM || '는 짝수!!');
            ELSE 
                dbms_output.put_line( NUM_LIST.NUM || '는 홀수!!');
            END IF;
        END LOOP;
    END;
/

/*
WHILE LOOP문
*/

DECLARE
    v_num NUMBER := 6;
    v_tot_num NUMBER :=0;
BEGIN
    WHILE v_num < 11 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 숫자: '|| v_num);
        v_num := v_num +1;
        v_tot_num := v_tot_num + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_tot_num || '번의 LOOP');
END;
/


-- 2. 제어문
/*
IF문
    
IF 조건1 THEN
    조건1이 참일때 처리문1
ELIF 조건2 THEN
    조건2가 참일때 처리문2
ELSE 
    조건1, 조건2 모두 거짓일때 처리문
END IF;
*/
DECLARE 
    v_score NUMBER := 79;
BEGIN
    IF v_score >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('점수 : ' || v_score || ', 등급 : A');
    ELSIF v_score >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('점수 : ' || v_score || ', 등급 : B');  
    ELSIF v_score >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('점수 : ' || v_score || ', 등급 : C');  
    ELSIF v_score >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('점수 : ' || v_score || ', 등급 : D');  
    ELSE
        DBMS_OUTPUT.PUT_LINE('점수 : ' || v_score || ', 등급 : F');  
    END IF;
END;
/

DECLARE 
    v_grade CHAR(1) := 'C';
    v_appraisal VARCHAR(20);
BEGIN
    v_appraisal := CASE v_grade
                    WHEN 'A' THEN 'Excellent'
                    WHEN 'B' THEN 'Very Good'
                    WHEN 'C' THEN 'GOOD'
                    ELSE 'No such grad'
                 END;
    DBMS_OUTPUT.PUT_LINE('Grade : '|| v_grad);
    DBMS_OUTPUT.PUT_LINE('Appraisal : '|| v_appraisal);
END;
/