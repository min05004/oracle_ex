/*
DDL - 데이터 정의어
(Data Definition Language)
데이터 베이스 내의 구조 및 객체(테이블,시퀀스..등) 를 생성,변경,
삭제하기 위해 사용되는 SQL문
*/
/*CREATE TABLE 문
    데이터를 저장할 테이블을 만듭니다.
*/
CREATE TABLE dept (
    deptno NUMBER(6),
    dname VARCHAR2(200),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE -- DEFAULT SYSDATE 현재 시간을 데이터로 넣겠다. /DEFAULT 값을 잘 걸어둬야 함.
);
DESC dept;

SELECT * FROM dept;
INSERT INTO dept(deptno,dname,loc,create_date)
VALUES (1,'부서1','서울');

rollback;

/*
데이터 유형
    VARCAHR2(size) 가변 길이 문자 데이터 MAX(4000) - byte
    NVARCHAR2(글자수) 가변 길이 문자 데이터 글자수 사이즈 이다. MAX(2000)
    NUMBER(p,s) 가변 길이 숫자 데이터 p- 정수, s- 소수점
    CHAR(size) 고정 길이 문자 MAX(2000) - 글자수가 적어도 메모리 크기는 정해져 있음.
    DATE 날짜 및 시간 값 
    CLOB 문자 데이터 (최대 4GB) - 게시판 사용 많이함
    BLOB 바이너리 데이터 (최대 4GB)  - 숫자 데이터
*/

-- departments 테이블을 dept에 데이터 복사하기
INSERT INTO dept
SELECT department_id, department_name, location_id, SYSDATE
FROM departments;
COMMIT;
SELECT * FROM dept;

/*
CTAS "Create Taable As Select"의 약자로
데이터베이스에서 새로운 테이블을 생성하는 기법입니다.
이 기법은 기존 테이블에서 SELECT문을 사용하여 데이터를 조회한 후,
그 결과를 새로운 테이블로 생성하는 방법입니다.
*/
-- 테이블 복사하기 => 제약조건은 복사가 안된다. /테이블 구조와 데이터만 복사 가능.
CREATE TABLE dept2 AS
SELECT * FROM dept;

SELECT * FROM dept2;

-- 테이블 구조만 복사하기 
CREATE TABLE dept3 AS
SELECT * FROM dept WHERE 1=2; -- 조건을 거짓을 

SELECT * FROM dept3;

CREATE TABLE dept4 (
    deptno NUMBER(6),
    dname NVARCHAR2(2000),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE
);

/*
ALTER 문
    데이터베이스 객체 구조나 속성을 변경할 때 사용되는 SQL 명령문 입니다.
*/
CREATE TABLE simple(num NUMBER);

SELECT * FROM simple;

-- 컬럼 추가하기
ALTER TABLE simple ADD(name VARCHAR2(3));-- ALTER TABLE 테이블 명 ADD(추가할 컬럼명 컬럼타입(데이터))

-- 컬럼 수정하기
ALTER TABLE simple MODIFY(name VARCHAR2(30));-- ALTER TABLE 테이블 명 MODIFY (변경할 컬럼명 컬럼타입())
DESC simple;

-- 컬럼 삭제하기
ALTER TABLE simple DROP COLUMN name;

ALTER TABLE simple ADD(addr VARCHAR2(50));
-- 컬럼 삭제하기2
ALTER TABLE simple DROP(addr); -- 컬럼명만 써도 삭제됨

DESC simple;



SELECT SYSDATE FROM dual;

SELECT * FROM dept;

INSERT INTO dept (deptno, dname, loc)
VALUES (2, '부서1', '서울');

ROLLBACK;
DESC dept;


/*DROP 문
    객체를 삭제할 때 사용되는 SQL명령문 입니다.
*/
DROP TABLE simple;

DESC simple;


