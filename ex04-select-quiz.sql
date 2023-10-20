/*
1. "employees" ���̺��� ��� �������� ��(last_name), �̸�(first_name)�� �޿�(salary)�� ��ȸ�ϼ���.
    
2. "employees" ���̺��� �޿�(salary)�� 5000 �̻��� �������� �̸�(first_name)�� �޿�(salary)�� ��ȸ�ϼ���.

3. "employees" ���̺��� �ٹ� ������(hire_date)�� 2005�� ������ �������� �̸�(first_name)�� 
    �ٹ� ������(hire_date)�� ��ȸ�ϼ���.
    
*/
--1��
SELECT last_name,first_name,salary
FROM employees ;
--2��
SELECT first_name,salary
from employees
WHERE salary >= 5000;
--3��
SELECT first_name,hire_date
FROM employees
WHERE hire_date >= TO_DATE('2005-01-01','YYYY-MM-DD') -- to date �������� ���!
ORDER BY hire_date;


