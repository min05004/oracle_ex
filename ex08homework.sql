-- 1. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ������ ��(last_name) ��ȸ�ϱ�
SELECT e.employee_id,e.last_name,d.manager_id,d.last_name AS manager_last_name
FROM employees e JOIN employees d
ON e.manager_id = d.manager_id;

-- 2. �� ������ ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT e.last_name,d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
ORDER BY department_name;

-- 3. �� �μ��� �̸�(department_name)�� �ش� �μ��� ��� �޿�(avg_salary) ��ȸ�ϱ�
--�μ��� ��ձ޿� ���ϱ�
/* SELECT department_id,AVG(salary)
FROM employees
GROUP BY department_id*/
-- �� ����� �μ� ���̵� �μ��� ����
SELECT d.department_name,AVG(e.salary)as AVG_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;


/*SELECT e.avg_salary,d.department_name
FROM (SELECT AVG(salary)as avg_salry FROM employees group by department_id)
e JOIN departments d
ON e.avg_salary = d.department_name;*/


-- 4. �� �μ��� �̸�(department_name)�� �ش� �μ��� �ִ� �޿�(max_salary) ��ȸ�ϱ�
SELECT d.department_name, MAX(e.salary) AS MAX_SALARY
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
;