/*
�Լ� (function)
    �Ű�����(����) �� �޾� Ư�� ���(�۾�)�� �����ϰ� 
    ����� ��ȯ�ϴ� ������ �Ǿ� �ִ�.
    
�Լ� ����
    ������ �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ
    ������(�׷�) �Լ� -������ �Ű������� �޾� ��� �� ��ȯ
*/

--������ �Լ�
--��ҹ��� ��ȯ �Լ�
--LOWER()�Լ� ���ڿ��� �ҹ��ڷ� ��ȯ

SELECT employee_id,last_name,department_id
FROM employees
WHERE LOWER(last_name)='higgins'; -- ��� ��Ʈ ������ ���ؼ� �� �� ��ȿ����

--UPPER() �Լ� ���ڿ��� �빮�ڷ� ��ȯ.
SELECT UPPER('higgins') FROM dual; --�ӽ÷� ���� dual

---INITCAP() �Լ� ���ڿ��� ù ���ڸ� �빮�ڷ� ��ȯ
SELECT employee_id,last_name,department_id
FROM employees
WHERE last_name = INITCAP('higgins');

SELECT INITCAP('higgins') FROM dual;

-- ���� ���� �Լ�
-- concat()�Լ� �ΰ��� �Ķ����(�Ű�����,����) ���� �����մϴ�.
SELECT 'hello'|| 'world' FROM dual;
SELECT CONCAT('Hello','World') FROM dual;

-- SUBSTR() ������ ������ ���ڿ� ����
-- Ÿ ���α׷��� 0������~�ش��ȣ ������ �� ��� �򰥸��� ����.
SELECT SUBSTR('Helloworld',1,5) FROM dual; -- 1~5��°���� ����.


--LENGTH() ���ڿ��� ���̸� ���ڰ����� ǥ��
SELECT LENGTH ('HelloWorld') FROM dual;

-- INSTR() ���ڿ����� ������ ������ ��ġ�� ã���ϴ�.
SELECT INSTR('HelliWorld','W') FROM dual;

--LPAD() ���ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�.
SELECT LPAD('salary',10,'*') FROM dual; --  ���� ũ�⸸ŭ ������ ����,���ʺ��� ä����.

--RPAD() �����ʺ��� ���ڽ����� ä�� ǥ����
SELECT RPAD('salary',10,'*') FROM dual; -- �������� ����ŷ�� ��밡��.

--REPLACE() ���ڿ����� ������ ���ڸ� ġȯ�մϴ�.
SELECT REPLACE('JACK and JUE','J','BL') FROM dual; -- J�� BL�� ġȯ

-- TRIM() ���ڿ����� ���� �Ǵ� ���� ���ڸ� �ڸ��ϴ�.
SELECT TRIM ('H' FROM 'HelloWorld') FROM dual; -- �յڿ� �ش� ���� ������ �߶���.������ٶ� ���� ��

SELECT TRIM (' ' FROM ' HelloWorld ') FROM dual; 

-- ���� �Լ�
-- ROUND() ������ �Ҽ��� �ڸ����� ���� �ݿø� �մϴ�.

SELECT ROUND(45.926, 2) FROM dual;

--TRUNC() ������ �Ҽ��� �ڸ����� ���� �����մϴ�.
SELECT TRUNC(45.926, 2) FROM dual;

--MOD() ���� �������� ��ȯ
SELECT MOD(1600, 300) FROM dual;

--CEIL() �־��� ���ڸ� �ø��Ͽ� ������ ��ȯ

SELECT CEIL(45.233) FROM dual;

/*
��¥ ����
    ��¥�� ���ڸ� ���ϰų� ���� ��� ��¥ ���� ���մϴ�.
    �� ��¥ ������ �ϼ��� �˾Ƴ��� ���� ���� ������ �մϴ�.
*/

SELECT sysdate FROM dual; -- ���� ��¥�� ������ �ִ� ��ü

SELECT last_name,(sysdate - hire_date) /7 AS WEEKS -- ���� ��¥���� �Ի糯¥ ���� �ָ� �˱����� 7�� ����.
FROM employees
where department_id =90;

/*
��¥ ���� �Լ� 
    MONTHS_BTWEEN(date1,date2) : �� ��¥ ���� �� ���� ����մϴ�.
    ADD_MONTHS(date,n) : ��¥�� n������ �߰� �մϴ�.
    NEXT_DAY(date, day_of_week) :  ������ ��¥ �������� �־��� ������ ������ ��¥�� ����մϴ�.
    (1: �Ͽ��� ~ 7: �����)
    LAST_DAY(date) : �־��� ���� ������ ��¥�� ��ȯ �մϴ�.
    ROUND(date,format) : ��¥�� ������ �������� �ݿø��մϴ�.
    TRUNC(date,format) :  ��¥�� ������ �������� �����մϴ�.
    
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
TO_CAR() �Լ� - ��¥ �Ǵ� ���ڸ� ���ڿ��� ��ȯ
    YYYY ��ü ���� ����ǥ��
    YEAR ���� ö�ڷ� ǥ��
    MM �� 2�ڸ� ���� ǥ��
    MONTH ��ü �� �̸��� ǥ��
    MON ���� 3�ڸ� �� ��ȯ
    DY 3�ڸ� ���� �� ��ȯ
    DAY ���� ��ü�� �̸��� ��ȯ
    HH, HH12 , HH24  1�� ���� �ð� �Ǵ� ���Ͻð�(1-12) �Ǵ� ���Ͻð�(0-23)
    
    MI ��(0-59)�� ��ȯ
    SS ��(0-59)�� ��ȯ
    FF �и������� (0-999)�� ��ȯ
    AM �Ǵ� PM ����/���ĸ� ��Ÿ���� �ڿ��� ǥ�� ��ȯ
    A.M �Ǵ� P.M  ���� / ���ĸ� ��Ÿ���� ��ħǥ�� �ִ� �ڿ��� ǥ�ø� ��ȯ
    
    YY - 2000��� ���� ǥ��
    RR - 49�� ������ 2000���� 50��� ���Ĵ� 1900���� ǥ�ø� ��ȯ�մϴ�.

*/

SELECT last_name, TO_CHAR(hire_date, 'YY/MM/DD HH24:MI:SS') AS HIREDATE
FROM employees;

--TIMESTAMP()  ��¥ ���� + �и�������
SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.FF2') FROM dual; 

/*
TO_CHAR() �Լ��� ���ڿ� ����� ��
    9 - ���ڷ� ��Ÿ���ϴ�.
    0- 0�� ǥ�õǵ��� ������ �����մϴ�.
    $ - �ε� �޷� ��ȣ�� ��ġ�մϴ�.
    L - �ε� ���� ��ȭ ��ȣ�� ����մϴ�.
    . - �Ҽ��� ���
    , - õ ���� ǥ���� ��ǥ ���
*/
SELECT TO_CHAR(salary, 'L99,999.00') SALARY
FROM employees
WHERE last_name = 'Ernst';

-- TO_DATE() �Լ� ���ڿ��� DATE Ÿ������ ��ȯ�մϴ�.
SELECT last_name, TO_CHAR(hire_date,'YYYY_MM_DD') AS HIREDATE
FROM employees
WHERE hire_date < TO_DATE('2005-01-01', 'YYYY-MM-DD')
ORDER BY hire_date; --����

/*
�Լ� ��ø
    ������ �Լ��� ��� �����ε� ��ø�� �� �ֽ��ϴ�.
    ��ø�� �Լ��� ���� ���� �������� ���� ���� ������ �� �˴ϴ�.

*/

SELECT last_name,UPPER(CONCAT(SUBSTR(last_name,1,8),'_US'))
FROM employees
WHERE department_id =60;
-- �����ȣ 60�� ����� �߿� ��Ʈ ���� ��ȸ�� �ϴ´� 1~8��° ���ڱ��� �ڸ��� concat(����) _us �ϰ� ���� �빮��.
-- �ȿ��� ���� ���ʴ�� ó��.

--***** MVL() �Լ� ***** �߿�!
-- NULL���� ���� ������ ������ ��ȯ.
--( null�� ������ �ȵɋ� ��� )

SELECT NVL(null,0) FROM dual; -- ���굵 ����.

SELECT last_name, salary, NVL(commission_pct,0),(salary*12) AS Y_SAL, -- 1��ġ �޿�
(salary*12)+(salary*12 * NVL(commission_pct,0)) AS AN_SAL -- 1��ġ �޿��� + �󿩱�
FROM employees;
-- NVL(commission_pct,0) �ش� �Ӽ����� 0�� ��� ,0���� ǥ�� ��.
-- ���� 0���� ó���ϳ� ,ai�� ���� ��հ����� �ٲ��ֱ⵵ ��.

-- NVL2() �Լ�
-- ù��° ǥ������ �˻��մϴ�. ù���� ǥ������ null�� �ƴϸ� �ι�° ǥ������ ��ȯ �մϴ�.
-- ù���� ǥ������ null�̸� ����° ǥ������ ��ȯ �˴ϴ�.

SELECT last_name,salary,commission_pct,
NVL2(commission_pct,'SAL_COM','SAL') AS income
FROM employees
WHERE department_id IN(50,80);

-- NULLIF() �Լ�
-- �� ǥ������ ���ϰ� ������  null��ȯ �ٸ��� exprl�� ��ȯ
--�׷��� exprl �� ���� ���ͷ� null�� ������ �� �����ϴ�.

SELECT first_name, LENGTH(first_name)AS exprl1,
    last_name, LENGTH(last_name) AS exprl2,
    NULLIF(LENGTH(first_name), LENGTH(last_name)) AS result
FROM employees;


-- COALESCE()�Լ�
-- ����Ʈ���� NULL�� �ƴ� ù��° ǥ������ ��ȯ�մϴ�.
SELECT last_name, employee_id,commission_pct, manager_id,
    COALESCE(TO_CHAR(commission_pct),TO_CHAR(manager_id),
    'No commission and manager')
FROM employees;


-- ���Ǻ� ǥ����
/*
****�߿�****
CASE ��
    IF-THEN-ELSE �� �۾��� ���� ���Ǻ� ��ȸ�� ���ϰ� ����.
when ���� -�ϋ� then ���� ��ȯ

*/

SELECT last_name, job_id, salary,
     CASE job_id
        WHEN 'IT_PROG' THEN 1.10* salary
        WHEN 'ST_CLERK' THEN 1.15* salary
        WHEN 'SA_PEP' THEN 1.20* salary
        ELSE salary
    END AS REVISED_SALARY
FROM employees;

-- case when~ end ���� �ϳ��� �Ӽ�.


--**** DECODE()�Լ� 
--CASE() �Լ��� ������ �۾� ����

SELECT last_name, job_id, salary,
    DECODE(job_id,'IT_PROG',1.10*salary,'ST_CLERK',1.15*salary,'SA_PEP', 1.20*salary, salary)AS REVISED_SALARY
FROM employees;