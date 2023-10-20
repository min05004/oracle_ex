-- 1. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ������ ��(last_name) ��ȸ�ϱ�

SELECT e.employee_id,e.last_name,d.manager_id
FROM employees e JOIN departments d
ON e.manager_id = d.manager_id;
-- ���� �Ŵ����� ������ ��..?

-- 2. �� ������ ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT e.last_name,e.employee_id,d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 3. �� �μ��� �̸�(department_name)�� �ش� �μ��� ��� �޿�(avg_salary) ��ȸ�ϱ�
--�μ��� ��ձ޿� ���ϱ�
/* SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id*/
-- �� ����� �μ� ���̵� �μ��� ����
SELECT *
FROM (SELECT department_id,AVG(salary) FROM employees GROUP BY department_id)e
JOIN departments d
ON e.department_id = d.department_id;


/*SELECT e.avg_salary,d.department_name
FROM (SELECT AVG(salary)as avg_salry FROM employees group by department_id)
e JOIN departments d
ON e.avg_salary = d.department_name;*/




-- 4. �� �μ��� �̸�(department_name)�� �ش� �μ��� �ִ� �޿�(max_salary) ��ȸ�ϱ�
SELECT d.department_name,s.max_salary
from job_history j JOIN  departments d
ON j.department_id = d.department_id
JOIN jobs s
ON s.job_id = j.job_id;