/*
함수 (function)
    매개변수(인자) 를 받아 특정 계상(작업)을 수행하고 
    결과를 반환하는 구조로 되어 있다.
    
함수 유형
    단일행 함수 - 단일행 매개변수를 받아 결과 값 반환
    여러행(그룹) 함수 -여러행 매개변수를 받아 결과 값 반환
*/

--단일행 함수
--대소문자 변환 함수
--LOWER()함수 문자열을 소문자로 반환

SELECT employee_id,last_name,department_id
FROM employees
WHERE LOWER(last_name)='higgins'; -- 모든 라스트 네임을 비교해서 좀 더 비효율적

--UPPER() 함수 문자열을 대문자로 변환.
SELECT UPPER('higgins') FROM dual; --임시로 만든 dual

---INITCAP() 함수 문자열의 첫 글자를 대문자로 변환
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name = INITCAP('higgins');

SELECT INITCAP('higgins') FROM dual;

-- 문자 조작 함수
-- concat()함수 두개의 파라미터(매개변수,인자) 값을 연결합니다.
SELECT 'hello'|| 'world' FROM dual;
SELECT CONCAT('Hello','World') FROM dual;

-- SUBSTR() 지정된 길이의 문자열 추출
-- 타 프로그램은 0번부터~해당번호 전까지 인 경우 헷갈릴수 있음.
SELECT SUBSTR('Helloworld',1,5) FROM dual; -- 1~5번째까지 포함.


--LENGTH() 문자열의 길이를 숫자값으로 표시
SELECT LENGTH ('HelloWorld') FROM dual;

-- INSTR() 문자열에서 지정된 문자의 위치를 찾습니다.
SELECT INSTR('HelliWorld','W') FROM dual;

--LPAD() 왼쪽부터 문자식으로 채운 표현식을 반환합니다.
SELECT LPAD('salary',10,'*') FROM dual; --  숫자 크기만큼 공간이 생김,왼쪽부터 채워짐.

--RPAD() 오른쪽부터 문자식으로 채운 표현식
SELECT RPAD('salary',10,'*') FROM dual; -- 개인정보 마스킹시 사용가능.

--REPLACE() 문자열에서 지정된 문자를 치환합니다.
SELECT REPLACE('JACK and JUE','J','BL') FROM dual; -- J를 BL로 치환

-- TRIM() 문자열에서 선행 또는 후행 문자를 자릅니다.
SELECT TRIM ('H' FROM 'HelloWorld') FROM dual; -- 앞뒤에 해당 글자 있으면 잘라줌.공백없앨때 많이 씀

SELECT TRIM (' ' FROM ' HelloWorld ') FROM dual; 

-- 숫자 함수
-- ROUND() 지정된 소수점 자릿수로 값을 반올림 합니다.

SELECT ROUND(45.926, 2) FROM dual;

--TRUNC() 지정된 소수점 자릿수로 값을 전달합니다.
SELECT TRUNC(45.926, 2) FROM dual;

--MOD() 나눈 나머지를 반환
SELECT MOD(1600, 300) FROM dual;

--CEIL() 주어진 숫자를 올림하여 정수로 반환

SELECT CEIL(45.233) FROM dual;

/*
날짜 연산
    날짜에 숫자를 더하거나 뺴서 결과 날짜 값을 구합니다.
    두 날짜 사이의 일수를 알아내기 위해 뺴기 연산을 합니다.
*/

SELECT sysdate FROM dual; -- 현재 날짜를 가지고 있는 객체

SELECT last_name,(sysdate - hire_date) /7 AS WEEKS -- 현재 날짜에서 입사날짜 빼고 주를 알기위해 7로 나눔.
FROM employees
where department_id =90;

/*
날짜 조작 함수 
    MONTHS_BTWEEN(date1,date2) : 두 날짜 간의 월 수를 계산합니다.
    ADD_MONTHS(date,n) : 날짜에 n개월을 추가 합니다.
    NEXT_DAY(date, day_of_week) :  지정된 날짜 다음으로 주어진 요일이 나오는 날짜를 계산합니다.
    (1: 일요일 ~ 7: 토요일)
    LAST_DAY(date) : 주어진 월의 마지막 날짜를 반환 합니다.
    ROUND(date,format) : 날짜를 지정된 형식으로 반올림합니다.
    TRUNC(date,format) :  날짜를 지정된 형식으로 절삭합니다.
    
*/

SELECT MONTHS_BETWEEN(TO_DATE('2017-12-22','YYYY-MM-DD'),TO_DATE('2017-05-22','YYYY-MM-DD'))
FROM dual;

SELECT ADD_MONTHS(to_date('2022-12-16','YYYY-MM-DD'),8)
from dual;

SELECT NEXT_DAY(TO_DATE('2023-10-16', 'YYYY-MM-DD'),7)
FROM dual;

SELECT LAST_DAY(SYSDATE) FROM dual;

SELECT ROUND(TO_DATE('2023-08-16','YYYY-MM-DD'),'MONTH')
FROM dual;

SELECT TRUNC(TO_DATE('2023-08-16','YYYY-MM-DD'),'MONTH')
FROM dual;


