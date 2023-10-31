/*
���� ������
    ���� ���̺� �Ǵ� ������ ����� �����ϰ� �����ϴ� ������
    select ����Ʈ�� ǥ������ �÷� ������  ��ġ�ؾ� �մϴ�.
    ������ ������ ��ġ�ؾ� �մϴ�.
    �÷��� ���� Ÿ���� ���ƾ� �� : DESC employees �� Ȯ���غ���
    
UNION , UNION ALL , INTERSECT, MINUS

*/

-- UNION ������ : �ΰ��� ������ ��ġ��, �ߺ��� ���� �����մϴ�. 
-- join�� �ٸ� ���� ���ΰ� �ƴ� ���η� ������.
SELECT employee_id, job_id
FROM employees
UNION -- ���� ������ �ߺ��� ����.
SELECT employee_id,job_id
FROM job_history
ORDER BY employee_id;

--UNION ALL ������ : �ΰ��� ���� ����� ��ġ�� , �ߺ��� �� ���� ��� ��ȯ.
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history
ORDER BY employee_id;

-- INTERSECT ������ : �ΰ� ���� ��� �߿��� ����� �ุ ��ȯ (������)
-- join���� ���� ����� �����غ���
SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

-- MINUS ������ : ù��° ���� ��� �߿��� �ι�° ���� ����� �������� �ʴ� �ุ ��ȯ. (�����ո� ����)
SELECT employee_id,job_id
FROM employees
MINUS
SELECT employee_id,job_id
FROM job_history;


-- ������ ���� ��ġ���Ѿ� �մϴ�.(�� ���� ����ٴ� �ǹ�, Ÿ��(����,����..)�� �� ����� ��)
SELECT location_id,department_name AS "Department", TO_CHAR(NULL)"Warehouse location"
FROM departments
UNION
SELECT location_id,TO_CHAR(NULL) AS "Department", state_province
FROM locations;

DESC employees;

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id = 60
UNION ALL 
SELECT 108, 'KIM', 60 
FROM dual
;