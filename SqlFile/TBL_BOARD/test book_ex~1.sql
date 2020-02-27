--SELECT * FROM  depts;
--select emp_no, emp_dept_no, emp_suoshu, emp_other from emps;
--select dept_no, dept_name, dept_teamnm from depts  ;
--
--
--select d.dept_no, e.emp_suoshu, d.dept_name, d.dept_teamnm,  e.emp_other ,e.emp_dept_no
--from
--(select emp_no, emp_dept_no, emp_suoshu, 
--emp_other 
--from emps)  e 
--left outer join depts d 
--on d.dept_no = e.emp_dept_no;


update emps set EMP_OTHER = '' where emp_suoshu = '인사팀';

insert into emps(emp_no,emp_dept_no, emp_other) values('0006','006', '003');

update emps set EMP_OTHER = '002'
WHERE EMP_NO = '0005';

ROLLBACK;
COMMIT; 
desc emps;

select  * from emps; 


SELECT EMP_NO, EMP_DEPT_NO, EMP_OTHER , LEVEL AS LVL
FROM EMPS 
--START WITH EMP_OTHER IS NULL
START WITH EMP_DEPT_NO = '001'

CONNECT BY PRIOR EMP_DEPT_NO = EMP_OTHER
ORDER SIBLINGS BY EMP_OTHER
;




SELECT * FROM TBL_BOARD;

----더미데이터 생성하기 
BEGIN
    FOR i IN 1..5 LOOP
        INSERT INTO TBL_BOARD (BNO ,dept_name ,dept_teamnm ,dept_contact ,dept_other) 
        VALUES     (concat('00', i),concat('TEST', i),concat('TESTteam', i), concat('TESTContact', i),concat('TESTOther', i)
        );
    END LOOP;
END
;




--select * from tab1;

--select * from tab1
--start with c2 is null
--connect by prior c1 = c2
--order siblings by c3 desc
--;

select  * from emps;

update emps set 
emp_other = '' 
where emp_suoshu = '인사팀';

