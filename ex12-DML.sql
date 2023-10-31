/*
DML(data manipulation Language)
    DB���� �����͸� �����ϰ� ó���ϴ� sql�Դϴ�.
    
    INSERT ��: ���̺��� ���ο� ���ڵ� ����
    UPDATE �� : ���̺��� ���� ���ڵ带 ����
    DELETE �� : ���̺��� Ư�� ���ڵ带 ����
    
    SELECT �� DML ���Ե� �� ������, ���� DQL�� �з��մϴ�.

*/

/*
INSERT ��
[�⺻����]
    INSERT INTO ���̺�� ( �÷���1,�÷���2...)
    VALUES(��1,��2....);
    
    �Ǵ�
    
    INSERT INTO ���̺��( �÷���1,�÷���2,....) subquery;
    
*/

SELECT * FROM departments;

INSERT INTO departments
    (department_id,department_name,manager_id,location_id)
VALUES
    (280,'Public Relations',100,1700);
    
COMMIT; -- DML ����� ���������� DB�� �ݿ�

--null ���� ���� �� ����
--�� ����
INSERT INTO departments(department_id,department_name)
VALUES (290,'Purchasing'); -- ���� ���� ������ ���� ���� ���� null�� ǥ��.
COMMIT;


--null Ű���� ����
INSERT INTO departments -- ��� �Ӽ��� �����Ÿ� ������ ����.
VALUES (300,'Finance',null,null);
ROLLBACK; --DML���� �������� ����մϴ�.(commit�� ���ߴٸ� ����..!)

DESC departments;
COMMIT;

/*
INSERT subquery
*/

CREATE TABLE sales_reps
AS (
    SELECT employee_id id,last_name name,salary, commission_pct
    FROM employees
    WHERE 1 = 2 -- ������ �����ؼ� ���̺��� ����� ���� false���� ��.
);

SELECT * FROM sales_reps;

--job_id 'REP' ���Ե� ���
INSERT INTO sales_reps(id,name,salary,commission_pct)
SELECT employee_id As id, last_name AS name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

SELECT * FROM sales_reps;

/*
UPDATE �� : ���̺��� ���� ���� �����մϴ�.
[�⺻����]
    UPDATE ���̺��
    SET
        �÷���1 = ������,�÷���2 =������...
    WHERE ������
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
DELETE �� - ���̺��� �������� ������ �� �ֽ��ϴ�.

*/
DELETE FROM sales_reps
WHERE id = 202;

SELECT * FROM sales_reps;
ROLLBACK;
COMMIT;

/*
TRUNCATE ��
���̺��� �� ���·�, ���̺� ���� �״�� ���ܵ� ä ���̺��� ��� ���� �����մϴ�.
DML���� �ƴ϶� DDL*������ ���Ǿ�) ���̹Ƿ� ���� ����� �� ����.
-- ���� �ʱ�ȭ ����, ������ �����! �����������,,,����
*/

TRUNCATE TABLE salse_reps;

/*
Ʈ����� (Transaction)
������ ó���� �� ����
����Ŭ���� �߻��Ѥ� ���� ���� sql ��ɹ��� �ϳ���
������ �۾� ������ ó���ϴµ� �̸� Ʈ������̶�� ��.


    COMMIT : SQL ���� ����� ���������� DB�� �ݿ�
    ROLLBACK : SQL ���� �������� �������
    SQVEPOINT : Ʈ������� �������� ǥ���ϴ� �ӽ�������.
*/

CREATE TABLE member (
    num NUMBER PRIMARY KEY,
    name VARCHAR2(30),
    addr VARCHAR2(50)
)
;

INSERT INTO member VALUES(1, '��ī��', '���ʸ���');
COMMIT;
INSERT INTO member VALUES(2, '������', '���ʸ���');
INSERT INTO member VALUES(3, '���̸�', '���ʸ���');
INSERT INTO member VALUES(4, '���α�', '���ʸ���');
INSERT INTO member VALUES(5, '������', '���ʸ���');
SAVEPOINT mypoint;
INSERT INTO member VALUES(6, '�ߵ���', '���ʸ���');
INSERT INTO member VALUES(7, '������', '���ʸ���');
INSERT INTO member VALUES(8, '�ǰ���', '���ʸ���');
ROLLBACK TO mypoint;

commit;


SELECT * FROM member;



