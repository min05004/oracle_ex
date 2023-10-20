/*
WHERE 
    ������ �����ϴ� ������ query�� �����մϴ�.

*/

-- WHERE �� ���
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

-- �μ���ȣ�� 90���� ����� select �� ���� ��ȸ


/* 
���ڿ� �� ��¥
  ���ڿ� �� ��¥ ���� ���� ����ǥ�� �����ϴ�.
  ���� ���� ��ҹ��ڸ� �����ϰ� ��¥ ���� ������ �����մϴ�.  

  �⺻ ��¥ ǥ�������� DD-MON-RR
*/
SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

-- ��Ʈ ������ Whalen �� ����� ��ȸ

SELECT last_name, hire_date
FROM employees
WHERE hire_date = '03/06/17';
-- Ȧ ����ǥ�� ��� ��ȸ , ����Ŭ ����Ʈ �⺻ ��¥ : DD-MON-RR

/*
�� ������
    Ư�� ǥ������ �ٸ����̳� ǥ���İ� ���ϴ� ���ǿ��� ���˴ϴ�.
    
    =   ����
    >   ���� ŭ
    >=  ���� ũ�ų� ����
    <   ���� ����
    <=  ���� �۰ų� ����
    <>  ���� ����
    BETWEEN ... AND ...     �� �� ����(��谪 ����)
    IN(set)                 �� ����Ʈ �� ��ġ�ϴ� �� �˻�(���� �ϳ��� ��ġ�ص� �˻��� ����)
    LIKE                    ��ġ�ϴ� ���� ���� �˻�
    IS NULL                 NULL ������ ����
*/

-- �� ������ ���
SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

-- BETWEEN �����ڸ� ����ϴ� ���� ����
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;
-- �񱳿����ڷ� ��� 
SELECT last_name, salary
FROM employees
WHERE salary >= 2500
AND salary <= 3500 -- ���� �߰��� �� ������ ��� �ش��� �Ǿ�߸� ��ȸ�� ��
;

-- IN �����ڸ� ����ϴ� �������
SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100, 101, 201);-- �ϳ��� �ش��� �Ǹ� ��ȸ����

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id = 100
OR manager_id = 101  -- �ϳ��� �ش��� �ǰ� ��ȸ
OR manager_id = 201
;

/*
LIKE �����ڸ� ����Ͽ� ���� ��ġ
    LIKE �����ڸ� ����Ͽ� ��ȿ�� �˻� ���ڿ� ���� 
    ��ü ���� �˻��� �����մϴ�.
    �˻� ���ǿ��� ���ͷ� ���ڳ� ���ڰ� ���Ե� �� �ֽ��ϴ�.
        % : 0�� �̻��� ���ڸ� ��Ÿ���ϴ�.
        _ : �� ���ڸ� ��Ÿ���ϴ�.
*/
SELECT first_name
FROM employees
WHERE first_name LIKE 'A%';
--A�� �����ϴ� ����� ������ ��� �˻��ض�
-- WHERE first_name LIKE '%a%'; �̸� ��𿡳� a�� ����(�յ� �������)


-- ��ü ���� ����
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';
-- �ι��� ���ڰ� o�� ������� ��ȸ �Ѱ�.

-- ESCAPE �ĺ���
SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE '%SA\_%' ESCAPE '\';
-- escape ���ڸ� �ϳ� ����, sa_ ���� �˻��ϰ� ������

/*
NULL ���� ���
    IS NULL �����ڷ� NULL�� �׽�Ʈ �մϴ�.
*/
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

/*
�� �����ڸ� ����Ͽ� ��������
    AND : ���� ��� ������ ��� ���� ��� TRUE ��ȯ
    OR  : ���� ��� ���� �� �ϳ��� ���� ��� TRUE ��ȯ
    NOT : ������ ������ ��� TRUE�� ��ȯ
*/

-- AND ������ ���(�Ѵ� ��)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%';

-- OR ������ ���(���� �ϳ��� ���̿��� ����)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%';

-- NOT ������ ���
SELECT last_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP'); -- �ش� ���ǿ� ���Ե��� ���� �͸� ��ȸ

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;