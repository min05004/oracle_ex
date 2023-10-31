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

DECLARE  --���� ���� ; ���� ���� �� �ִ� �ϳ��� ����.
     V_STRD_DT VARCHAR2(8);
     V_STRD_DEPTNO NUMBER;
     V_DNAME VARCHAR2(50);
     V_LOC VARCHAR2(50);
     V_RESULT_MSG VARCHAR2(500) DEFAULT 'SUCCESS';
     
BEGIN  --���� ����
    V_STRD_DT := TO_CHAR(SYSDATE,'YYYYMMDD'); -- ���� �ð��� 20231030 ǥ��
    V_STRD_DEPTNO := 10; 
    -- ���� �־��� 
    SELECT T1.department_id
    ,T1.drpartment_name
    ,T1.location_id
    INTO V_DEPTNO
    ,V_DNAME
    ,V_LOC -- SELECT��ȸ�� ����� ������ ������ �־���
    FROM departments T1
    WHERE T1.department_id = V_STRD_DEPTNO; 
    -- 10���� ��ȸ���� �� ���� ���
    
    --��ȸ ��� ���� ����
    V_RESULT_MSG := 'RESULT > DEPTNO'|| V_DEPTNO|| ', DNAME='|| V_DNAME|| ', LOC='||V_LOC;
    --��ȸ ��� ���
    DBMS_OUTPUT.PUT_LINE(V_RESULT_MSG);
EXCEPTION
    WHEN VALUE_ERROR THEN
    V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], VALUE_ERROR_MESSAGE => '||SQLERRM;
    DBMS_OUTPUT.PUT_LINE(V_RESULT_MSG);
WHEN OTHERS THEN
    V_RESULT_MSG :='SQLCODE['||SQLCODE||'], MESSAGE => '||SQLERRM;
    