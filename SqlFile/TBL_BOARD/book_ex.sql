
select A.�μ��ڵ�, A.�μ���, A.�����μ��ڵ�,B.�����, A.LVL
from
(select �μ��ڵ� ,�μ��� ,�����μ��ڵ� ,level as LVL
from �μ�
start with �μ��ڵ� = 120
connect by prior �����μ��ڵ� = �μ��ڵ�
union
select �μ��ڵ� ,�μ��� ,�����μ��ڵ� ,level as LVL
from �μ�
start with �μ��ڵ� = 120
connect by prior �μ��ڵ� = �����μ��ڵ�) A

left outer join ���� B
on A.�μ��ڵ� = B.�μ��ڵ� 
order by �μ��ڵ�
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

update emps set emp_other = '001' where emp_suoshu = '�λ���';

