/*
제약조건(Constraint)
    테이블의 해당컬럼에 원하지 않는 데이터를 입력/수정/삭제 되는 것을 방지하기 위해
    테이블 생성 또는 변경시 설정하는 조건입니다. 
    (저장된 데이터의 신뢰성 높이기위함)
    
    NOT NULL
        NULL로 입력이 되어서는 안되는 컬럼에 부여하는
        조건으로 컬럼 레벨에서만 부여할 수 있는 제약조건입니다.
        
    UNIQUE KEY(유일키)
        저장된 값이 중복되지 않고 오직 유일하게 유지되어야 할 때
        사용하는 제약조건입니다.(NULL 허용된다)
        
    PRIMARY KEY(대표키, 기본키)
        NOT NULL 조건과 UNIQUE KEY를 합친 조건입니다.
        
    CHECK
        조건에 맞는 데이터만 입력되도록 조건을 부여하는 제약조건입니다.
        
    FOREIGN KEY(외래키, 참조키) -- 부모테이블을 함부로 지우거나 수정이 어렵기 때문에 참고하기!
        부모 테이블의 PRIMARY KEY를 참조하는 컬럼에 붙이는 제약조건입니다.
*/

DROP TABLE dept4;
CREATE TABLE dept4(
    deptno NUMBER(2) CONSTRAINT dept4_deptno_pk PRIMARY KEY, -- 부서 번호를 PRIMARY KEY
    dname VARCHAR2(15) DEFAULT '영업부', -- name 컬럼의 디폴트값(빈값일 경우는 '영업부')
    loc CHAR(1) CONSTRAINT dept4_loc_ck CHECK(loc IN('1','2')) -- 1또는 2의 값만 들어올수 있게 제약조건 걸어줌
);
 -- 부서 번호 CONSTRAINT dept4_deptno_pk (<-제약조건 이름을 붙여준것) PRIMARY KEY

SELECT * FROM dept4;
INSERT INTO dept4(deptno, loc)
VALUES (3,'2'); -- 한번 더할 경우 중복값이 생기기 때문에 에러가 뜸.



/*
외래키를 만들기 위해 부모테이블 생성
*/
CREATE TABLE dept5(
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR(15) NOT NULL
);

-- 부모테이블 dept5를 참조하는 자식 테이블
CREATE TABLE emp (
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(15) NOT NULL,
    deptno NUMBER(2),
CONSTRAINT emp_dept5_fk FOREIGN KEY (deptno)  -- 제약조건 이름 외래키 설정 (어떤 컬럼)
    REFERENCES dept5(deptno) -- 어떤 테이블을 참조할 것이냐 에 대한 내용
);

SELECT * FROM dept5;
INSERT INTO dept5 (deptno, dname) VALUES (1, '개발부');
INSERT INTO dept5 (deptno, dname) VALUES (2, '기획부');
INSERT INTO dept5 (deptno, dname) VALUES (3, '디자인');
COMMIT;

SELECT * FROM emp;
INSERT INTO emp (empno, ename, deptno) VALUES (1, '손흥민', 1);
INSERT INTO emp (empno, ename, deptno) VALUES (2, '이강인', 2);

COMMIT;

DELETE FROM emp WHERE empno = 1;
ROLLBACK;

DELETE FROM dept5 WHERE deptno = 1; -- 부모테이블 데이터를 지우면 자식 테이블이 참조하는 값이 의미가 없어지기 때문에 에러가 뜸.
                                     -- 자식테이블 데이터가 없으면 부모테이블 값도 삭제가 가능!!!
 
SELECT * FROM dept5;
ROLLBACK;

-- 제약조건 조회
SELECT * FROM user_constraints
WHERE constraint_name = 'EMP_DEPT5_FK'
; -- 걸었던 제약조건 찾기 

SELECT * FROM user_constraints -- 데이터는 대소문자 구분을 함!
WHERE table_name = 'EMP'
;

-- 제약조건은 수정 불가능, 삭제만 가능합니다.
ALTER TABLE emp DROP CONSTRAINT EMP_DEPT5_FK;

-- 제약조건 추가하기
ALTER TABLE emp ADD(
    CONSTRAINT emp_dept5_fk FOREIGN KEY(deptno) REFERENCES dept5(deptno)
);