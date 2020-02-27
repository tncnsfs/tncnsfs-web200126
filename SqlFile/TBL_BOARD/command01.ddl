

SELECT * FROM depts;

CREATE TABLE depts
(
	dept_no              VARCHAR2(20) NOT NULL ,
	dept_name            VARCHAR2(20) NULL ,
	dept_teamNm          VARCHAR2(20) NULL ,
	dept_contact         VARCHAR2(20) NULL ,
	dept_other           VARCHAR2(20) NULL 
);



CREATE UNIQUE INDEX XPK부서 ON depts
(dept_no   ASC);



ALTER TABLE depts
	ADD CONSTRAINT  XPK부서 PRIMARY KEY (dept_no);



CREATE TABLE emps
(
	emp_no               VARCHAR2(20) NOT NULL ,
	dept_no              VARCHAR2(20) NULL ,
	emp_name             VARCHAR2(20) NULL ,
	emp_zhiwei           VARCHAR2(20) NULL ,
	emp_suoshu           VARCHAR2(20) NULL ,
	emp_contact          VARCHAR2(20) NULL ,
	emp_adress           VARCHAR2(50) NULL ,
	emp_date             DATE NULL ,
	emp_sal              VARCHAR2(20) NULL ,
	emp_other            VARCHAR(20) NULL 
);



CREATE UNIQUE INDEX XPK사원 ON emps
(emp_no   ASC);



ALTER TABLE emps
	ADD CONSTRAINT  XPK사원 PRIMARY KEY (emp_no);



ALTER TABLE emps
	ADD (CONSTRAINT R_1 FOREIGN KEY (dept_no) REFERENCES depts (dept_no) ON DELETE SET NULL);



CREATE  TRIGGER  tD_depts AFTER DELETE ON depts for each row
-- ERwin Builtin Trigger
-- DELETE trigger on depts 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* depts  emps on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000a762", PARENT_OWNER="", PARENT_TABLE="depts"
    CHILD_OWNER="", CHILD_TABLE="emps"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="dept_no" */
    UPDATE emps
      SET
        /* %SetFK(emps,NULL) */
        emps.dept_no = NULL
      WHERE
        /* %JoinFKPK(emps,:%Old," = "," AND") */
        emps.dept_no = :old.dept_no;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_depts AFTER UPDATE ON depts for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on depts 
DECLARE NUMROWS INTEGER;
BEGIN
  /* depts  emps on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000cdcb", PARENT_OWNER="", PARENT_TABLE="depts"
    CHILD_OWNER="", CHILD_TABLE="emps"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="dept_no" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.dept_no <> :new.dept_no
  THEN
    UPDATE emps
      SET
        /* %SetFK(emps,NULL) */
        emps.dept_no = NULL
      WHERE
        /* %JoinFKPK(emps,:%Old," = ",",") */
        emps.dept_no = :old.dept_no;
  END IF;


-- ERwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_emps BEFORE INSERT ON emps for each row
-- ERwin Builtin Trigger
-- INSERT trigger on emps 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin Trigger */
    /* depts  emps on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000d52b", PARENT_OWNER="", PARENT_TABLE="depts"
    CHILD_OWNER="", CHILD_TABLE="emps"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="dept_no" */
    UPDATE emps
      SET
        /* %SetFK(emps,NULL) */
        emps.dept_no = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM depts
            WHERE
              /* %JoinFKPK(:%New,depts," = "," AND") */
              :new.dept_no = depts.dept_no
        ) 
        /* %JoinPKPK(emps,:%New," = "," AND") */
         and emps.emp_no = :new.emp_no;


-- ERwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_emps AFTER UPDATE ON emps for each row
-- ERwin Builtin Trigger
-- UPDATE trigger on emps 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin Trigger */
  /* depts  emps on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0000ea6e", PARENT_OWNER="", PARENT_TABLE="depts"
    CHILD_OWNER="", CHILD_TABLE="emps"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="dept_no" */
  SELECT count(*) INTO NUMROWS
    FROM depts
    WHERE
      /* %JoinFKPK(:%New,depts," = "," AND") */
      :new.dept_no = depts.dept_no;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.dept_no IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update emps because depts does not exist.'
    );
  END IF;


-- ERwin Builtin Trigger
END;
/


COMMENT ON TABLE depts IS '부서';
 
    COMMENT ON COLUMN depts.dept_no IS '부서번호';  
    COMMENT ON COLUMN depts.dept_name IS '부서명';  
    COMMENT ON COLUMN depts.dept_teamNm IS '팀명';  
    COMMENT ON COLUMN depts.dept_contact IS '연락처';  
    COMMENT ON COLUMN depts.dept_other IS '기타';  
    
COMMENT ON TABLE emps IS '사원';
 
    COMMENT ON COLUMN emps.emp_no IS '사원번호';  
    COMMENT ON COLUMN emps.emp_name IS '사원명';  
    COMMENT ON COLUMN emps.emp_zhiwei IS '직위';  
    COMMENT ON COLUMN emps.emp_suoshu IS '소속';  
    COMMENT ON COLUMN emps.emp_contact IS '연락처';  
    COMMENT ON COLUMN emps.emp_adress IS '주소';  
    COMMENT ON COLUMN emps.emp_date IS '입사일';  
    COMMENT ON COLUMN emps.emp_sal IS '연봉';  
    COMMENT ON COLUMN emps.emp_other IS '기타';  
    COMMENT ON COLUMN emps.dept_no IS '부서번호';  
    
    
--더미데이터 생성하기 
BEGIN
FOR i IN 1..50 LOOP
INSERT INTO depts(DEPT_NO, DEPT_NAME, DEPT_TEAMNM, DEPT_CONTACT, DEPT_OTHER) 
VALUES(CONCAT('00', i),CONCAT('TEST', i), CONCAT('TESTteam', i),CONCAT('TESTContact', i), CONCAT('TESTOther', i));
END LOOP;
END;
    
    
BEGIN
FOR i IN 1..50 LOOP
INSERT INTO emps
VALUES(CONCAT('0001', i),CONCAT('00', i), CONCAT('TESTNm', i),CONCAT('사원', i), CONCAT('개발팀', i),CONCAT('010-000-00', i),CONCAT('서울시동작구장승배기로0', i),CURRENT_TIMESTAMP,CONCAT('300', i),CONCAT('기타', i));
END LOOP;
END;
