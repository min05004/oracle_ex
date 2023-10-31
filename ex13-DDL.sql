/*
DDL - ������ ���Ǿ�
(Data Definition Language)
������ ���̽� ���� ���� �� ��ü(���̺�,������..��) �� ����,����,
�����ϱ� ���� ���Ǵ� SQL��
*/
/*CREATE TABLE ��
    �����͸� ������ ���̺��� ����ϴ�.
*/
CREATE TABLE dept (
    deptno NUMBER(6),
    dname VARCHAR2(200),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE -- DEFAULT SYSDATE ���� �ð��� �����ͷ� �ְڴ�. /DEFAULT ���� �� �ɾ�־� ��.
);
DESC dept;

SELECT * FROM dept;
INSERT INTO dept(deptno,dname,loc,create_date)
VALUES (1,'�μ�1','����');

rollback;

/*
������ ����
    VARCAHR2(size) ���� ���� ���� ������ MAX(4000) - byte
    NVARCHAR2(���ڼ�) ���� ���� ���� ������ ���ڼ� ������ �̴�. MAX(2000)
    NUMBER(p,s) ���� ���� ���� ������ p- ����, s- �Ҽ���
    CHAR(size) ���� ���� ���� MAX(2000) - ���ڼ��� ��� �޸� ũ��� ������ ����.
    DATE ��¥ �� �ð� �� 
    CLOB ���� ������ (�ִ� 4GB) - �Խ��� ��� ������
    BLOB ���̳ʸ� ������ (�ִ� 4GB)  - ���� ������
*/

-- departments ���̺��� dept�� ������ �����ϱ�
INSERT INTO dept
SELECT department_id, department_name, location_id, SYSDATE
FROM departments;
COMMIT;
SELECT * FROM dept;

/*
CTAS "Create Taable As Select"�� ���ڷ�
�����ͺ��̽����� ���ο� ���̺��� �����ϴ� ����Դϴ�.
�� ����� ���� ���̺��� SELECT���� ����Ͽ� �����͸� ��ȸ�� ��,
�� ����� ���ο� ���̺�� �����ϴ� ����Դϴ�.
*/
-- ���̺� �����ϱ� => ���������� ���簡 �ȵȴ�. /���̺� ������ �����͸� ���� ����.
CREATE TABLE dept2 AS
SELECT * FROM dept;

SELECT * FROM dept2;

-- ���̺� ������ �����ϱ� 
CREATE TABLE dept3 AS
SELECT * FROM dept WHERE 1=2; -- ������ ������ 

SELECT * FROM dept3;

CREATE TABLE dept4 (
    deptno NUMBER(6),
    dname NVARCHAR2(2000),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE
);

/*
ALTER ��
    �����ͺ��̽� ��ü ������ �Ӽ��� ������ �� ���Ǵ� SQL ��ɹ� �Դϴ�.
*/
CREATE TABLE simple(num NUMBER);

SELECT * FROM simple;

-- �÷� �߰��ϱ�
ALTER TABLE simple ADD(name VARCHAR2(3));-- ALTER TABLE ���̺� �� ADD(�߰��� �÷��� �÷�Ÿ��(������))

-- �÷� �����ϱ�
ALTER TABLE simple MODIFY(name VARCHAR2(30));-- ALTER TABLE ���̺� �� MODIFY (������ �÷��� �÷�Ÿ��())
DESC simple;

-- �÷� �����ϱ�
ALTER TABLE simple DROP COLUMN name;

ALTER TABLE simple ADD(addr VARCHAR2(50));
-- �÷� �����ϱ�2
ALTER TABLE simple DROP(addr); -- �÷��� �ᵵ ������

DESC simple;



SELECT SYSDATE FROM dual;

SELECT * FROM dept;

INSERT INTO dept (deptno, dname, loc)
VALUES (2, '�μ�1', '����');

ROLLBACK;
DESC dept;


/*DROP ��
    ��ü�� ������ �� ���Ǵ� SQL��ɹ� �Դϴ�.
*/
DROP TABLE simple;

DESC simple;