/*
TO_CAR() 함수 - 날짜 또는 숫자를 문자열로 변환
    YYYY 전체 연도 숫자표기
    YEAR 영어 철자로 표기
    MM 월 2자리 숫자 표기
    MONTH 전체 월 이름을 표기
    MON 월의 3자리 약어를 반환
    DY 3자리 요일 약어를 반환
    DAY 요일 전체의 이름을 반환
    HH, HH12 , HH24  1일 동안 시간 또는 반일시간(1-12) 또는 전일시간(0-23)
    
    MI 분(0-59)을 반환
    SS 초(0-59)를 반환
    FF 밀리세컨드 (0-999)를 반환
    AM 또는 PM 오전/오후를 나타내는 자오선 표시 반환
    A.M 또는 P.M  오전 / 오후를 나타내는 마침표가 있는 자오선 표시를 반환
    
    YY - 2000년대 이후 표시
    RR - 49년 까지는 2000년대로 50년대 이후는 1900년대로 표시를 반환합니다.

*/

SELECT last_name, TO_CHAR(hire_date, 'YY/MM/DD HH24:MI:SS') AS HIREDATE
FROM employees;

--TIMESTAMP()  날짜 정보 + 밀리세컨드
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.FF2') FROM dual; 

/*
TO_CHAR() 함수를 숫자에 사용할 때
    9 - 숫자로 나타냅니다.
    0- 0이 표시되도록 강제로 적용합니다.
    $ - 부동 달러 기호로 배치합니다.
    L - 부동 로컬 통화 기호를 사용합니다.
    . - 소수점 출력
    , - 천 단위 표시자 쉼표 출력
*/
SELECT TO_CHAR(salary, 'L99,999.00') SALARY
FROM employees
WHERE last_name = 'Ernst';

-- TO_DATE() 함수 문자열을 DATE 타입으로 반환합니다.
SELECT last_name, TO_CHAR(hire_date,'YYYY_MM_DD') AS HIREDATE
FROM employees
WHERE hire_date < TO_DATE('2005-01-01', 'YYYY-MM-DD')
ORDER BY hire_date; --정렬

/*
함수 중첩
    단일행 함수는 어떠한 레벨로도 중첩될 수 있습니다.
    중첩된 함수는 가장 깊은 레벨에서 가장 낮은 레벨로 평가 됩니다.

*/

SELECT last_name,UPPER(CONCAT(SUBSTR(last_name,1,8),'_US'))
FROM employees
WHERE department_id =60;
-- 사원번호 60번 사람들 중에 라스트 네임 조회를 하는대 1~8번째 글자까지 자르고 concat(연결) _us 하고 전부 대문자.
-- 안에서 부터 차례대로 처리.

--***** MVL() 함수 ***** 중요!
-- NULL값을 실제 지정한 값으로 반환.
--( null이 연산이 안될떄 사용 )

SELECT NVL(null,0) FROM dual; -- 연산도 가능.

SELECT last_name, salary, NVL(commission_pct,0),(salary*12) AS Y_SAL, -- 1년치 급여
(salary*12)+(salary*12 * NVL(commission_pct,0)) AS AN_SAL -- 1년치 급여에 + 상여금
FROM employees;
-- NVL(commission_pct,0) 해당 속성값이 0인 경우 ,0으로 표시 뜻.
-- 보통 0으로 처리하나 ,ai일 경우는 평균값으로 바꿔주기도 함.

-- NVL2() 함수
-- 첫번째 표현식을 검사합니다. 첫번쨰 표현식이 null이 아니면 두번째 표현식을 반환 합니다.
-- 첫번쨰 표현식이 null이면 세번째 표현식이 반환 됩니다.

SELECT last_name,salary,commission_pct,
NVL2(commission_pct,'SAL_COM','SAL') AS income
FROM employees
WHERE department_id IN(50,80);

-- NULLIF() 함수
-- 두 표현식을 비교하고 같으면  null반환 다르면 exprl을 반환
--그러나 exprl 에 대한 리터럴 null을 지정할 수 없습니다.

SELECT first_name, LENGTH(first_name)AS exprl1,
    last_name, LENGTH(last_name) AS exprl2,
    NULLIF(LENGTH(first_name), LENGTH(last_name)) AS result
FROM employees;


-- COALESCE()함수
-- 리스트에서 NULL이 아닌 첫번째 표현식을 반환합니다.
SELECT last_name, employee_id,commission_pct, manager_id,
    COALESCE(TO_CHAR(commission_pct),TO_CHAR(manager_id),
    'No commission and manager')
FROM employees;


-- 조건부 표현식
/*
****중요****
CASE 식
    IF-THEN-ELSE 문 작업을 수행 조건부 조회를 편리하게 수행.
when 조건 -일떄 then 값이 반환

*/

SELECT last_name, job_id, salary,
     CASE job_id
        WHEN 'IT_PROG' THEN 1.10* salary
        WHEN 'ST_CLERK' THEN 1.15* salary
        WHEN 'SA_PEP' THEN 1.20* salary
        ELSE salary
    END AS REVISED_SALARY
FROM employees;

-- case when~ end 까지 하나의 속성.


--**** DECODE()함수 
--CASE() 함수와 유사한 작업 수행

SELECT last_name, job_id, salary,
    DECODE(job_id,'IT_PROG',1.10*salary,'ST_CLERK',1.15*salary,'SA_PEP', 1.20*salary, salary)AS REVISED_SALARY
FROM employees;