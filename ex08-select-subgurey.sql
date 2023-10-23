/*
subquery ����
    select ���� ���ԵǴ� select �� �Դϴ�.


*/

-- ������ �������� - ��Į�� ��������
SELECT last_name,salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name ='Abel'); -- abel ���� �޿� ���� �޴� ���

-- subguery ���� �׷��Լ� ���
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

/*
������ ���� ���� - �ο� ��������.���̺� ��������
    IN
        ����Ʈ�� ���� ����� ����
    ANY
        = ,<>,>,<,<=,>= �����ڰ� �տ� �־�� �մϴ�.
        < ANY �� �ִ밪���� ������ �ǹ��մϴ�.
        > ANY �� �ּڰ����� ŭ�� �ǹ��մϴ�.
        = ANY �� IN�� �����ϴ�.
        
    ALL
        > ALL �� �ִ밪���� ŭ�� �ǹ�
        > ALL �� �ּڰ����� ������ �ǹ�
        
*/
--() �� ���ǿ� �ش�Ǵ� ��� ��ȸ
SELECT employee_id,last_name,salary,job_id
FROM employees
WHERE salary IN (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
-- 9000,6000,4800,4200�� �ش�Ǵ� �� ��ȸ.or���� ����
AND job_id <> 'IT_PROG';

SELECT employee_id,last_name,salary,job_id
FROM employees
WHERE salary <ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
-- �ش� �޿��� �ִ밪���� ���� (9000�̸�)
AND job_id <> 'IT_PROG';


SELECT employee_id,last_name,salary,job_id
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';


/*
EXISTS ������
    ������������ �ּ��� �� ���� ���� ��ȯ�ϸ� true�� ��
    ��ȸ�ؼ� �ϳ��� ã���� �� �������� ã���ʾ� �ӵ��� ���� - ���� ����
    
*/
-- ��� ��������
SELECT * FROM departments -- 1�� ��ȸ / �μ����̺��� ����ҰǴ� () �� ������
WHERE NOT EXISTS -- not�� ������ �����Ǽ� ���� ��ȯ
    (SELECT * FROM employees
    WHERE employees.department_id = departments.department_id);


SELECT * FROM departments
WHERE department_id NOT IN
    (SELECT department_id FROM employees
    WHERE employees.department_id = departments.department_id);
    -- ���� ������ ��
    
/*
���������� NULL ��.
     ��ȯ�Ǵ� �� �� �ϳ��� null�̸� ��ü ������ ���� ��ȯ���� �ʽ��ϴ�.
     nill ���� ���ϴ� ��� ������ ����� null�̱� ����.
    
*/

SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN
        (SELECT mgr.manager_id FROM employees mgr
        WHERE mgr.manager_id IS NOT NULL);
        -- �Ŵ����� �ƴ� ����鸸 ����.
        --null ���� �������� ������ ����.
        
/*
�ζ��� �� ��������(inline view subquery)
    ���������� �ӽ� ���̺� ��� ����ϴ� ��������
*/
SELECT e.employee_id,e.last_name,d.department_name,d.department_id
FROM employees e
JOIN (SELECT department_id,department_name 
                FROM departments
                 WHERE department_id <50)d -- ������ ���������� ��
ON e.department_id = d.department_id;

-- ��Į��
