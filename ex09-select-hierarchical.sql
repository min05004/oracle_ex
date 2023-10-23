/*
계층 쿼리
    트리구조를 가지는 데이터에서 부모-자식 관계를 쉽게 쿼리하는데
    사용되는 sql.
    주로 조직도 ,계층적 데이터,계층적 주소 등에 활용됩니다.
    
관련 키워드
    START WITH : 계층쿼리의 시작 지점을 지정합니다. 최상위 부모 노드를 선택합니다/
    CONNECT BY : 부모- 자식 관계를 설정하는 키워드로, PRIOR 키워드와 함께 사용.
    PRIOR : 부모- 자식 관계를 표현하는 키워드로 자식 칼럼 앞에 사용.
    LEVEL : 각 레벨의 깊이를 나타내는 의사 칼럼으로 사용.
    SYS_CONNECT_BY_PATH : 계층 구조의 경로를 문자열로 표현해주는 함수.
    ORDER SIBLINGS BY : 형제 노드들을 정렬하는데 사용

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
ORDER SIBLINGS BY e.employee_id; -- 사원 아이디로 정렬 
    