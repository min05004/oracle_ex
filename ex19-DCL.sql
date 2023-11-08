/*
DCL - data control language
���̺� �����͸� ������ �� �ʿ��� ������ �����ϴ� ��ɾ�

���� Ű����
    connect : �����ͺ��̽��� �����ϴ� ������ �����մϴ�.
    resouce : ���̺� ������ ���ν��� ���� ������ �� �ִ� ���� �ο��մϴ�.
    alter,drop : ��ü ���� �Ǵ� ���� ������ �����մϴ�.
    DBA : �����ͺ��̽� �����ڷμ� �ý����� ������ �� �ִ� ������ �ο��մϴ�.

*/

ALTER SESSION SET "_ORACLE_SCRIPT" = true;

--����� �����ϱ� , scott /  tiger  ���� ����
CREATE USER scott IDENTIFIED BY tiger;  -- tiger (���)

-- GRANT ���� �����ֱ�
GRANT CREATE SESSION TO scott; -- ����Ŭ 11g����
GRANT CONNECT TO scott; -- ���� ����ȣȯ ����

-- revoke ���ӱ��� ���� �ϱ�
REVOKE CREATE SESSION FROM scott; -- ���̻� scott���� ���� �Ұ�.
REVOKE CONNECT FROM scott;

-- object �����ֱ� : �Ʒ� �ش��ϴ� ������� ����� ������ ������ ��.
GRANT CREATE SEQUENCE TO scott;
GRANT CREATE SYNONYM TO scott;
GRANT CREATE TABLE TO scott;
GRANT CREATE PROCEDURE TO scott;
GRANT CREATE VIEW TO scott;

-- ��� �����ֱ�
GRANT CONNECT, DBA , RESOURCE TO scott; -- �ǹ������� �׽�Ʈ�����θ�!

-- ��� ���� ����
REVOKE CONNECT , DBA , RESOURCE FROM scott;

-- ����� ��й�ȣ ����
ALTER USER scott IDENTIFIED BY tiger2 ;

-- ����ڿ��� select ���� �ο�
GRANT SELECT ON employees TO scott;
GRANT INSERT ON orders TO scott;
GRANT UPDATE ON products TO scott;
GRANT DELETE ON customers TO scott;

-- ��� ���̺� ���� DML ���Ѻο�
--GRANT SELECT, INSERT ,UPDATE , DELETE ON hr.|| table_name ||' TO scott;'
from all_tables
where owner = 'HR'


/*
ROLE - ���ѱ׷�
*/

-- ROLE ����
CREATE ROLE role01;

-- role ���Ѻο�
GRANT CREATE session , CREATE TABLE , INSERT ANY TABLE TO role01;

-- ����ڿ��� role �ο�

GRANT role01 TO scott;
REVOKE role01 FROM scott; -- ����

-- ����� �����ϱ�
DROP USER scott; -- ��������
DROP USER scott CASCADE; --����� �κ� ��� ����
