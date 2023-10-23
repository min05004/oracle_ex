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


-- ���ο� �߰� ���� ����

SELECT e.employee_id,e.last_name,e.manager_id,e.department_id,
d.department_id,d.location_id
FROM employees e JOIN departments d
on e.department_id = d.department_id
AND e.manager_id =149
JOIN locations l
ON d.location_id = l.location_id;

/*
���̺� ��ü ����
      on���� ����ϴ� self join

*/

SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON worker.manager_id = manager.employee_id
;

/*
Nonequijoin
     ��ȣ ������ ���� �ٸ� �����ڸ� �����ϴ� ���� ����

SELECT * FROM job_grades;
INSERT INTO job_grades VALUES ('A',1000,2999);
INSERT INTO job_grades VALUES ('B',3000,5999);
INSERT INTO job_grades VALUES ('C',6000,9999);
INSERT INTO job_grades VALUES ('D',10000,14999);
INSERT INTO job_grades VALUES ('E',15000,24999);
INSERT INTO job_grades VALUES ('F',25000,40000);

COMMIT;
*/

CREATE TABLE job_grades (
grade_level CHAR(1),
lowest_sal NUMBER(8,2) NOT NULL, -- �����͸� ������ ���� �ȵ�(NOT NULL)
highest_sal NUMBER(8,2) NOT NULL);

SELECT * FROM job_grades;

SELECT e.last_name,e.salary,j.grade_level
FROM employees e JOIN job_grades j
ON e.salary BETWEEN j.lowest_sal AND j.highest_sal;

/*
INNER JOIN  / OUTER JOIN
    INNER JOIN
    ��ġ���� �ʴ� ���� ��¿� ǥ�õ��� �ʽ��ϴ�.
    (������ �ش� ���)
    
    OUTER JOIN 
    �� ���̺��� ���� ������� �ٸ� ���̺���� ������ ���� ����� �����Ͽ� ��ȯ�մϴ�.
    

*/
/*
LEFT OUTER JOIN
    DEPARTMENTS ���̺� �����Ǵ� ���� ��� 
    ���� ���̺��� EMPLOYEES ���̺��� ��� ���� �˻��մϴ�.

*/
SELECT e.last_name, e.department_id , d.department_name
FROM employees e LEFT OUTER JOIN departments d  -- ���� ���̺��� ���� (from ��������)������̺� ��ü + ����� �ش�Ǵ� �μ� ��Ī�� ��.
ON e.department_id = d.department_id;

/*
RIGHT OUTER JOIN
    *���ɻ� left �� �� ����...!
    employees ���̺� �����Ǵ� ���� ��� ������ ���̺��� departments ���̺��� ������� �˻�.
*/

SELECT e.last_name,d.department_id,d.department_name
FROM employees e RIGHT OUTER JOIN departments d -- ����� ���� �μ����� �� ����.
ON e.department_id = d.department_id;

SELECT e.last_name,d.department_id,d.department_name
FROM employees e, departments d 
WHERE e.department_id = d.department_id(+); -- (+) �� ��� �ִ��Ŀ� ���� LEFT,RIGHT �޶���.


/*
FULL OUTER JOIN
    DEPARTMENT, EMPLOYEES �����Ǵ� ���� ���
    ���̺��� ������� �˻��մϴ�.

*/
SELECT e.last_name,d.department_id,d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;  -- �� ���̺��� ���� �� ����.

/*
Cartesian product
    ���� ������ �߸���ų� ������ ������ ��� ����� ������� ������ ǥ�õǴ�
    Cartesian product�� ��Ÿ���ϴ�.
*/
SELECT last_name, department_name
FROM employees
CROSS JOIN departments; -- ��� ����� �� �� ����.