/*
��������(Constraint)
    ���̺��� �ش��÷��� ������ �ʴ� �����͸� �Է�/����/���� �Ǵ� ���� �����ϱ� ����
    ���̺� ���� �Ǵ� ����� �����ϴ� �����Դϴ�. 
    (����� �������� �ŷڼ� ���̱�����)
    
    NOT NULL
        NULL�� �Է��� �Ǿ�� �ȵǴ� �÷��� �ο��ϴ�
        �������� �÷� ���������� �ο��� �� �ִ� ���������Դϴ�.
        
    UNIQUE KEY(����Ű)
        ����� ���� �ߺ����� �ʰ� ���� �����ϰ� �����Ǿ�� �� ��
        ����ϴ� ���������Դϴ�.(NULL ���ȴ�)
        
    PRIMARY KEY(��ǥŰ, �⺻Ű)
        NOT NULL ���ǰ� UNIQUE KEY�� ��ģ �����Դϴ�.
        
    CHECK
        ���ǿ� �´� �����͸� �Էµǵ��� ������ �ο��ϴ� ���������Դϴ�.
        
    FOREIGN KEY(�ܷ�Ű, ����Ű) -- �θ����̺��� �Ժη� ����ų� ������ ��Ʊ� ������ �����ϱ�!
        �θ� ���̺��� PRIMARY KEY�� �����ϴ� �÷��� ���̴� ���������Դϴ�.
*/

DROP TABLE dept4;
CREATE TABLE dept4(
    deptno NUMBER(2) CONSTRAINT dept4_deptno_pk PRIMARY KEY, -- �μ� ��ȣ�� PRIMARY KEY
    dname VARCHAR2(15) DEFAULT '������', -- name �÷��� ����Ʈ��(���� ���� '������')
    loc CHAR(1) CONSTRAINT dept4_loc_ck CHECK(loc IN('1','2')) -- 1�Ǵ� 2�� ���� ���ü� �ְ� �������� �ɾ���
);
 -- �μ� ��ȣ CONSTRAINT dept4_deptno_pk (<-�������� �̸��� �ٿ��ذ�) PRIMARY KEY

SELECT * FROM dept4;
INSERT INTO dept4(deptno, loc)
VALUES (3,'2'); -- �ѹ� ���� ��� �ߺ����� ����� ������ ������ ��.



/*
�ܷ�Ű�� ����� ���� �θ����̺� ����
*/
CREATE TABLE dept5(
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR(15) NOT NULL
);

-- �θ����̺� dept5�� �����ϴ� �ڽ� ���̺�
CREATE TABLE emp (
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(15) NOT NULL,
    deptno NUMBER(2),
CONSTRAINT emp_dept5_fk FOREIGN KEY (deptno)  -- �������� �̸� �ܷ�Ű ���� (� �÷�)
    REFERENCES dept5(deptno) -- � ���̺��� ������ ���̳� �� ���� ����
);

SELECT * FROM dept5;
INSERT INTO dept5 (deptno, dname) VALUES (1, '���ߺ�');
INSERT INTO dept5 (deptno, dname) VALUES (2, '��ȹ��');
INSERT INTO dept5 (deptno, dname) VALUES (3, '������');
COMMIT;

SELECT * FROM emp;
INSERT INTO emp (empno, ename, deptno) VALUES (1, '�����', 1);
INSERT INTO emp (empno, ename, deptno) VALUES (2, '�̰���', 2);

COMMIT;

DELETE FROM emp WHERE empno = 1;
ROLLBACK;

DELETE FROM dept5 WHERE deptno = 1; -- �θ����̺� �����͸� ����� �ڽ� ���̺��� �����ϴ� ���� �ǹ̰� �������� ������ ������ ��.
                                     -- �ڽ����̺� �����Ͱ� ������ �θ����̺� ���� ������ ����!!!
 
SELECT * FROM dept5;
ROLLBACK;

-- �������� ��ȸ
SELECT * FROM user_constraints
WHERE constraint_name = 'EMP_DEPT5_FK'
; -- �ɾ��� �������� ã�� 

SELECT * FROM user_constraints -- �����ʹ� ��ҹ��� ������ ��!
WHERE table_name = 'EMP'
;

-- ���������� ���� �Ұ���, ������ �����մϴ�.
ALTER TABLE emp DROP CONSTRAINT EMP_DEPT5_FK;

-- �������� �߰��ϱ�
ALTER TABLE emp ADD(
    CONSTRAINT emp_dept5_fk FOREIGN KEY(deptno) REFERENCES dept5(deptno)
);