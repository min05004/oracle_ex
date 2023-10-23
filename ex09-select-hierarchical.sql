/*
���� ����
    Ʈ�������� ������ �����Ϳ��� �θ�-�ڽ� ���踦 ���� �����ϴµ�
    ���Ǵ� sql.
    �ַ� ������ ,������ ������,������ �ּ� � Ȱ��˴ϴ�.
    
���� Ű����
    START WITH : ���������� ���� ������ �����մϴ�. �ֻ��� �θ� ��带 �����մϴ�/
    CONNECT BY : �θ�- �ڽ� ���踦 �����ϴ� Ű�����, PRIOR Ű����� �Բ� ���.
    PRIOR : �θ�- �ڽ� ���踦 ǥ���ϴ� Ű����� �ڽ� Į�� �տ� ���.
    LEVEL : �� ������ ���̸� ��Ÿ���� �ǻ� Į������ ���.
    SYS_CONNECT_BY_PATH : ���� ������ ��θ� ���ڿ��� ǥ�����ִ� �Լ�.
    ORDER SIBLINGS BY : ���� ������ �����ϴµ� ���

*/
SELECT
    e.employee_id,
    e.last_name,
    e.manager_id,
    LEVEL AS depth,
    LPAD(' ', LEVEL*2-2) || SYS_CONNECT_BY_PATH(e.last_name,'/') AS hierarchy_path
FROM employees e
STARt WITH
    E.MANAGER_ID is null
CONNECT BY
     PRIOR e.employee_id = e.manager_id
ORDER SIBLINGS BY e.employee_id; -- ��� ���̵�� ���� 
    