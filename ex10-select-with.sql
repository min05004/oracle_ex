/*
with ��
    WITH ���� �������� ����� �ӽ÷� �����ϰ� ����� �� �ִ� ���.
    �������̺� ǥ���� CTE(common table expression)
    
    �ַ� ������ ������ �����ϰ� �ۼ��ϰų� �������� ���̴µ� Ȱ��˴ϴ�.
    

*/

-- �μ��� ��� �޿��� ����ϴ� ����
WITH AvgSalByDept As (
    SELECT
        department_id,
        AVG(salary)AS avgsalary
    FROM employees
    GROUP BY department_id) -- with �� �ȿ� ������:  AvgSalByDept ���̺��� ����
    
SELECT d.department_name, AvgSalByDept.avgsalary
FROM departments d
JOIN AvgSalByDept
ON d.department_id = AvgSalByDept.department_id
AND d.department_id =10;


-- with ���� ���� ǥ��
WITH RecursiveCTE (id,name,manager_id,depth) AS ( -- RecursiveCTE �÷�  �����
    SELECT employee_id, last_name, manager_id , 1 -- RecursiveCTE �÷� �ȿ� �� �ֱ�
    FROM employees
    WHERE manager_id IS NULL -- ȣ���� �� ó�� ����Ǵ� ����,
    UNION ALL -- �Ʒ� ������ ������
    SELECT e.employee_id, e.last_name, e.manager_id, rc.depth +1
    FROM employees e
    INNER JOIN RecursiveCTE rc ON e.manager_id = rc.id)
    -- �ӽ� ���̺�
SELECT id,name,manager_id,depth
FROM RecursiveCTE;
-- ȣ�� 