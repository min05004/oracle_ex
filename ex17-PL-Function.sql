/*
�Լ� (function)
    Ư�� ��ɵ��� ����ȭ,������ �� �ְ� ������ �������� �����ϰ� ���� �� �ֽ��ϴ�.
    
[�⺻����]
CREATE OR REPLACE FUCTION �Լ��̸� (�Ű�����1,�Ű�����2...)
RETURN datatype --��ȯ�Ǵ� ���� ����
    IS(AS) --�����
    BEGING
         [�����]
    EXCEPTION
        [EXCEPTION ó��]
    RETURN ����;
    END;

*/

-- �μ� �̸� �˻��ϴ� �Լ�
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

-- �μ��� ��� �޿��� ����ϴ� �Լ�
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
Ʈ���� (trigger)
������ ���̽����� Ư�� �̺�Ʈ�� �߻��� ��
�ڵ����� ����Ǵ� ����� pl/sql ���α׷� �Դϴ�

before trigger (���� Ʈ����)
���� Ʈ���Ŵ� Ư�� �̺�Ʈ ( �� : �����, ������Ʈ, ����) �� �߻��ϱ� ���� ����˴ϴ�.

after trigger ( ���� Ʈ����)
���� Ʈ���Ŵ� Ư�� �̺�Ʈ (�� : �����, ����,������Ʈ ) �� �߻��� �Ŀ� ����˴ϴ�.

old �� new
Ʈ���Ŵ� :old :new

:OLD�� :NEW
    Ʈ���Ŵ� :OLD�� :NEW��� �ϴ� ���� ���ڵ带 ����Ͽ� ������ ���濡 
    ���� ������ �����մϴ�.
    
    :OLD
        ���� �� ���� ��Ÿ���� ���� ���ڵ��Դϴ�.
        ������Ʈ �Ǵ� ���� �̺�Ʈ���� ���� �����ͺ��̽��� ���� ���¸� ��Ÿ���ϴ�.
    :NEW
        ���ο� �� ���� ��Ÿ���� ���� ���ڵ��Դϴ�.
        ���� �Ǵ� ������Ʈ �̺�Ʈ���� ���ο� �����͸� ��Ÿ���ϴ�.
    



*/



CREATE TABLE emp_audt_log(
    empno NUMBER,
    action VARCHAR2(25),
    log_date DATE
    );
    
SELECT * FROM emp_audt_log;
SELECT * FROM emp;

--  ������ ���� �߰��� �� �α׸� ����ϴ� Ʈ����

CREATE OR REPLACE TRIGGER emp_insert_log
AFTER INSERT ON emp
FOR EACH ROW  -- �ش� Ʈ���Ű� �� ���� ���濡 ���� ����ǵ��� �����ϴ� ����
BEGIN
     INSERT INTO emp_audt_log (empno,action,log_date)
     VALUES ( : new.empno,'insert',sysdate);
END;
/
    
-- EMP ���̺� INSERT �ϱ� Ʈ���� �׽�Ʈ!
INSERT INTO emp (empno, ename, deptno)
VALUES (3, '�����', 3);
COMMIT;


SELECT * FROM emp;
SELECT * FROM emp_audit_log;


ROLLBACK;

SELECT AVG(salary) 
FROM employees
WHERE department_id = 20;
SELECT calculate_department_avg_salary(20) FROM dual;

    

    