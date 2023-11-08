/*
������ ��ųʸ�?
    ������ ��ųʸ��� ������ ���̽� ������ ��Ÿ�����͸� �����ϴ� �ý��� ���̺�� ���� �����Դϴ�.
    �̸� ���� �����ͺ��̽� ��ü�� �Ӽ��� ���� ������ ��ȸ�ϰ�
    ����͸��� �� �ֽ��ϴ�.
    
    USER_: ���� ������� ��Ű���� ���� ������ �����ϴ� ���Դϴ�.
    ALL_: ���� ����ڰ� ���� ������ ��� ��Ű���� ������ �����ϴ� ���Դϴ�.
    DBA_: �����ͺ��̽��� ��� ��ü�� ���� ������ �����ϴ� ���,
        DBA(�����ͺ��̽� ������) ������ �ִ� ����ڸ� ������ �� �ֽ��ϴ�.

*/

-- user_tables : ���� ������� ���̺� ���� ��ȸ
select table_name,num_rows
from user_tables;

-- user_views: ���� ������� �� ���� ��ȸ
SELECT view_name, text
FROM user_views; -- �信 ���� �ؽ�Ʈ ���� ��ȸ.(����)

--all_table : ��� ����ڰ� ���� ������ ���̺� ���� ��ȸ
SELECT owner,table_name,num_rows
FROM all_tables 
WHERE owner NOT IN ('SYS', 'SYSTEM');

-- all_inadex : ��� ����ڰ� ���� ������ �ε��� ���� ��ȸ
SELECT owner, index_name, table_name
from all_indexes
WHERE owner NOT IN ('SYS','SYSTEM');


--dba_tables :������ ���̽��� ��� ���̺� ���� ��ȸ(dba���� �ʿ�)
SELECT owner, table_name, num_rows
FROM dba_tables
WHERE owner = 'HR'; -- HR�� �����ϰ� �ִ� ���̺� ��ȸ


/*
���ɺ� (Dynamic Performance View)
    ����Ŭ instance�� �۾� �� ���ɿ� ���� ����͸�, ���� ���� ���� ���Դϴ�. 
*/
-- v$instance: ���� �ν��Ͻ� ���� ��ȸ ( �����ϰ� �ִ� )
SELECT instance_name, instance_number, status, host_name
FROM v$instance;
-- v$session: ���� ���� ��ȸ 
SELECT sid, serial#, username, status, program
FROM v$session;
-- v$sysstat: �ý��� ��� ���� ��ȸ
SELECT name, value
FROM v$sysstat
WHERE name LIKE 'user commits' OR name LIKE 'user rollbacks';
-- v$version: Oracle ���� ���� ��ȸ
SELECT banner
FROM v$version
WHERE banner LIKE 'Oracle%';
-- v$process: ���μ��� ���� ��ȸ
SELECT *
FROM v$process;
-- v$lock: �� ���� ��ȸ
SELECT *
FROM v$lock
WHERE block = 1;
-- v$event_name: ��� ���� �̺�Ʈ ���� ��ȸ
SELECT event#, name
FROM v$event_name;
-- v$open_cursor: ���� �ִ� Ŀ�� ���� ��ȸ
SELECT *
FROM v$open_cursor
WHERE user_name IS NOT NULL;
-- v$system_parameter: �ý��� �Ķ���� ���� ��ȸ
SELECT name, value
FROM v$system_parameter
WHERE name LIKE 'buffer_cache%' OR name LIKE 'processes%';
-- v$parameter: �Ķ���� ���� ��ȸ
SELECT name, value
FROM v$parameter
WHERE name LIKE 'db_block_size' OR name LIKE 'open_cursors';
-- v$option: ����Ŭ �ɼ� �� ���� ���� ��ȸ
SELECT * FROM v$option;
-- v$sql: SQL ���� ���� ��ȸ
SELECT sql_id, sql_text
FROM v$sql
WHERE parsing_schema_name = 'HR' AND command_type = 3;
-- v$sqlarea: SQL ���� ���� ��ȸ
SELECT sql_id, executions, buffer_gets, disk_reads
FROM v$sqlarea
WHERE buffer_gets > 10000;


SELECT
  a.sid,       -- SID
  a.serial#,   -- �ø����ȣ
  a.status,    -- ��������
  a.process,   -- ���μ�������
  a.username,  -- ����
  a.osuser,    -- �������� OS ����� ����
  b.sql_text,  -- sql
  c.program    -- ���� ���α׷�
FROM
  v$session a,
  v$sqlarea b,
  v$process c
WHERE
  a.sql_hash_value=b.hash_value
  AND a.sql_address=b.address
  AND a.paddr=c.addr
  AND a.status='ACTIVE'; -- � ������ Ȱ�������� Ȯ��
  
  --���� ���� kill 
ALTER SYSTEM KILL SESSION 'SID,�ø����ȣ';  -- Ȱ�� ���� ������ �ߴ� ��ų�� ����.

