/*
****�߿�****
JOIN
    SQL���� �ΰ� �̻��� ���̺��� ���õ� ����� �����ϱ� ���� ����.

*/
/*NATURAL JOIN 
�� ���̺��� ������ ������ �̸��� ��ġ�ϴ� ���� ������� �ڵ�����
���̺��� ������ �� �ֽ��ϴ�.*/
SELECT department_id, department_name,
        location_id, city
FROM departments -- departments ������ city�� ��ȸ�ȵ�.
NATURAL JOIN locations; -- city�� ��ȸ�ϱ� ���� ,2���� ���̺�(locations)�� ����.

/*
USING ���� ����
    ��������� ������ �����ϰ��� �ϴ� ���� �����ݴϴ�.
*/
SELECT employee_id, last_name,location_id,department_id, department_name
FROM employees JOIN departments -- ������̺�� �μ����̺��� ����.
USING (department_id);

/*
ON ���� ����
    ON ���� ����Ͽ� ���� ������ �����մϴ�.
    �÷����� �ٸ� ��� ,
*/
SELECT e.employee_id,e.last_name,
        e.department_id, d.department_name, d.location_id
FROM employees e JOIN departments d
--��� ���̺� ��Ī e / �μ����̺� ��Ī d
ON e.department_id = d.department_id;
-- ������̺��� �μ����̵��, �μ����̺��� �μ����̵� �μ����̵�� ����.
--ǥ��
SELECT e.employee_id, e.last_name,
    e.department_id , d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;
-- ������ ��.����Ŭ�� ����

-- ON �� Ȱ���Ͽ� 3-WAY����
SELECT e.employee_id, e.last_name, e.first_name,
    d.department_name, l.city
FROM employees e 
JOIN departments d 
ON e.department_id = d.department_id  --����� �μ����̺�  �μ����̵�� ����
-- �ϳ��� Ŀ���� ���� ( �� ������ ������ �Ǵٰ� ����)
JOIN locations l
ON d.location_id =l.location_id; -- �μ����̺�, ��ġ ���̺� ��ġ���̵�ο���