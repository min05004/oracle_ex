/*

���ν��� ���
*/

-- 1. �ݺ���
/*
FOR LOOP
FOR index in ���۰�..END�� LOOP
    [���๮]
END LOOP;
*/

BEGIN
    FOR I IN 1..4 LOOP
        IF MOD(I, 2) = 0 THEN
            dbms_output.put_line( I || '�� ¦��!!');
        ELSE 
            dbms_output.put_line( I || '�� Ȧ��!!');
        END IF;
    END LOOP;
END;
/

-- FOR ���ȿ� SELECT�� ����

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
                dbms_output.put_line( NUM_LIST.NUM || '�� ¦��!!');
            ELSE 
                dbms_output.put_line( NUM_LIST.NUM || '�� Ȧ��!!');
            END IF;
        END LOOP;
    END;
/

/*
WHILE LOOP��
*/

DECLARE
    v_num NUMBER := 6;
    v_tot_num NUMBER :=0;
BEGIN
    WHILE v_num < 11 LOOP
        DBMS_OUTPUT.PUT_LINE('���� ����: '|| v_num);
        v_num := v_num +1;
        v_tot_num := v_tot_num + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(v_tot_num || '���� LOOP');
END;
/


-- 2. ���
/*
IF��
    
IF ����1 THEN
    ����1�� ���϶� ó����1
ELIF ����2 THEN
    ����2�� ���϶� ó����2
ELSE 
    ����1, ����2 ��� �����϶� ó����
END IF;
*/
DECLARE 
    v_score NUMBER := 79;
BEGIN
    IF v_score >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : A');
    ELSIF v_score >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : B');  
    ELSIF v_score >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : C');  
    ELSIF v_score >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : D');  
    ELSE
        DBMS_OUTPUT.PUT_LINE('���� : ' || v_score || ', ��� : F');  
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