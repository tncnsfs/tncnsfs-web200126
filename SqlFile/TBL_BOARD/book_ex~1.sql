--create table 사원 (
--사원번호 varchar(3)
--,사원명 varchar(10)
--,입사일자 varchar(10)
--,매니저사원번호 varchar(3)
--,constraint "사원_PK" primary key ("사원번호")
--,constraint "사원_FK" FOREIGN key ("매니저사원번호")
--REFERENCES 사원(사원번호)
--);

--insert into 사원 values('001','홍길동','2017-01-01', null);
--insert into 사원 values('002','강감찬','2017-01-01', '001');
--insert into 사원 values('003','이순신','2018-01-01', '001');
--insert into 사원 values('004','이민정','2018-01-01', '001');
--insert into 사원 values('005','이병헌','2018-01-01', null);
--insert into 사원 values('006','안성기','2020-01-01', '005');
--insert into 사원 values('007','이수근','2020-01-01', '005');
--insert into 사원 values('008','김병민','2020-01-01', '005');


--SELECT
--    *
--FROM
--    사원; SELECT
--    사원번호,
--    사원명,
--    입사일자,
--    매니저사원번호,
--    level as Lvl
--    from 사원 
--    START WITH 매니저사원번호 is NULL
--    connect by prior 사원번호 = 매니저사원번호
--    and 입사일자 between '2017-02-02' and '2019-02-02'
--    order siblings by 사원번호 
--    ;
--    

    
--create table 부서 (
--부서코드 varchar(3)
--,부서명 varchar(20)
--,상위부서코드 varchar(3)
--,constraint "부서_PK" primary key ("부서코드")
--,constraint "부서_FK" FOREIGN key ("상위부서코드")
--REFERENCES 부서(부서코드)
--);


--create table 매출 (
--부서코드 varchar(3)
--,매출액 number
--);
--
--insert into 부서 values ('100', '아시아지부',null);
--insert into 부서 values ('110', '한국지사','100');
--insert into 부서 values ('111', '서울지점','110');
--insert into 부서 values ('112', '부산지점','110');
--insert into 부서 values ('120', '일본지사',100);
--insert into 부서 values ('121', '도쿄지점','120');
--insert into 부서 values ('122', '오사카지점','120');
--insert into 부서 values ('130', '중국지사','100');
--insert into 부서 values ('131', '베이징지점','130');
--insert into 부서 values ('132', '상하이지점','130');
--insert into 부서 values ('200', '남유럽지부',null);
--insert into 부서 values ('210', '스페인지사','200');
--insert into 부서 values ('211', '마그리드지점','210');
--insert into 부서 values ('212', '그라나다지점','210');
--insert into 부서 values ('220', '포르투갈지사','200');

--insert into 매출 values ('111', 1000);
--insert into 매출 values ('112', 2000);
--insert into 매출 values ('121', 1500);
--insert into 매출 values ('122', 1000);
--insert into 매출 values ('131', 1500);
--insert into 매출 values ('132', 2000);
--insert into 매출 values ('211', 2000);
--insert into 매출 values ('212', 1500);
--insert into 매출 values ('221', 1000);
--insert into 매출 values ('222', 2000);

select * from 부서;
select * from 매출;

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
select 부서코드 ,부서명 ,상위부서코드 ,level as LVL
from 부서
start with 부서코드 = 120
connect by prior 상위부서코드 = 부서코드
;

select 부서코드 ,부서명 ,상위부서코드 ,level as LVL
from 부서
start with 부서코드 = 120
connect by prior 부서코드 = 상위부서코드;

select * from 부서 ;

100	아시아지부	
120	일본지사	100













