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
    '부서';

COMMENT ON COLUMN depts.dept_no IS
    '부서번호';

COMMENT ON COLUMN depts.dept_name IS
    '부서명';

COMMENT ON COLUMN depts.dept_teamnm IS
    '팀명';

COMMENT ON COLUMN depts.dept_contact IS
    '연락처';

COMMENT ON COLUMN depts.dept_other IS
    '기타';

COMMENT ON TABLE emps IS
    '사원';

COMMENT ON COLUMN emps.emp_no IS
    '사원번호';

COMMENT ON COLUMN emps.emp_name IS
    '사원명';

COMMENT ON COLUMN emps.emp_zhiwei IS
    '직위';

COMMENT ON COLUMN emps.emp_suoshu IS
    '소속';

COMMENT ON COLUMN emps.emp_contact IS
    '연락처';

COMMENT ON COLUMN emps.emp_adress IS
    '주소';

COMMENT ON COLUMN emps.emp_date IS
    '입사일';

COMMENT ON COLUMN emps.emp_sal IS
    '연봉';

COMMENT ON COLUMN emps.emp_other IS
    '기타';

COMMENT ON COLUMN emps.emp_dept_no IS
    '부서번호';

SELECT * FROM  depts;

SELECT * FROM  emps;
--
--
----더미데이터 생성하기 
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

INSERT INTO emps VALUES('0001','001', 'TESTNm01','사원01','인사1팀','010-000-001','서울시동작구장승배기로01',CURRENT_TIMESTAMP,'3001','');
INSERT INTO emps VALUES('0002','002', 'TESTNm01','사원01','영업1팀','010-000-001','서울시동작구장승배기로01',CURRENT_TIMESTAMP,'3001','001');
INSERT INTO emps VALUES('0003','003', 'TESTNm01','사원01','운영1팀','010-000-001','서울시동작구장승배기로01',CURRENT_TIMESTAMP,'3001','001');
INSERT INTO emps VALUES('0004','004', 'TESTNm01','사원01','개발1팀','010-000-001','서울시동작구장승배기로01',CURRENT_TIMESTAMP,'3001','003');
INSERT INTO emps VALUES('0005','005', 'TESTNm01','사원01','개발2팀','010-000-001','서울시동작구장승배기로01',CURRENT_TIMESTAMP,'3001','003');
--INSERT INTO emps VALUES('0006','001', 'TESTNm01','사원02','개발1팀','010-000-001','서울시동작구장승배기로01',CURRENT_TIMESTAMP,'3001','002');


SELECT * FROM  depts;

SELECT * FROM  emps;
select emp_no, emp_dept_no, emp_suoshu, emp_other from emps;

update depts set dept_name = '경영본부' , dept_contact = '010-1234-1232' where dept_no = '001';
update depts set dept_name = '영업본부' , dept_contact = '010-1234-1233' where dept_no = '002';
update depts set dept_name = '개발본부', dept_contact = '010-1234-1234' where dept_no = '003';
update emps set emp_suoshu = '인사팀' where emp_no = '0001';
update emps set emp_other = '002' where emp_suoshu = '인사팀' ;
update emps set emp_suoshu = '영업1팀' where emp_no = '0002';
update emps set emp_other = '003' where emp_suoshu = '영업1팀' ;
update emps set emp_suoshu = '개발1팀' where emp_no = '0003';
update emps set emp_other = '004' where emp_suoshu = '개발1팀' ;
update emps set emp_suoshu = '개발2팀',emp_other='005' where emp_no = '0004';
update emps set emp_dept_no = '003' where emp_no = '0004';
update emps set emp_suoshu = '운영팀', emp_other = '002-1' where emp_no = '0005';
update emps set emp_dept_no = '001' where emp_no = '0005';
update emps set emp_suoshu = '개발1팀',emp_other='004' where emp_no = '0006';
update emps set emp_dept_no = '003' where emp_no = '0006';
update emps set emp_suoshu = '개발1팀', emp_other = '004', emp_dept_no = '003' where emp_no > '0008' ;

update depts set dept_teamnm = '경영팀' where dept_no = '001';
update depts set dept_teamnm = '영업팀' where dept_no = '002';
update depts set dept_teamnm = '개발팀' where dept_no = '003';

