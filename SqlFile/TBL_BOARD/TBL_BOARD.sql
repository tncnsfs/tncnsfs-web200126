SELECT * FROM EMPS;
SELECT * FROM TBL_BOARD;


DROP TABLE TBL_BOARD;

CREATE TABLE TBL_BOARD(
BNO varchar(30) PRIMARY KEY
, BL_DEPT_NO varchar(30) 
, TITLE VARCHAR2(30)
, CONTENT VARCHAR2(50)
, WRITER VARCHAR(30)
, REGDATE DATE
,UPDATEDATE DATE
,ZHIWEI VARCHAR2(30)
,SUOSHU VARCHAR2(30)
,SUOSHU_NO VARCHAR2(30)
,EMP_OTHER NUMBER(10)
);

select * from depts;

delete from depts where dept_no = '005'


----���̵����� �����ϱ� 
BEGIN FOR i IN 1..10 LOOP
    INSERT INTO tbl_board (
        BNO,
        BL_DEPT_NO,
        TITLE,
        CONTENT,
        WRITER,
        REGDATE,
        UPDATEDATE,
        ZHIWEI,
        SUOSHU,
        EMP_OTHER
    ) VALUES (
        concat('00', i),
        concat('00', i),
        concat('���_00', i),
        concat('����', i),
        concat('�ۼ���_', i),
        current_timestamp,
        current_timestamp,
        '���',
        '�λ���',
        concat('00', i)
    );
    END loop;
END;


DESC TBL_BOARD;

SELECT *FROM TBL_BOARD;

UPDATE TBL_BOARD SET BL_DEPT_NO = '001', ZHIWEI = '�븮', SUOSHU = '������' WHERE BNO > 003;

COMMIT;



SELECT * FROM TBL_BOARD WHERE suoshu = '�λ���';

SELECT * FROM TBL_BOARD WHERE BNO > 0
;


update tbl_board set bl_dept_no = '002' where emp_other > 3;
--select * from tab1;

--select * from tab1
--start with c2 is null
--connect by prior c1 = c2
--order siblings by c3 desc
--;
