/*
PL/SQL 
    SQL �� Ȯ���� ������ ��� �Դϴ�.
    ���� SQL�� �ϳ��� ������� �����Ͽ� SQL������ �� �ֽ��ϴ�.

���ν���(Prpcedure)
    �����ͺ��̽����� ���డ���� �ϳ� �̻��� SQL���� ��� �ϳ���
    ���� �۾� ������ ���� �����ͺ��̽� ��ü �Դϴ�.
*/

/*
�͸� ���ν��� -- ��ȸ�� ���ν��� DB�� ������� �ʽ��ϴ�.
[�⺻ ����]
    DECLARE - ��������
    BEGIN - ó�� ���� ����
    EXCEPTION -- ����ó��
    END -- ���� ����

*/
--�������� ����ϵ��� ����

SET SERVEROUTPUT ON;

SET TIMING ON;


DECLARE     -- ���� ����
    V_STRD_DT       VARCHAR2(8);
    V_STRD_DEPTNO   NUMBER;
    V_DEPTNO        NUMBER;
    V_DNAME         VARCHAR2(50);
    V_LOC           VARCHAR2(50);
    V_RESULT_MSG    VARCHAR2(500) DEFAULT 'SUCCESS';
BEGIN       -- ���� ����
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
    -- ��ȸ ��� ���� ����
    V_RESULT_MSG := 'RESULT > DEPTNO='||V_DEPTNO||', DNAME='||V_DNAME||', LOC='||V_LOC;
    -- ��ȸ ��� ���
    DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
EXCEPTION  -- ����ó��
    WHEN VALUE_ERROR THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], VALUE_ERROR_MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
    WHEN OTHERS THEN
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE =>'||SQLERRM;
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
END; -- �۾� ����


/*
���ν���
[�⺻����]

CREAT OR REPLACE PROCEDURE  ���ν����̸� ( �Ű�����1,�Ű�����2...)  -- �Է°��� �޾Ƽ� �����,����ο� ��밡��.
    IS �Ǵ� (AS)
        [�����]
    BRGIN
        [�����]
    [EXCEPTION]
        [EXCEPTION ó��]
    END;

*/



CREATE OR REPLACE PROCEDURE print_hello_proc    -- �Ű����� ������ () ��������
    IS  -- ���ν��� ����� 
        msg VARCHAR2(20) := 'hello world';  -- ���� �ʱⰪ ����
    BEGIN   -- ���ν��� ���๮ �ۼ�
        DBMS_OUTPUT.PUT_LINE(msg);
    END;
/ -- ���� �ذ��ϱ�

EXEC print_hello_proc;



/*
IN �Ű�����
    ���� ���ν��� ������ ��.

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
out �Ű�����
     ���ν����� ��ȯ���� �����Ƿ� out �Ű������� ���� ���� �� �ִ�.

*/
CREATE OR REPLACE PROCEDURE find_emp_proc(v_eno IN NUMBER,
    v_fname OUT NVARCHAR2,v_lname OUT NVARCHAR2,v_sal OUT NUMBER) -- in���� �� ���� ������ ������ out ���� ���� ������(�ּҰ�)�� ��.
    IS
    BEGIN
        select first_name,last_name,salary
        into v_fname,v_lname,v_sal -- �ּҰ��� ã�ư��� 
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
IN OUt �Ű�����
     IN OUT ���ÿ� ����� �� �ִ� �Ű�����

*/

CREATE OR REPLACE PROCEDURE find_sal(v_io IN OUT NUMBER) -- �ּҰ� ����� ������ �Ѵ� ����)
IS
 BEGIN 
    SELECT salary
    INTO v_io
    FROM employees where employee_id = v_io;
end;
/

VAR v_io NUMBER; -- ���� ����
EXEC :v_io :=115; --�� 115 �־��ֱ�
PRINT v_io;
EXEC find_sal(:v_io); -- find_sal�� ���� �ֱ� 
PRINT v_io;


  
    