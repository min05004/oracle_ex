/*
ORDER BY ��
    ORDER BY ���� ����Ͽ� �˻��� ���� �����մϴ�.
        ASC : ��������, �⺻��(������ ����. �Ⱦ��� �⺻ ��������)
        DESC : ��������
    SELECT ���� �� �������� �ɴϴ�.
    
    ������ ���̽����� �ڷḦ ���� ó���ϰ� �����͸� �������°��� ����
*/

SELECT last_name, job_id , department_id , hire_date
FROM employees
ORDER BY hire_date;

--�������� ����
SELECT last_name,job_id,department_id , hire_date
FROM employees
ORDER BY hire_date DESC;

-- �� alias �������� ����
SELECT last_name,job_id,department_id , salary*12 annsal
FROM employees
ORDER BY annsal;


-- �� ���� ��ġ�� ����Ͽ� ����
SELECT last_name,job_id,department_id , hire_date
FROM employees
ORDER BY 3; -- �÷� �Ӽ����� ����* depardepartment_id

-- ���� ���� �������� ����
SELECT last_name,job_id,department_id ,salary
FROM employees
ORDER BY department_id,salary DESC; -- �μ� ���̵� ���� -> �ߺ� �� ��� �������� ����



