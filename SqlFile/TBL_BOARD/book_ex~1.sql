--create table ��� (
--�����ȣ varchar(3)
--,����� varchar(10)
--,�Ի����� varchar(10)
--,�Ŵ��������ȣ varchar(3)
--,constraint "���_PK" primary key ("�����ȣ")
--,constraint "���_FK" FOREIGN key ("�Ŵ��������ȣ")
--REFERENCES ���(�����ȣ)
--);

--insert into ��� values('001','ȫ�浿','2017-01-01', null);
--insert into ��� values('002','������','2017-01-01', '001');
--insert into ��� values('003','�̼���','2018-01-01', '001');
--insert into ��� values('004','�̹���','2018-01-01', '001');
--insert into ��� values('005','�̺���','2018-01-01', null);
--insert into ��� values('006','�ȼ���','2020-01-01', '005');
--insert into ��� values('007','�̼���','2020-01-01', '005');
--insert into ��� values('008','�躴��','2020-01-01', '005');


--SELECT
--    *
--FROM
--    ���; SELECT
--    �����ȣ,
--    �����,
--    �Ի�����,
--    �Ŵ��������ȣ,
--    level as Lvl
--    from ��� 
--    START WITH �Ŵ��������ȣ is NULL
--    connect by prior �����ȣ = �Ŵ��������ȣ
--    and �Ի����� between '2017-02-02' and '2019-02-02'
--    order siblings by �����ȣ 
--    ;
--    

    
--create table �μ� (
--�μ��ڵ� varchar(3)
--,�μ��� varchar(20)
--,�����μ��ڵ� varchar(3)
--,constraint "�μ�_PK" primary key ("�μ��ڵ�")
--,constraint "�μ�_FK" FOREIGN key ("�����μ��ڵ�")
--REFERENCES �μ�(�μ��ڵ�)
--);


--create table ���� (
--�μ��ڵ� varchar(3)
--,����� number
--);
--
--insert into �μ� values ('100', '�ƽþ�����',null);
--insert into �μ� values ('110', '�ѱ�����','100');
--insert into �μ� values ('111', '��������','110');
--insert into �μ� values ('112', '�λ�����','110');
--insert into �μ� values ('120', '�Ϻ�����',100);
--insert into �μ� values ('121', '��������','120');
--insert into �μ� values ('122', '����ī����','120');
--insert into �μ� values ('130', '�߱�����','100');
--insert into �μ� values ('131', '����¡����','130');
--insert into �μ� values ('132', '����������','130');
--insert into �μ� values ('200', '����������',null);
--insert into �μ� values ('210', '����������','200');
--insert into �μ� values ('211', '���׸�������','210');
--insert into �μ� values ('212', '�׶󳪴�����','210');
--insert into �μ� values ('220', '������������','200');

--insert into ���� values ('111', 1000);
--insert into ���� values ('112', 2000);
--insert into ���� values ('121', 1500);
--insert into ���� values ('122', 1000);
--insert into ���� values ('131', 1500);
--insert into ���� values ('132', 2000);
--insert into ���� values ('211', 2000);
--insert into ���� values ('212', 1500);
--insert into ���� values ('221', 1000);
--insert into ���� values ('222', 2000);

select * from �μ�;
select * from ����;

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
select �μ��ڵ� ,�μ��� ,�����μ��ڵ� ,level as LVL
from �μ�
start with �μ��ڵ� = 120
connect by prior �����μ��ڵ� = �μ��ڵ�
;

select �μ��ڵ� ,�μ��� ,�����μ��ڵ� ,level as LVL
from �μ�
start with �μ��ڵ� = 120
connect by prior �μ��ڵ� = �����μ��ڵ�;

select * from �μ� ;

100	�ƽþ�����	
120	�Ϻ�����	100













