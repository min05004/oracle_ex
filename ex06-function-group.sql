/*
������ �׷� �Լ�
    AVG() - ���
    MAX() - �ִ밪
    MIN() - �ּҰ�
    SUM() - �հ�
    
*/

SELECT AVG(salary) AS avg_salary,
        MAX(salary) AS max_salary,
        MIN(salary) AS min_salary,
        SUM(salary) AS sum_salary
FROM employees
WHERE job_id LIKE '%REP%';

--COUNT() �Լ� NULL���� �ƴ� ��� ���� ������ ��ȯ.
SELECT COUNT(*) AS totsl_employees
from employees
where department_id = 50;

-- null ���� ���ԵǾ� ������ ī��Ʈ�� �ȵ�. NVL()����ϸ� ī��Ʈ ��.
SELECT COUNT(commission_pct)AS non_null_commiission_count
FROM employees
WHERE department_id =50;

-- COUNT(DISTINCT expr) �� Ư�� ǥ������ �������� �ߺ��� ������ ���� ���� ��ȯ
SELECT COUNT(DISTINCT department_id) AS distinct_department_count
FROM employees;

--�׻�from�� �� üũ!!! ��� ���̺����� -> ���� -> �ش�Ǵ� �÷� ��ȸ


-- NVL�Լ��� Ȱ���Ͽ� null ���� �ٸ� ������ ��ü�� �� AVG() �Լ� ���.
SElECT AVG(NVL(commission_pct,0)) AS avg_commission
FROM employees;


/*
Group By
    ���� ���� ������ �÷� �������� �׷�ȭ �Ͽ� ���� �Լ��� �����ϱ� ���� ����
HAVING
    GRUOP BY �� �Բ� ���Ǹ� ,�׷�ȭ�� ����� ������ ������ �� ���˴ϴ�.
    
    WHER - �������� ����
    HAVING - �׷��� ����


*/

-- �μ��� ��� �޿��� ���մϴ�.
SELECT department_id,AVG(salary)as avg_salry
FROM employees
GROUP BY department_id;

-- GROUP BY ������ ���� ���� �������� �׷�ȭ �մϴ�.
SELECT department_id,job_id,SUM(salary) as total_salary -- 4��
FROM employees --1��
WHERE department_id > 40 --�μ���ȣ�� 40�� �ʰ��� ��� ��ȸ. 2��
GROUP BY department_id, job_id --�μ� �ȿ��� �׷��ѹ�,�� �ȿ��� �� ���̵�� �׷� , 3��
ORDER BY department_id ASC;


--HAVING �� ���
--�μ��� �ִ� �޿��� 10000���� ū �μ��� ã���ϴ�.
SELECT department_id, MAX(salary) as max_salary
FROM employees
--WHERE salary >10000 ���� ���̻� ���� ���� �߸��� �׷�ȭ �ص� ��� ���� ����.
GROUP BY department_id -- �μ���ȣ�� �׷�
HAVING MAX(salary) > 10000; -- �׷�ȰͿ� ������ �ɾ���.

--������ �� �޿��� 13000���� ū ������ ã���ϴ�.

SELECT job_id, SUM(salary) as total_salary
FROM employees
GROUP BY job_id
HAVING SUM (salary) >13000
ORDER BY total_salary;

-- �׷��Լ� �Լ���ø ����
SELECT department_id,(AVG(salary))as max_avg_salary
FROM employees
GROUP BY department_id


