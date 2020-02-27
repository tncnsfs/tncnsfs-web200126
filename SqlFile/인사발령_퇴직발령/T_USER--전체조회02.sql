 
---- 퇴직발령: 퇴직구분 : 퇴직 
SELECT * FROM T_COM_CD_LRGCLAS;
SELECT * FROM T_COM_CD_LRGCLAS_POLYGLOT;
SELECT * FROM T_COM_CD_SMLCLAS;
       
 DESC T_COM_CD_LRGCLAS;
 DESC T_COM_CD_SMLCLAS;

SELECT L.LRGCLAS_CD ,         L.LRGCLAS_CD_NM ,        L.SRT_SEQ ,       L.USE_YN ,       L.CD_KIND_DVCD ,       L.USE_MDLE_DVCD ,       S.SMLCLAS_CD ,       S.SMLCLAS_CD_NM ,       S.SRT_SEQ ,       S.USE_YN  FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND S.SMLCLAS_CD_NM LIKE '퇴직'     ;
    
------------------------------------------------------------------------------------------------------------------------------------     
-- T_USR : 사용자 
SELECT *   FROM SEIZE_BASE.T_USR;
 
SELECT 
USR_ID,              /* 사용자 ID : 사번 */        USR_NM,              /* 성명 */                ORG_CD,              /* 조직 코드  */
CNSLR_GRD,           /* 상담사 등급  */            OFDY_CD,             /* 직무 코드 */            POSN_CD,             /* 직위 코드 */
OFLV_CD,             /* 직급 코드 */               POST_CD,             /* 직책 코드 */            OFDY_GAZE_DT,        /* 직무 발령 일자 */
POST_GAZE_DT,        /* 직위 발령 일자 */          LVCO_YN,             /* 퇴사 여부 */             LVCO_DT,             /* 퇴사 일자 */
LVCO_RSN_DVCD,       /* 퇴사 사유 구분코드 */       ETCO_DT,             /* 입사 일자 */             AREA_CD,             /* 지역 코드 */
RMK                  /* 비고 */ 
    FROM SEIZE_BASE.T_USR
    
;

------------------------------------------------------------------------------------------------------------------------------------     

-- 센터 
SELECT * FROM T_ORG WHERE ORG_NM LIKE 'SEIZE Center';

-- 센터 > 그룹 > 팀 레벨 정리 
SELECT ORG_NM   ,CNTR_ORG_CD ,PRTS_ORG_CD ,ORG_CD ,ORG_PATH_NM ,SRT_SEQ ,ORG_LVL FROM T_ORG START WITH ORG_LVL = '0'  CONNECT BY PRIOR ORG_CD = PRTS_ORG_CD AND ROWNUM <= '3';

-- 센터 > 그룹 > 팀 레벨 정리 
--SELECT ORG_CD,ORG_NM,ORG_LVL FROM T_ORG where org_cd = '101010'

SELECT ORG_NM 
,decode(org_cd, 
'10' , (select org_nm from t_org where org_cd = '10'), 
'1020' , (select org_nm from t_org where org_cd = '1020'), 
'1030' , (select org_nm from t_org where org_cd = '1030'), 
'1010' , (select org_nm from t_org where org_cd = '1010'), 
'102020' , (select org_nm from t_org where org_cd = '102020'), 
'102040' , (select org_nm from t_org where org_cd = '102040'),
'101010' , (select org_nm from t_org where org_cd = '101010'),
'102010' , (select org_nm from t_org where org_cd = '102010'),
'103010' , (select org_nm from t_org where org_cd = '103010'),
'103020' , (select org_nm from t_org where org_cd = '103020')
) 실
FROM T_ORG ;

-- 조직레벨 조회 구분, 통계 조회조건으로 사용
SELECT *   FROM T_COM_CD_LRGCLAS where LRGCLAS_CD = 'ORG_LVL_SRCH_DV' ;
SELECT L.LRGCLAS_CD_NM, S.SMLCLAS_CD , S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분'   ;
SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분' AND SMLCLAS_CD = 'TEAM'   ;



------------------------------------------------------------------------------------------------------------------------------------     

-- 직무 
SELECT L.LRGCLAS_CD, L.LRGCLAS_CD_NM, S.LRGCLAS_CD, S.SMLCLAS_CD , S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '직무'   ;

-- 직책 
SELECT L.LRGCLAS_CD, L.LRGCLAS_CD_NM, S.LRGCLAS_CD, S.SMLCLAS_CD , S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L  INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책';

-- 직급코드
SELECT L.LRGCLAS_CD, L.LRGCLAS_CD_NM, S.LRGCLAS_CD, S.SMLCLAS_CD , S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드';

-- 직책 명 구하기 
SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '001' ;

------------------------------------------------------------------------------------------------------------------------------------     


------------------------------------------------------------------------------------------------------------------------------------     
-- 발행일자 기간 기준 조회 그리드 

