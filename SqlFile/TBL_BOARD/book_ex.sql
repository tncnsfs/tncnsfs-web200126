
select A.부서코드, A.부서명, A.상위부서코드,B.매출액, A.LVL
from
(select 부서코드 ,부서명 ,상위부서코드 ,level as LVL
from 부서
start with 부서코드 = 120
connect by prior 상위부서코드 = 부서코드
union
select 부서코드 ,부서명 ,상위부서코드 ,level as LVL
from 부서
start with 부서코드 = 120
connect by prior 부서코드 = 상위부서코드) A

left outer join 매출 B
on A.부서코드 = B.부서코드 
order by 부서코드
;











SELECT EMP_NO, EMP_NAME, DEPT_NO, EMP_ZHIWEI, EMP_SUOSHU, EMP_OTHER FROM EMPS;

SELECT EMP_NO, EMP_NAME, DEPT_NO, EMP_ZHIWEI, EMP_SUOSHU, EMP_OTHER, LEVEL AS LVL FROM EMPS
START WITH EMP_NO = '0001'
CONNECT BY PRIOR EMP_OTHER = DEPT_NO

;
union

SELECT EMP_NO, EMP_NAME, DEPT_NO, EMP_ZHIWEI, EMP_SUOSHU, EMP_OTHER, LEVEL AS LVL  FROM EMPS
START WITH EMP_NO = '0001'
CONNECT BY PRIOR DEPT_NO = EMP_OTHER
;

SELECT EMP_NO, EMP_NAME, DEPT_NO, EMP_ZHIWEI, EMP_SUOSHU, EMP_OTHER FROM EMPS;

update emps set emp_other = '001' where emp_suoshu = '인사팀';

















