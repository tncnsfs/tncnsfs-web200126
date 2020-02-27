DROP TABLE emps;

DROP TABLE depts;

CREATE TABLE depts (
    dept_no        VARCHAR2(20) NOT NULL,
    dept_name      VARCHAR2(20) NULL,
    dept_teamnm    VARCHAR2(20) NULL,
    dept_contact   VARCHAR2(20) NULL,
    dept_other     VARCHAR2(20) NULL
   , CONSTRAINT "depts_PK" PRIMARY KEY ( dept_no )
);

CREATE TABLE emps (
    emp_no        VARCHAR2(20) NOT NULL,
    emp_dept_no   VARCHAR2(20) NULL,
    emp_name      VARCHAR2(20) NULL,
    emp_zhiwei    VARCHAR2(20) NULL,
    emp_suoshu    VARCHAR2(20) NULL,
    emp_contact   VARCHAR2(20) NULL,
    emp_adress    VARCHAR2(50) NULL,
    emp_date      DATE NULL,
    emp_sal       VARCHAR2(20) NULL,
    emp_other     VARCHAR(20) NULL
    ,CONSTRAINT "emps_PK" PRIMARY KEY(emp_dept_no)
    ,CONSTRAINT "emps_fk" FOREIGN KEY(emp_other)
    REFERENCES emps( emp_dept_no )
);

SELECT
    *
FROM
    depts;

SELECT
    *
FROM
    emps;

COMMENT ON TABLE depts IS
    '�μ�';

COMMENT ON COLUMN depts.dept_no IS
    '�μ���ȣ';

COMMENT ON COLUMN depts.dept_name IS
    '�μ���';

COMMENT ON COLUMN depts.dept_teamnm IS
    '����';

COMMENT ON COLUMN depts.dept_contact IS
    '����ó';

COMMENT ON COLUMN depts.dept_other IS
    '��Ÿ';

COMMENT ON TABLE emps IS
    '���';

COMMENT ON COLUMN emps.emp_no IS
    '�����ȣ';

COMMENT ON COLUMN emps.emp_name IS
    '�����';

COMMENT ON COLUMN emps.emp_zhiwei IS
    '����';

COMMENT ON COLUMN emps.emp_suoshu IS
    '�Ҽ�';

COMMENT ON COLUMN emps.emp_contact IS
    '����ó';

COMMENT ON COLUMN emps.emp_adress IS
    '�ּ�';

COMMENT ON COLUMN emps.emp_date IS
    '�Ի���';

COMMENT ON COLUMN emps.emp_sal IS
    '����';

COMMENT ON COLUMN emps.emp_other IS
    '��Ÿ';

COMMENT ON COLUMN emps.emp_dept_no IS
    '�μ���ȣ';

SELECT * FROM  depts;

SELECT * FROM  emps;
--
--
----���̵����� �����ϱ� 
BEGIN
    FOR i IN 1..5 LOOP
        INSERT INTO depts (
            dept_no,
            dept_name,
            dept_teamnm,
            dept_contact,
            dept_other
        ) VALUES (
            concat('00', i),
            concat('TEST', i),
            concat('TESTteam', i),
            concat('TESTContact', i),
            concat('TESTOther', i)
        );

    END LOOP;
END
;
--
--

INSERT INTO emps VALUES('0001','001', 'TESTNm01','���01','�λ�1��','010-000-001','����õ��۱���¹���01',CURRENT_TIMESTAMP,'3001','');
INSERT INTO emps VALUES('0002','002', 'TESTNm01','���01','����1��','010-000-001','����õ��۱���¹���01',CURRENT_TIMESTAMP,'3001','001');
INSERT INTO emps VALUES('0003','003', 'TESTNm01','���01','�1��','010-000-001','����õ��۱���¹���01',CURRENT_TIMESTAMP,'3001','001');
INSERT INTO emps VALUES('0004','004', 'TESTNm01','���01','����1��','010-000-001','����õ��۱���¹���01',CURRENT_TIMESTAMP,'3001','003');
INSERT INTO emps VALUES('0005','005', 'TESTNm01','���01','����2��','010-000-001','����õ��۱���¹���01',CURRENT_TIMESTAMP,'3001','003');
--INSERT INTO emps VALUES('0006','001', 'TESTNm01','���02','����1��','010-000-001','����õ��۱���¹���01',CURRENT_TIMESTAMP,'3001','002');


SELECT * FROM  depts;

SELECT * FROM  emps;
select emp_no, emp_dept_no, emp_suoshu, emp_other from emps;

update depts set dept_name = '�濵����' , dept_contact = '010-1234-1232' where dept_no = '001';
update depts set dept_name = '��������' , dept_contact = '010-1234-1233' where dept_no = '002';
update depts set dept_name = '���ߺ���', dept_contact = '010-1234-1234' where dept_no = '003';
update emps set emp_suoshu = '�λ���' where emp_no = '0001';
update emps set emp_other = '002' where emp_suoshu = '�λ���' ;
update emps set emp_suoshu = '����1��' where emp_no = '0002';
update emps set emp_other = '003' where emp_suoshu = '����1��' ;
update emps set emp_suoshu = '����1��' where emp_no = '0003';
update emps set emp_other = '004' where emp_suoshu = '����1��' ;
update emps set emp_suoshu = '����2��',emp_other='005' where emp_no = '0004';
update emps set emp_dept_no = '003' where emp_no = '0004';
update emps set emp_suoshu = '���', emp_other = '002-1' where emp_no = '0005';
update emps set emp_dept_no = '001' where emp_no = '0005';
update emps set emp_suoshu = '����1��',emp_other='004' where emp_no = '0006';
update emps set emp_dept_no = '003' where emp_no = '0006';
update emps set emp_suoshu = '����1��', emp_other = '004', emp_dept_no = '003' where emp_no > '0008' ;

update depts set dept_teamnm = '�濵��' where dept_no = '001';
update depts set dept_teamnm = '������' where dept_no = '002';
update depts set dept_teamnm = '������' where dept_no = '003';

