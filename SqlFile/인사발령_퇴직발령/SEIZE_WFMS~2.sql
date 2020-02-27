

SELECT * FROM seize_wfms.T_HR_GAZE_INFO_PTCL ;




 
------------------------------------------------------------------------------------------------------------------------------------     
-- 발령대상 리스트 (전체조회)

SELECT 
(SELECT org_nm FROM T_ORG WHERE ORG_NM LIKE 'SEIZE Center') AS  센터 ,
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
) as 실 ,
USR_ID 사번,              /* 사용자 ID : 사번 */
USR_NM 성명,              /* 성명 */
DECODE(OFLV_CD, 
'02', (SELECT S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드' WHERE SMLCLAS_CD = '02')
,'03',(SELECT S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드' WHERE SMLCLAS_CD = '03')
,'04',(SELECT S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드' WHERE SMLCLAS_CD = '04')
,'05',(SELECT S.SMLCLAS_CD_NM FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직급코드' WHERE SMLCLAS_CD = '05')
) 직급명,

DECODE(POST_CD,      /* 직책명 코드 --POST_CD 직책코드 */
                '001', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '001'),
                '002', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '002'),
                '003', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '003'),
                '004', (SELECT  s.smlclas_cd_nm FROM T_COM_CD_LRGCLAS L INNER JOIN T_COM_CD_SMLCLAS S ON L.LRGCLAS_CD = S.LRGCLAS_CD AND L.LRGCLAS_CD_NM = '직책' AND s.smlclas_cd = '004'))  AS 직책 ,            
DECODE(OFDY_CD,          /* 직무명 코드 */
'001',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='001' ),
'002',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='002' ),
'003',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='003' ),
'004',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='004' ),
'005',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='005' ),
'006',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='006' ),
'007',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='007' ),
'008',(SELECT S.SMLCLAS_CD_NM   FROM T_COM_CD_LRGCLAS L   INNER JOIN T_COM_CD_SMLCLAS S   ON L.LRGCLAS_CD = S.LRGCLAS_CD   AND L.LRGCLAS_CD_NM = '직무' WHERE S.SMLCLAS_CD ='008' )) AS 직무,
ETCO_DT 입사일             /* 입사 일자 */
--RMK  비고               /* 비고 */
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



















