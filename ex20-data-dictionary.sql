/*
데이터 딕셔너리?
    데이터 딕셔너리는 데이터 베이스 내부의 메타데이터를 관리하는 시스템 테이블과 뷰의 집합입니다.
    이를 통해 데이터베이스 객체와 속성에 대한 정보를 조회하고
    모니터링할 수 있습니다.
    
    USER_: 현재 사용자의 스키마에 대한 정보만 포함하는 뷰입니다.
    ALL_: 현재 사용자가 접근 가능한 모든 스키마의 정보를 포함하는 뷰입니다.
    DBA_: 데이터베이스의 모든 객체에 대한 정보를 포함하는 뷰로,
        DBA(데이터베이스 관리자) 권한이 있는 사용자만 접근할 수 있습니다.

*/

-- user_tables : 현재 사용자의 테이블 정보 조회
select table_name,num_rows
from user_tables;

-- user_views: 현재 사용자의 뷰 정보 조회
SELECT view_name, text
FROM user_views; -- 뷰에 대한 텍스트 정보 조회.(쿼리)

--all_table : 모든 사용자가 접근 가능한 테이블 정보 조회
SELECT owner,table_name,num_rows
FROM all_tables 
WHERE owner NOT IN ('SYS', 'SYSTEM');

-- all_inadex : 모든 사용자가 접근 가능한 인덱스 정보 조회
SELECT owner, index_name, table_name
from all_indexes
WHERE owner NOT IN ('SYS','SYSTEM');


--dba_tables :데이터 베이스의 모든 테이블 정보 조회(dba권한 필요)
SELECT owner, table_name, num_rows
FROM dba_tables
WHERE owner = 'HR'; -- HR이 소유하고 있는 테이블 조회


/*
성능뷰 (Dynamic Performance View)
    오라클 instance의 작업 및 성능에 대한 모니터링, 감사 등을 위한 뷰입니다. 
*/
-- v$instance: 현재 인스턴스 정보 조회 ( 실행하고 있는 )
SELECT instance_name, instance_number, status, host_name
FROM v$instance;
-- v$session: 세션 정보 조회 
SELECT sid, serial#, username, status, program
FROM v$session;
-- v$sysstat: 시스템 통계 정보 조회
SELECT name, value
FROM v$sysstat
WHERE name LIKE 'user commits' OR name LIKE 'user rollbacks';
-- v$version: Oracle 버전 정보 조회
SELECT banner
FROM v$version
WHERE banner LIKE 'Oracle%';
-- v$process: 프로세스 정보 조회
SELECT *
FROM v$process;
-- v$lock: 락 정보 조회
SELECT *
FROM v$lock
WHERE block = 1;
-- v$event_name: 대기 중인 이벤트 정보 조회
SELECT event#, name
FROM v$event_name;
-- v$open_cursor: 열려 있는 커서 정보 조회
SELECT *
FROM v$open_cursor
WHERE user_name IS NOT NULL;
-- v$system_parameter: 시스템 파라미터 정보 조회
SELECT name, value
FROM v$system_parameter
WHERE name LIKE 'buffer_cache%' OR name LIKE 'processes%';
-- v$parameter: 파라미터 정보 조회
SELECT name, value
FROM v$parameter
WHERE name LIKE 'db_block_size' OR name LIKE 'open_cursors';
-- v$option: 오라클 옵션 및 버전 정보 조회
SELECT * FROM v$option;
-- v$sql: SQL 문장 정보 조회
SELECT sql_id, sql_text
FROM v$sql
WHERE parsing_schema_name = 'HR' AND command_type = 3;
-- v$sqlarea: SQL 영역 정보 조회
SELECT sql_id, executions, buffer_gets, disk_reads
FROM v$sqlarea
WHERE buffer_gets > 10000;


SELECT
  a.sid,       -- SID
  a.serial#,   -- 시리얼번호
  a.status,    -- 상태정보
  a.process,   -- 프로세스정보
  a.username,  -- 유저
  a.osuser,    -- 접속자의 OS 사용자 정보
  b.sql_text,  -- sql
  c.program    -- 접속 프로그램
FROM
  v$session a,
  v$sqlarea b,
  v$process c
WHERE
  a.sql_hash_value=b.hash_value
  AND a.sql_address=b.address
  AND a.paddr=c.addr
  AND a.status='ACTIVE'; -- 어떤 세션이 활동중인지 확인
  
  --유저 세션 kill 
ALTER SYSTEM KILL SESSION 'SID,시리얼번호';  -- 활동 중인 세션을 중단 시킬수 있음.

