/*
-- �����ּ� 
/*
���ϸ�: ex01-select.sql

SQL (Structured Query Language)
    ������ ������ ���̽� �ý��ۿ��� �ڷ� ���� �� ó���ϱ� ���� ����� ���

SELECT ��
    �����ͺ��̽����� ���� �˻� ��ɾ�
*/

-- ��� �� ���� *
SELECT * 
FROM departments;

-- Ư�� �� ���� (�������� Projection)
SELECT department_id, location_id
FROM departments;

/* 
�����
    ��������ڸ� ����Ͽ� ����/��¥ ������ ǥ���� �ۼ�

    + ���ϱ�
    - ����
    * ���ϱ�
    / ������

*/
-- ��������� ���
SELECT 
    last_name,
    salary,
    salary + 300
FROM employees; 

/*
������ �켱����
    ���ϱ�� ������� ���ϱ� ���⺸�� ���� ����
*/
SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

/*
������� Null ��
    null ���� �����ϴ� ������� null�� ���
*/
SELECT last_name, 12*salary*commission_pct, 
    salary, commission_pct
FROM employees;

/*
�� alias ���� - ����,��Ī
    �� �Ӹ����� �̸��� �ٲߴϴ�.
    �� �̸� �ٷ� �ڿ� ���ɴϴ�. 
    (�� �̸��� alias ���̿� ���� ������ as Ű���尡 �ü� �ֽ��ϴ�.)
    �����̳� Ư�� ���ڸ� �����ϰų� ��ҹ��ڸ� �����ϴ� ��� ū����ǥ�� 
    �ʿ��մϴ�.
    ������ �ٲ�°� �ƴϰ� ��ȸ�� �� �Ӹ��� �ٲ� ��ȸ�� ������.
*/
SELECT last_name as name, commission_pct, 
    salary * 10 as �޿�10��
FROM employees;
--last name �� name ���� �ٲ�,salary �� 

SELECT last_name "Name", salary * 12 "Annual Salary"
FROM employees;
-- as�� ������ ������ ���⸸ �ϸ� �� ,��ҹ���,Ư������ ���н� ""

/*
���� ������
    ���̳� ���ڿ��� �ٸ����� �����մϴ�.
    �� ���� ���μ�(||)���� ��Ÿ���ϴ�.
    ��� ���� ���� ǥ������ �ۼ� �մϴ�.
*/
SELECT last_name||job_id AS "Employees", last_name, job_id
FROM employees;
 -- employees �ȿ� �ΰ��� Į���� ������ �Ǽ�(�̾ �ۼ�) �ϳ��� �Ӽ������� ����
/*
���ͷ� ���ڿ� = ���� ���� ��¥ �� 
    ���ͷ��� SELECT ���� ���Ե� ����, ���� �Ǵ� ��¥ �Դϴ�.
    ��¥ �� ���� ���ͷ� ���� ���� ����ǥ�� ����� �մϴ�.
    �� ���ڿ��� ��ȯ�Ǵ� �� �࿡ �ѹ��� ��µ˴ϴ�.
*/
SELECT last_name || ' is a ' || job_id AS "Employee Details"
FROM employees;
-- ��Ʈ ���ӿ�  is a �� �پ ��ȸ�� ��. 

/* 
��ü �ο�(q) ������
    �ڽ��� ����ǥ �����ڸ� �����մϴ�.
    �����ڸ� ���Ƿ� �����մϴ�.
    ������ �� ��뼺�� �����մϴ�.
*/
SELECT department_name || q'[ Department's Manager id: ]' 
        || manager_id AS "Department and Manager"
FROM departments;
-- �μ� �̸� , �ڿ� ���ͷ� �� �Ŵ��� �ƴϵ���� �����ؼ� ��ȸ
-- ���ڿ� �ȿ� '(Ȧ����ǥ) ���� ���� , ��ü���� q[]�ȿ� ��� ���ڴ� ���ڿ��� �ν�.

/*
�ߺ��� 
    �⺻������ Query ������� �ߺ� ���� ������ ������� ǥ�õ˴ϴ�.
    DISTINCT �� ����Ͽ� �ߺ��� ���� �� �� �ֽ��ϴ�.
*/
SELECT department_id 
FROM employees;
-- ��� ���̺� �μ��� ��ȸ 

-- �ߺ�����
SELECT DISTINCT department_id
FROM employees;
-- ��������� �μ���ȣ�� ���� ����� �������� ����(null)

/*
���̺� ����ǥ��
    DESCRIBE ����� ����Ͽ� ���̺� ������ ǥ���մϴ�.
*/
DESCRIBE employees;
DESC employees; -- ���� ���� ����ȭ
-- ���̺� ���� ��Ű���� ��ȸ , �̸� = �Ӽ�/not null �ʼ��� �� ���� �� ����/ ���� - ����,���ڿ�(btte)
-- (8,2 - �Ҽ��� 2�ڸ�����)





