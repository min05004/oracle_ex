/*
-- 한줄주석 
/*
파일명: ex01-select.sql

SQL (Structured Query Language)
    관계형 데이터 베이스 시스템에서 자료 관리 및 처리하기 위해 설계된 언어

SELECT 문
    데이터베이스에서 정보 검색 명령어
*/

-- 모든 열 선택 *
SELECT * 
FROM departments;

-- 특정 열 선택 (프로젝션 Projection)
SELECT department_id, location_id
FROM departments;

/* 
산술식
    산술연산자를 사용하여 숫자/날짜 데이터 표현식 작성

    + 더하기
    - 빼기
    * 곱하기
    / 나누기

*/
-- 산술연산자 사용
SELECT 
    last_name,
    salary,
    salary + 300
FROM employees; 

/*
연산자 우선순위
    곱하기와 나누기는 더하기 빼기보다 먼저 수행
*/
SELECT last_name, salary, 12*salary+100
FROM employees;

SELECT last_name, salary, 12*(salary+100)
FROM employees;

/*
산술식의 Null 값
    null 값을 포함하는 산술식은 null로 계산
*/
SELECT last_name, 12*salary*commission_pct, 
    salary, commission_pct
FROM employees;

/*
열 alias 정의 - 별명,별칭
    열 머리글의 이름을 바꿉니다.
    열 이름 바로 뒤에 나옵니다. 
    (열 이름과 alias 사이에 선택 사항인 as 키워드가 올수 있습니다.)
    공백이나 특수 문자를 포함하거나 대소문자를 구분하는 경우 큰따옴표가 
    필요합니다.
    실제로 바뀌는건 아니고 조회할 때 머릿글 바뀌어서 조회가 가능함.
*/
SELECT last_name as name, commission_pct, 
    salary * 10 as 급여10배
FROM employees;
--last name 이 name 으로 바뀜,salary 도 

SELECT last_name "Name", salary * 12 "Annual Salary"
FROM employees;
-- as는 생략이 가능함 띄어쓰기만 하면 됨 ,대소문자,특수문자 구분시 ""

/*
연결 연산자
    열이나 문자열을 다른열에 연결합니다.
    두 개의 세로선(||)으로 나타냅니다.
    결과 열로 문자 표현식을 작성 합니다.
*/
SELECT last_name||job_id AS "Employees", last_name, job_id
FROM employees;
 -- employees 안에 두개의 칼럼이 연결이 되서(이어서 작성) 하나의 속성값으로 나옴
/*
리터럴 문자열 = 숫자 문자 날짜 등 
    리터럴은 SELECT 문에 포함된 문자, 숫자 또는 날짜 입니다.
    날짜 및 문자 리터럴 값은 작은 따옴표로 묶어야 합니다.
    각 문자열은 반환되는 각 행에 한번에 출력됩니다.
*/
SELECT last_name || ' is a ' || job_id AS "Employee Details"
FROM employees;
-- 라스트 네임에  is a 가 붙어서 조회가 됨. 

/* 
대체 인용(q) 연산자
    자신의 따옴표 구분자를 지정합니다.
    구분자를 임의로 선택합니다.
    가독성 및 사용성이 증가합니다.
*/
SELECT department_name || q'[ Department's Manager id: ]' 
        || manager_id AS "Department and Manager"
FROM departments;
-- 부서 이름 , 뒤에 리터럴 과 매니저 아니디까지 연결해서 조회
-- 문자열 안에 '(홀따음표) 사용시 오류 , 대체문자 q[]안에 모든 글자는 문자열로 인식.

/*
중복행 
    기본적으로 Query 결과에는 중복 행을 포함한 모든행이 표시됩니다.
    DISTINCT 를 사용하여 중복행 제거 할 수 있습니다.
*/
SELECT department_id 
FROM employees;
-- 사원 테이블에 부서명 조회 

-- 중복제거
SELECT DISTINCT department_id
FROM employees;
-- 사원에서도 부서번호가 없는 사원이 있을수도 있음(null)

/*
테이블 구조표시
    DESCRIBE 명령을 사용하여 테이블 구조를 표시합니다.
*/
DESCRIBE employees;
DESC employees; -- 위랑 동일 간략화
-- 테이블에 대한 스키마가 조회 , 이름 = 속성/not null 필수값 빈 값은 못 넣음/ 유형 - 숫자,문자열(btte)
-- (8,2 - 소수점 2자리까지)