SELECT 
USR_ID 사번,              /* 사용자 ID : 사번 */
USR_NM 성명,              /* 성명 */
(SELECT org_nm FROM T_ORG WHERE ORG_NM LIKE 'SEIZE Center') AS  센터 ,
decode(org_cd,  
'10' , (select org_nm from t_org where org_cd = '10'), null,
'1020' , (select org_nm from t_org where org_cd = '1020'), null,
'1030' , (select org_nm from t_org where org_cd = '1030'), null,
'1010' , (select org_nm from t_org where org_cd = '1010'), null,
'102020' , (select org_nm from t_org where org_cd = '102020'), null,
'102040' , (select org_nm from t_org where org_cd = '102040'),null,
'101010' , (select org_nm from t_org where org_cd = '101010'),null,
'102010' , (select org_nm from t_org where org_cd = '102010'),null,
'103010' , (select org_nm from t_org where org_cd = '103010'),null,
'103020' , (select org_nm from t_org where org_cd = '103020')
) as "실_그룹명" ,
decode(org_cd,  
'1020' , (select org_nm from t_org where org_cd = '1020'),null,
'1030' , (select org_nm from t_org where org_cd = '1030'), null,
'1010' , (select org_nm from t_org where org_cd = '1010'),null,
'102020' , (SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분' AND SMLCLAS_CD = 'TEAM' ), null,
'102040' , (SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분' AND SMLCLAS_CD = 'TEAM' ),null,
'101010' , (SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분' AND SMLCLAS_CD = 'TEAM' ),null,
'102010' , (SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분' AND SMLCLAS_CD = 'TEAM' ),null,
'103010' , (SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분' AND SMLCLAS_CD = 'TEAM' ),null,
'103020' , (SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분' AND SMLCLAS_CD = 'TEAM' )
) as "실2_팀명",
DECODE(POST_CD,      /* 직책명 코드 --POST_CD 직책코드 */
                '001', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '001'),
                '002', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '002'),
                '003', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '003'),
                '004', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '004'))  AS 직책 ,            
DECODE(OFDY_CD,          /* 직무명 코드 */
--(SELECT L.LRGCLAS_CD, L.LRGCLAS_CD_NM, S.LRGCLAS_CD, S.SMLCLAS_CD , S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' )
'001',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='001' ),
'002',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='002' ),
'003',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='003' ),
'004',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='004' ),
'005',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='005' ),
'006',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='006' ),
'007',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='007' ),
'008',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='008' )) AS 직무,
--POSN_CD,             /* 직위 코드 */
--OFLV_CD,             /* 직급 코드 */
OFDY_GAZE_DT AS 직무발령일자,        /* 직무 발령 일자 */
POST_GAZE_DT AS 직위발령일자,        /* 직위 발령 일자 */
LVCO_YN AS 퇴사여부,             /* 퇴사 여부 */
LVCO_DT AS 퇴사일자,             /* 퇴사 일자 */
LVCO_RSN_DVCD as 퇴직구분,       /* 퇴사 사유 구분코드 */
ETCO_DT 입사일             /* 입사 일자 */
--RMK  비고               /* 비고 */
FROM 
SEIZE_BASE.T_USR
WHERE POST_CD IS NOT NULL
;

------------------------------------------------------------------------------------------------------------------------------------     
-- 발령대상 리스트 (전체조회)
SELECT 
			(SELECT org_nm FROM T_ORG WHERE ORG_NM LIKE 'SEIZE Center') AS  CENTER , /* 센터  */
			decode(org_cd,  
			'10' , (select org_nm from t_org where org_cd = '10'), 
			'1020' , (select org_nm from t_org where org_cd = '1020'),
			'1030' , (select org_nm from t_org where org_cd = '1030'),
			'1010' , (select org_nm from t_org where org_cd = '1010'),
			'102020' , (select org_nm from t_org where org_cd = '102020'),
			'102040' , (select org_nm from t_org where org_cd = '102040'),
			'101010' , (select org_nm from t_org where org_cd = '101010'),
			'102010' , (select org_nm from t_org where org_cd = '102010'),
			'103010' , (select org_nm from t_org where org_cd = '103010'),
			'103020' , (select org_nm from t_org where org_cd = '103020')
			) as TEAM ,				/* 실  */
			USR_ID ,              /* 사번  */
			USR_NM ,              /* 성명 */
			DECODE(OFLV_CD, 
			'02', (SELECT S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드' WHERE SMLCLAS_CD = '02')
			,'03',(SELECT S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드' WHERE SMLCLAS_CD = '03')
			,'04',(SELECT S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드' WHERE SMLCLAS_CD = '04')
			,'05',(SELECT S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드' WHERE SMLCLAS_CD = '05')
			) OFLV_CD_NM,          /* OFLV_CD_NM */
			
			DECODE(POST_CD,      /* 직책명 코드 --POST_CD 직책코드 */
			                '001', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '001'),
			                '002', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '002'),
			                '003', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '003'),
			                '004', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '004'))  AS POST_CD_NM ,            
			DECODE(OFDY_CD,          /* 직무명 코드 */
			'001',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='001' ),
			'002',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='002' ),
			'003',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='003' ),
			'004',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='004' ),
			'005',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='005' ),
			'006',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='006' ),
			'007',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='007' ),
			'008',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='008' )) AS OFDY_CD_NM,
			ETCO_DT             /* 입사 일자 */
			FROM 
			SEIZE_BASE.T_USR
     
--WHERE POST_CD IS NOT NULL
;
------------------------------------------------------------------------------------------------------------------------------------     
select * from t_org;


-- 직무 
SELECT L.LRGCLAS_CD, L.LRGCLAS_CD_NM, S.LRGCLAS_CD, S.SMLCLAS_CD , S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '직무'   ;

-- 조직레벨 조회 구분, 통계 조회조건으로 사용
SELECT *   FROM T_COM_CD_LRGCLAS where LRGCLAS_CD = 'ORG_LVL_SRCH_DV' ;
SELECT L.LRGCLAS_CD, L.LRGCLAS_CD_NM, S.LRGCLAS_CD, S.SMLCLAS_CD , S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L    INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD    AND L.LRGCLAS_CD_NM = '조직레벨 조회 구분'   ;
select org_cd, org_nm from t_org
;


 
 
 -- 인사 경력 내역
 SELECT * FROM SEIZE_WFMS.T_HR_CARR_PTCL;