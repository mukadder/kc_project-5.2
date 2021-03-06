set define off

ALTER TABLE KRNS_ATT_T MODIFY ATT_TYP_CD VARCHAR2 (40) ;

UPDATE KRIM_ATTR_DEFN_T 
SET APPL_URL='${application.url}';

COMMIT;

DROP TABLE KREW_APP_CNST_T;

DROP TABLE KRNS_DOC_TYP_T CASCADE CONSTRAINTS;

DROP SEQUENCE KRIM_ROLE_REL_ID_S;

INSERT INTO KRNS_PARM_T (CONS_CD, NMSPC_CD, OBJ_ID, PARM_DESC_TXT, PARM_DTL_TYP_CD, PARM_NM, PARM_TYP_CD, TXT, VER_NBR)
VALUES('A', 'KR-NS', SYS_GUID () , 'A semi-colon delimted list of strings representing date formats that the DateTimeService will use to parse dates when DateTimeServiceImpl.convertToSqlDate(String) or DateTimeServiceImpl.convertToDate(String) is called. Note that patterns will be applied in the order listed (and the first applicable one will be used). For a more technical description of how characters in the parameter value will be interpreted, please consult the javadocs for java.text.SimpleDateFormat. Any changes will be applied when the application is restarted.', 'All', 'STRING_TO_DATE_FORMATS', 'CONFG', 'MM/dd/yy;MM-dd-yy;MMMM dd, yyyy;MMddyy', 1) ;

INSERT INTO KRNS_PARM_T (CONS_CD, NMSPC_CD, OBJ_ID, PARM_DESC_TXT, PARM_DTL_TYP_CD, PARM_NM, PARM_TYP_CD, TXT, VER_NBR)
VALUES('A', 'KR-NS', SYS_GUID () , 'A single date format string that the DateTimeService will use to format dates to be used in a file name when DateTimeServiceImpl.toDateStringForFilename(Date) is called. For a more technical description of how characters in the parameter value will be interpreted, please consult the javadocs for java.text.SimpleDateFormat. Any changes will be applied when the application is restarted.', 'All', 'DATE_TO_STRING_FORMAT_FOR_FILE_NAME', 'CONFG', 'yyyyMMdd', 1) ;

INSERT INTO KRNS_PARM_T (CONS_CD, NMSPC_CD, OBJ_ID, PARM_DESC_TXT, PARM_DTL_TYP_CD, PARM_NM, PARM_TYP_CD, TXT, VER_NBR)
VALUES('A', 'KR-NS', SYS_GUID () , 'A single date format string that the DateTimeService will use to format a date and time string to be used in a file name when DateTimeServiceImpl.toDateTimeStringForFilename(Date) is called.. For a more technical description of how characters in the parameter value will be interpreted, please consult the javadocs for java.text.SimpleDateFormat. Any changes will be applied when the application is restarted.', 'All', 'TIMESTAMP_TO_STRING_FORMAT_FOR_FILE_NAME', 'CONFG', 'yyyyMMdd-HH-mm-ss-S', 1) ;

INSERT INTO KRNS_PARM_T (CONS_CD, NMSPC_CD, OBJ_ID, PARM_DESC_TXT, PARM_DTL_TYP_CD, PARM_NM, PARM_TYP_CD, TXT, VER_NBR)
VALUES('A', 'KR-NS', SYS_GUID () , 'A single date format string that the DateTimeService will use to format a date to be displayed on a web page. For a more technical description of how characters in the parameter value will be interpreted, please consult the javadocs for java.text.SimpleDateFormat. Any changes will be applied when the application is restarted.', 'All', 'DATE_TO_STRING_FORMAT_FOR_USER_INTERFACE', 'CONFG', 'MM/dd/yyyy', 1) ;

INSERT INTO KRNS_PARM_T (CONS_CD, NMSPC_CD, OBJ_ID, PARM_DESC_TXT, PARM_DTL_TYP_CD, PARM_NM, PARM_TYP_CD, TXT, VER_NBR)
VALUES('A', 'KR-NS', SYS_GUID () , 'A single date format string that the DateTimeService will use to format a date and time to be displayed on a web page. For a more technical description of how characters in the parameter value will be interpreted, please consult the javadocs for java.text.SimpleDateFormat. Any changes will be applied when the application is restarted.', 'All', 'TIMESTAMP_TO_STRING_FORMAT_FOR_USER_INTERFACE', 'CONFG', 'MM/dd/yyyy hh:mm a', 1) ;

INSERT INTO KRNS_PARM_T (CONS_CD, NMSPC_CD, OBJ_ID, PARM_DESC_TXT, PARM_DTL_TYP_CD, PARM_NM, PARM_TYP_CD, TXT, VER_NBR)
VALUES('A', 'KR-NS', SYS_GUID () , 'A semi-colon delimted list of strings representing date formats that the DateTimeService will use to parse date and times when DateTimeServiceImpl.convertToDateTime(String) or DateTimeServiceImpl.convertToSqlTimestamp(String) is called. Note that patterns will be applied in the order listed (and the first applicable one will be used). For a more technical description of how characters in the parameter value will be interpreted, please consult the javadocs for java.text.SimpleDateFormat. Any changes will be applied when the application is restarted.', 'All', 'STRING_TO_TIMESTAMP_FORMATS', 'CONFG', 'MM/dd/yyyy hh:mm a', 1) ;

COMMIT;

UPDATE KREW_DOC_TYP_T 
SET DOC_TYP_NM='NamespaceMaintenanceDocument', 
    LBL='Namespace' 
WHERE DOC_TYP_NM = 'ParameterNamespaceMaintenanceDocument';

COMMIT;

UPDATE KRIM_ENTITY_NM_T 
SET NM_TYP_CD='PRFR' 
WHERE NM_TYP_CD = 'PFRD';

UPDATE KRIM_ENTITY_EMAIL_T 
SET EMAIL_TYP_CD='WRK' 
WHERE EMAIL_TYP_CD = 'CAMPUS';

COMMIT;

ALTER TABLE KRIM_PND_DLGN_MT RENAME TO KRIM_PND_DLGN_T;

ALTER TABLE KRIM_PND_ROLE_RSP_ACTN_MT ADD IGNORE_PREV_IND varchar2 (1) NULL;

;ALTER TABLE KRIM_DLGN_MBR_ATTR_DATA_T RENAME COLUMN TARGET_PRIMARY_KEY TO DLGN_MBR_ID;

ALTER TABLE KRIM_GRP_ATTR_DATA_T RENAME COLUMN TARGET_PRIMARY_KEY TO GRP_ID;

ALTER TABLE KRIM_PERM_ATTR_DATA_T RENAME COLUMN TARGET_PRIMARY_KEY TO PERM_ID;

ALTER TABLE KRIM_ROLE_MBR_ATTR_DATA_T RENAME COLUMN TARGET_PRIMARY_KEY TO ROLE_MBR_ID;

ALTER TABLE KRIM_PND_ROLE_MBR_ATTR_DATA_MT RENAME COLUMN TARGET_PRIMARY_KEY TO ROLE_MBR_ID;

ALTER TABLE KRIM_RSP_ATTR_DATA_T RENAME COLUMN TARGET_PRIMARY_KEY TO RSP_ID;

ALTER TABLE KRIM_PND_DLGN_MBR_ATTR_DATA_T RENAME COLUMN TARGET_PRIMARY_KEY TO DLGN_MBR_ID;

ALTER TABLE KRIM_PND_GRP_ATTR_DATA_T RENAME COLUMN TARGET_PRIMARY_KEY TO GRP_ID;

DROP VIEW KRIM_PERM_ATTR_V;

DROP VIEW KRIM_PERM_V;

DROP VIEW KRIM_ROLE_PERM_V;

ALTER TABLE KREW_DOC_HDR_EXT_FLT_T MODIFY VAL NUMBER (30, 15) ;

ALTER TABLE KRNS_PARM_T DROP COLUMN GRP_NM;

ALTER TABLE KRNS_PARM_T DROP COLUMN ACTV_IND;

ALTER TABLE KRNS_PARM_T MODIFY PARM_NM VARCHAR2 (255) ;

DECLARE constraint_name varchar2(500);sql_stm varchar2(2000);BEGIN SQL_STM := 'select distinct constraint_name from user_constraints where table_name = upper(:1) and constraint_type = :2';EXECUTE IMMEDIATE SQL_STM INTO CONSTRAINT_NAME USING 'krns_parm_t','P';SQL_STM := 'alter table krns_parm_t drop constraint '||CONSTRAINT_NAME||' cascade';EXECUTE IMMEDIATE SQL_STM;END;/ 

ALTER TABLE KRNS_PARM_T 
    ADD CONSTRAINT KRNS_PARM_TP1 
            PRIMARY KEY (NMSPC_CD, PARM_DTL_TYP_CD, PARM_NM) ;

ALTER TABLE KRIM_ROLE_DOCUMENT_T DROP COLUMN ROLE_TYP_NAME;

ALTER TABLE KRIM_ATTR_DEFN_T DROP COLUMN SRVC_NM;

ALTER TABLE KRIM_ROLE_RSP_ACTN_T DROP COLUMN RSP_ID;

ALTER TABLE KRIM_ROLE_RSP_ACTN_T DROP COLUMN ROLE_ID;

ALTER TABLE KRIM_ROLE_RSP_ACTN_T DROP COLUMN GRP_ID;

ALTER TABLE KRIM_ROLE_RSP_ACTN_T DROP COLUMN PRNCPL_ID;

ALTER TABLE KRIM_ROLE_RSP_ACTN_T MODIFY ROLE_RSP_ID NULL;

UPDATE krns_parm_t 
SET PARM_NM='EMAIL_NOTIFICATION_TEST_ADDRESS' 
WHERE PARM_NM = 'EMAIL_NOTIFICATION_TEST_ADDRESS ';

CREATE OR REPLACE VIEW KRIM_GRP_MBR_V(NMSPC_CD,GRP_NM,GRP_ID,PRNCPL_NM,PRNCPL_ID,MBR_GRP_NM,MBR_GRP_ID) AS 
SELECT G.NMSPC_CD,G.GRP_NM,G.GRP_ID,P.PRNCPL_NM,P.PRNCPL_ID,MG.GRP_NM AS 
                                                            MBR_GRP_NM,MG.GRP_ID AS MBR_GRP_ID FROM KRIM_GRP_MBR_T GM LEFT JOIN KRIM_GRP_T G ON G.GRP_ID=GM.GRP_ID LEFT OUTER JOIN KRIM_GRP_T MG ON MG.GRP_ID=GM.MBR_ID AND GM.MBR_TYP_CD='G' LEFT OUTER JOIN KRIM_PRNCPL_T P ON P.PRNCPL_ID=GM.MBR_ID AND GM.MBR_TYP_CD='P' LEFT OUTER JOIN KRIM_ENTITY_NM_T EN ON EN.ENTITY_ID=P.ENTITY_ID AND EN.DFLT_IND='Y' AND EN.ACTV_IND='Y' ORDER BY NMSPC_CD,GRP_NM,PRNCPL_NM;

CREATE OR REPLACE VIEW KRIM_GRP_V(NMSPC_CD,GRP_NM,GRP_ID,GRP_TYP_NM,ATTR_NM,ATTR_VAL) AS 
SELECT G.NMSPC_CD,G.GRP_NM,G.GRP_ID,T.NM AS 
                                    GRP_TYP_NM,A.NM AS 
                                               ATTR_NM,D.ATTR_VAL AS ATTR_VAL FROM KRIM_GRP_T G LEFT OUTER JOIN KRIM_GRP_ATTR_DATA_T D ON D.GRP_ID=G.GRP_ID LEFT OUTER JOIN KRIM_ATTR_DEFN_T A ON A.KIM_ATTR_DEFN_ID=D.KIM_ATTR_DEFN_ID LEFT OUTER JOIN KRIM_TYP_T T ON G.KIM_TYP_ID=T.KIM_TYP_ID;

CREATE OR REPLACE VIEW KRIM_PERM_ATTR_V(TMPL_NMSPC_CD,TMPL_NM,PERM_TMPL_ID,PERM_NMSPC_CD,PERM_NM,PERM_ID,ATTR_NM,ATTR_VAL) AS 
SELECT T.NMSPC_CD AS 
       TMPL_NMSPC_CD,T.NM AS 
                     TMPL_NM,T.PERM_TMPL_ID,P.NMSPC_CD AS 
                                            PERM_NMSPC_CD,P.NM AS 
                                                          PERM_NM,P.PERM_ID,A.NM AS 
                                                                            ATTR_NM,AD.ATTR_VAL AS ATTR_VAL FROM KRIM_PERM_T P LEFT JOIN KRIM_PERM_TMPL_T T ON P.PERM_TMPL_ID=T.PERM_TMPL_ID LEFT OUTER JOIN KRIM_PERM_ATTR_DATA_T AD ON P.PERM_ID=AD.PERM_ID LEFT OUTER JOIN KRIM_ATTR_DEFN_T A ON AD.KIM_ATTR_DEFN_ID=A.KIM_ATTR_DEFN_ID ORDER BY TMPL_NMSPC_CD,TMPL_NM,PERM_NMSPC_CD,PERM_ID,ATTR_NM;

CREATE OR REPLACE VIEW KRIM_PERM_V(TMPL_NMSPC_CD,TMPL_NM,PERM_TMPL_ID,PERM_NMSPC_CD,PERM_NM,PERM_ID,PERM_TYP_NM,SRVC_NM) AS 
SELECT T.NMSPC_CD AS 
       TMPL_NMSPC_CD,T.NM AS 
                     TMPL_NM,T.PERM_TMPL_ID,P.NMSPC_CD AS 
                                            PERM_NMSPC_CD,P.NM AS 
                                                          PERM_NM,P.PERM_ID,TYP.NM AS 
                                                                            PERM_TYP_NM,TYP.SRVC_NM FROM KRIM_PERM_T P INNER JOIN KRIM_PERM_TMPL_T T ON P.PERM_TMPL_ID=T.PERM_TMPL_ID LEFT OUTER JOIN KRIM_TYP_T TYP ON T.KIM_TYP_ID=TYP.KIM_TYP_ID;

CREATE OR REPLACE VIEW KRIM_PRNCPL_V(PRNCPL_ID,PRNCPL_NM,FIRST_NM,LAST_NM,AFLTN_TYP_CD,CAMPUS_CD,EMP_STAT_CD,EMP_TYP_CD) AS 
SELECT P.PRNCPL_ID,P.PRNCPL_NM,EN.FIRST_NM,EN.LAST_NM,EA.AFLTN_TYP_CD,EA.CAMPUS_CD,EEI.EMP_STAT_CD,EEI.EMP_TYP_CD FROM KRIM_PRNCPL_T P LEFT OUTER JOIN KRIM_ENTITY_EMP_INFO_T EEI ON EEI.ENTITY_ID=P.ENTITY_ID LEFT OUTER JOIN KRIM_ENTITY_AFLTN_T EA ON EA.ENTITY_ID=P.ENTITY_ID LEFT OUTER JOIN KRIM_ENTITY_NM_T EN ON P.ENTITY_ID=EN.ENTITY_ID AND 'Y'=EN.DFLT_IND;

CREATE OR REPLACE VIEW KRIM_ROLE_GRP_V(NMSPC_CD,ROLE_NM,ROLE_ID,GRP_NMSPC_CD,GRP_NM,ROLE_MBR_ID,ATTR_NM,ATTR_VAL) AS 
SELECT R.NMSPC_CD,R.ROLE_NM,R.ROLE_ID,G.NMSPC_CD AS 
                                      GRP_NMSPC_CD,G.GRP_NM,RM.ROLE_MBR_ID,A.NM AS 
                                                                           ATTR_NM,D.ATTR_VAL AS ATTR_VAL FROM KRIM_ROLE_MBR_T RM LEFT JOIN KRIM_ROLE_T R ON R.ROLE_ID=RM.ROLE_ID LEFT JOIN KRIM_GRP_T G ON G.GRP_ID=RM.MBR_ID LEFT OUTER JOIN KRIM_ROLE_MBR_ATTR_DATA_T D ON D.ROLE_MBR_ID=RM.ROLE_MBR_ID LEFT OUTER JOIN KRIM_ATTR_DEFN_T A ON A.KIM_ATTR_DEFN_ID=D.KIM_ATTR_DEFN_ID WHERE RM.MBR_TYP_CD='G' ORDER BY NMSPC_CD,ROLE_NM,GRP_NMSPC_CD,GRP_NM,ROLE_MBR_ID,ATTR_NM;

CREATE OR REPLACE VIEW KRIM_ROLE_PERM_V(NMSPC_CD,ROLE_NM,ROLE_ID,TMPL_NMSPC_CD,TMPL_NM,PERM_TMPL_ID,PERM_NMPSC_CD,PERM_NM,PERM_ID,ATTR_NM,ATTR_VAL) AS 
SELECT R.NMSPC_CD,R.ROLE_NM,R.ROLE_ID,PT.NMSPC_CD AS 
                                      TMPL_NMSPC_CD,PT.NM AS 
                                                    TMPL_NM,PT.PERM_TMPL_ID,P.NMSPC_CD AS 
                                                                            PERM_NMPSC_CD,P.NM AS 
                                                                                          PERM_NM,P.PERM_ID,A.NM AS 
                                                                                                            ATTR_NM,AD.ATTR_VAL AS ATTR_VAL FROM KRIM_PERM_T P LEFT JOIN KRIM_PERM_TMPL_T PT ON P.PERM_TMPL_ID=PT.PERM_TMPL_ID LEFT OUTER JOIN KRIM_PERM_ATTR_DATA_T AD ON P.PERM_ID=AD.PERM_ID LEFT OUTER JOIN KRIM_ATTR_DEFN_T A ON AD.KIM_ATTR_DEFN_ID=A.KIM_ATTR_DEFN_ID LEFT OUTER JOIN KRIM_ROLE_PERM_T RP ON RP.PERM_ID=P.PERM_ID LEFT OUTER JOIN KRIM_ROLE_T R ON RP.ROLE_ID=R.ROLE_ID ORDER BY NMSPC_CD,ROLE_NM,TMPL_NMSPC_CD,TMPL_NM,PERM_ID,ATTR_NM;

CREATE OR REPLACE VIEW KRIM_ROLE_PRNCPL_V(NMSPC_CD,ROLE_NM,ROLE_ID,PRNCPL_NM,PRNCPL_ID,FIRST_NM,LAST_NM,ROLE_MBR_ID,ATTR_NM,ATTR_VAL) AS 
SELECT R.NMSPC_CD,R.ROLE_NM,R.ROLE_ID,P.PRNCPL_NM,P.PRNCPL_ID,EN.FIRST_NM,EN.LAST_NM,RM.ROLE_MBR_ID,AD.NM AS 
                                                                                                    ATTR_NM,RMAD.ATTR_VAL AS ATTR_VAL FROM KRIM_ROLE_T R LEFT OUTER JOIN KRIM_ROLE_MBR_T RM ON R.ROLE_ID=RM.ROLE_ID LEFT OUTER JOIN KRIM_ROLE_MBR_ATTR_DATA_T RMAD ON RM.ROLE_MBR_ID=RMAD.ROLE_MBR_ID LEFT OUTER JOIN KRIM_ATTR_DEFN_T AD ON RMAD.KIM_ATTR_DEFN_ID=AD.KIM_ATTR_DEFN_ID LEFT OUTER JOIN KRIM_PRNCPL_T P ON RM.MBR_ID=P.PRNCPL_ID AND RM.MBR_TYP_CD='P' LEFT OUTER JOIN KRIM_ENTITY_NM_T EN ON P.ENTITY_ID=EN.ENTITY_ID WHERE (EN.DFLT_IND='Y') ORDER BY NMSPC_CD,ROLE_NM,PRNCPL_NM,RM.ROLE_MBR_ID,ATTR_NM;

CREATE OR REPLACE VIEW KRIM_ROLE_ROLE_V(NMSPC_CD,ROLE_NM,ROLE_ID,MBR_ROLE_NMSPC_CD,MBR_ROLE_NM,MBR_ROLE_ID,ROLE_MBR_ID,ATTR_NM,ATTR_VAL) AS 
SELECT R.NMSPC_CD,R.ROLE_NM,R.ROLE_ID,MR.NMSPC_CD AS 
                                      MBR_ROLE_NMSPC_CD,MR.ROLE_NM AS 
                                                        MBR_ROLE_NM,MR.ROLE_ID AS 
                                                                    MBR_ROLE_ID,RM.ROLE_MBR_ID,A.NM AS 
                                                                                               ATTR_NM,D.ATTR_VAL AS ATTR_VAL FROM KRIM_ROLE_MBR_T RM LEFT JOIN KRIM_ROLE_T R ON R.ROLE_ID=RM.ROLE_ID LEFT JOIN KRIM_ROLE_T MR ON MR.ROLE_ID=RM.MBR_ID LEFT OUTER JOIN KRIM_ROLE_MBR_ATTR_DATA_T D ON D.ROLE_MBR_ID=RM.ROLE_MBR_ID LEFT OUTER JOIN KRIM_ATTR_DEFN_T A ON A.KIM_ATTR_DEFN_ID=D.KIM_ATTR_DEFN_ID WHERE RM.MBR_TYP_CD='R' ORDER BY NMSPC_CD,ROLE_NM,MBR_ROLE_NMSPC_CD,MBR_ROLE_NM,ROLE_MBR_ID,ATTR_NM;

CREATE OR REPLACE VIEW KRIM_ROLE_V(NMSPC_CD,ROLE_NM,ROLE_ID,ROLE_TYP_NM,SRVC_NM,KIM_TYP_ID) AS 
SELECT R.NMSPC_CD,R.ROLE_NM,R.ROLE_ID,T.NM AS 
                                      ROLE_TYP_NM,T.SRVC_NM,T.KIM_TYP_ID FROM KRIM_ROLE_T R,KRIM_TYP_T T WHERE T.KIM_TYP_ID=R.KIM_TYP_ID AND R.ACTV_IND='Y' ORDER BY NMSPC_CD,ROLE_NM;

CREATE OR REPLACE VIEW KRIM_RSP_ATTR_V(RESPONSIBILITY_TYPE_NAME,RSP_TEMPLATE_NAME,RSP_NAMESPACE_CODE,RSP_NAME,RSP_ID,ATTRIBUTE_NAME,ATTRIBUTE_VALUE) AS 
SELECT KRIM_TYP_T.NM AS 
       RESPONSIBILITY_TYPE_NAME,KRIM_RSP_TMPL_T.NM AS 
                                RSP_TEMPLATE_NAME,KRIM_RSP_T.NMSPC_CD AS 
                                                  RSP_NAMESPACE_CODE,KRIM_RSP_T.NM AS 
                                                                     RSP_NAME,KRIM_RSP_T.RSP_ID AS 
                                                                              RSP_ID,KRIM_ATTR_DEFN_T.NM AS 
                                                                                     ATTRIBUTE_NAME,KRIM_RSP_ATTR_DATA_T.ATTR_VAL AS ATTRIBUTE_VALUE FROM KRIM_RSP_T KRIM_RSP_T INNER JOIN KRIM_RSP_ATTR_DATA_T KRIM_RSP_ATTR_DATA_T ON KRIM_RSP_T.RSP_ID=KRIM_RSP_ATTR_DATA_T.RSP_ID INNER JOIN KRIM_ATTR_DEFN_T KRIM_ATTR_DEFN_T ON KRIM_RSP_ATTR_DATA_T.KIM_ATTR_DEFN_ID=KRIM_ATTR_DEFN_T.KIM_ATTR_DEFN_ID INNER JOIN KRIM_RSP_TMPL_T KRIM_RSP_TMPL_T ON KRIM_RSP_T.RSP_TMPL_ID=KRIM_RSP_TMPL_T.RSP_TMPL_ID INNER JOIN KRIM_TYP_T KRIM_TYP_T ON KRIM_RSP_TMPL_T.KIM_TYP_ID=KRIM_TYP_T.KIM_TYP_ID ORDER BY RSP_TEMPLATE_NAME,RSP_NAME,ATTRIBUTE_NAME;

CREATE OR REPLACE VIEW KRIM_RSP_ROLE_ACTN_V(RSP_NMSPC_CD,RSP_ID,NMSPC_CD,ROLE_NM,ROLE_ID,MBR_ID,MBR_TYP_CD,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,IGNORE_PREV_IND,PRIORITY_NBR) AS 
SELECT RSP.NMSPC_CD AS 
       RSP_NMSPC_CD,RSP.RSP_ID,R.NMSPC_CD,R.ROLE_NM,RR.ROLE_ID,RM.MBR_ID,RM.MBR_TYP_CD,RM.ROLE_MBR_ID,ACTN.ACTN_TYP_CD,ACTN.ACTN_PLCY_CD,ACTN.IGNORE_PREV_IND,ACTN.PRIORITY_NBR FROM KRIM_RSP_T RSP LEFT JOIN KRIM_RSP_TMPL_T RSPT ON RSP.RSP_TMPL_ID=RSPT.RSP_TMPL_ID LEFT OUTER JOIN KRIM_ROLE_RSP_T RR ON RR.RSP_ID=RSP.RSP_ID LEFT OUTER JOIN KRIM_ROLE_MBR_T RM ON RM.ROLE_ID=RR.ROLE_ID LEFT OUTER JOIN KRIM_ROLE_RSP_ACTN_T ACTN ON ACTN.ROLE_RSP_ID=RR.ROLE_RSP_ID AND (ACTN.ROLE_MBR_ID=RM.ROLE_MBR_ID OR ACTN.ROLE_MBR_ID='*') LEFT OUTER JOIN KRIM_ROLE_T R ON RR.ROLE_ID=R.ROLE_ID ORDER BY RSP_NMSPC_CD,RSP_ID,ROLE_ID,ROLE_MBR_ID;

CREATE OR REPLACE VIEW KRIM_RSP_ROLE_V(RSP_TMPL_NMSPC_CD,RSP_TMPL_NM,RSP_NMSPC_CD,RSP_NM,RSP_ID,ATTR_NM,ATTR_VAL,NMSPC_CD,ROLE_NM,ROLE_ID) AS 
SELECT RSPT.NMSPC_CD AS 
       RSP_TMPL_NMSPC_CD,RSPT.NM AS 
                         RSP_TMPL_NM,RSP.NMSPC_CD AS 
                                     RSP_NMSPC_CD,RSP.NM AS 
                                                  RSP_NM,RSP.RSP_ID,A.NM AS 
                                                                    ATTR_NM,D.ATTR_VAL,R.NMSPC_CD,R.ROLE_NM,RR.ROLE_ID FROM KRIM_RSP_T RSP LEFT JOIN KRIM_RSP_TMPL_T RSPT ON RSP.RSP_TMPL_ID=RSPT.RSP_TMPL_ID LEFT OUTER JOIN KRIM_RSP_ATTR_DATA_T D ON RSP.RSP_ID=D.RSP_ID LEFT OUTER JOIN KRIM_ATTR_DEFN_T A ON D.KIM_ATTR_DEFN_ID=A.KIM_ATTR_DEFN_ID LEFT OUTER JOIN KRIM_ROLE_RSP_T RR ON RR.RSP_ID=RSP.RSP_ID LEFT OUTER JOIN KRIM_ROLE_T R ON RR.ROLE_ID=R.ROLE_ID ORDER BY RSP_TMPL_NMSPC_CD,RSP_TMPL_NM,RSP_NMSPC_CD,RSP_NM,RSP_ID,ATTR_NM,ATTR_VAL;

ALTER TABLE KREW_ACTN_RQST_T RENAME COLUMN IGN_PREV_ACTN_IND TO FRC_ACTN;

ALTER TABLE KREW_RULE_T RENAME COLUMN IGNR_PRVS TO FRC_ACTN;

ALTER TABLE KRIM_PND_ROLE_RSP_ACTN_MT RENAME COLUMN IGNORE_PREV_IND TO FRC_ACTN;

ALTER TABLE KRIM_ROLE_RSP_ACTN_T RENAME COLUMN IGNORE_PREV_IND TO FRC_ACTN;

CREATE OR REPLACE VIEW KRIM_RSP_ROLE_ACTN_V(RSP_NMSPC_CD,RSP_ID,NMSPC_CD,ROLE_NM,ROLE_ID,MBR_ID,MBR_TYP_CD,ROLE_MBR_ID,ACTN_TYP_CD,ACTN_PLCY_CD,FRC_ACTN,PRIORITY_NBR) AS 
SELECT RSP.NMSPC_CD AS 
       RSP_NMSPC_CD,RSP.RSP_ID,R.NMSPC_CD,R.ROLE_NM,RR.ROLE_ID,RM.MBR_ID,RM.MBR_TYP_CD,RM.ROLE_MBR_ID,ACTN.ACTN_TYP_CD,ACTN.ACTN_PLCY_CD,ACTN.FRC_ACTN,ACTN.PRIORITY_NBR FROM KRIM_RSP_T RSP LEFT JOIN KRIM_RSP_TMPL_T RSPT ON RSP.RSP_TMPL_ID=RSPT.RSP_TMPL_ID LEFT OUTER JOIN KRIM_ROLE_RSP_T RR ON RR.RSP_ID=RSP.RSP_ID LEFT OUTER JOIN KRIM_ROLE_MBR_T RM ON RM.ROLE_ID=RR.ROLE_ID LEFT OUTER JOIN KRIM_ROLE_RSP_ACTN_T ACTN ON ACTN.ROLE_RSP_ID=RR.ROLE_RSP_ID AND (ACTN.ROLE_MBR_ID=RM.ROLE_MBR_ID OR ACTN.ROLE_MBR_ID='*') LEFT OUTER JOIN KRIM_ROLE_T R ON RR.ROLE_ID=R.ROLE_ID ORDER BY RSP_NMSPC_CD,RSP_ID,ROLE_ID,ROLE_MBR_ID;

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='notsys' 
WHERE PRNCPL_NM = 'NotSys';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='notsysadm' 
WHERE PRNCPL_NM = 'NotSysAdm';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='testadmin1' 
WHERE PRNCPL_NM = 'TestAdmin1';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='testadmin2' 
WHERE PRNCPL_NM = 'TestAdmin2';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='testuser1' 
WHERE PRNCPL_NM = 'TestUser1';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='testuser2' 
WHERE PRNCPL_NM = 'TestUser2';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='testuser3' 
WHERE PRNCPL_NM = 'TestUser3';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='testuser4' 
WHERE PRNCPL_NM = 'TestUser4';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='testuser5' 
WHERE PRNCPL_NM = 'TestUser5';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='testuser6' 
WHERE PRNCPL_NM = 'TestUser6';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_NM='newacctusr' 
WHERE PRNCPL_NM = 'newAcctUsr';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='notsys' 
WHERE PRNCPL_ID = 'NotSys';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='notsysadm' 
WHERE PRNCPL_ID = 'NotSysAdm';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='testadmin1' 
WHERE PRNCPL_ID = 'TestAdmin1';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='testadmin2' 
WHERE PRNCPL_ID = 'TestAdmin2';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='testuser1' 
WHERE PRNCPL_ID = 'TestUser1';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='testuser2' 
WHERE PRNCPL_ID = 'TestUser2';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='testuser3' 
WHERE PRNCPL_ID = 'TestUser3';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='testuser4' 
WHERE PRNCPL_ID = 'TestUser4';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='testuser5' 
WHERE PRNCPL_ID = 'TestUser5';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='testuser6' 
WHERE PRNCPL_ID = 'TestUser6';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='newaccountuser' 
WHERE PRNCPL_ID = 'newAccountUser';

UPDATE KRIM_PRNCPL_T 
SET PRNCPL_ID='kuluser' 
WHERE PRNCPL_ID = 'KULUSER';

COMMIT;

CREATE SEQUENCE TRV_FO_ID_S INCREMENT BY 1 START WITH 1000;

DELETE FROM KRIM_ENTITY_EMAIL_T where EMAIL_ADDR='KULUSER@indiana.edu';

CREATE TABLE KR_KIM_TEST_BO (
    PK VARCHAR2 (40) , 
    PRNCPL_ID VARCHAR2 (40) ) ;

INSERT INTO KRIM_PERM_TMPL_T (PERM_TMPL_ID, OBJ_ID, VER_NBR, NM, DESC_TXT, KIM_TYP_ID, ACTV_IND, NMSPC_CD)
VALUES('49', '662384B381B867A1E0404F8189D868A6', '1', 'Send Ad Hoc Request', '', '5', 'Y', 'KR-NS') ;

INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NM, DESC_TXT, ACTV_IND, NMSPC_CD)
VALUES('332', '662384B381B967A1E0404F8189D868A6', 1, '49', 'Send Ad Hoc Request', '', 'Y', 'KR-SYS') ;

INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NM, DESC_TXT, ACTV_IND, NMSPC_CD)
VALUES('333', '662384B381BD67A1E0404F8189D868A6', 1, '49', 'Send Ad Hoc Request', '', 'Y', 'KR-SYS') ;

INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NM, DESC_TXT, ACTV_IND, NMSPC_CD)
VALUES('334', '662384B381C167A1E0404F8189D868A6', 1, '49', 'Send Ad Hoc Request', '', 'Y', 'KR-SYS') ;

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES('618', '662384B381BC67A1E0404F8189D868A6', 1, '83', '332', 'Y') ;

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES('616', '662384B381C067A1E0404F8189D868A6', 1, '83', '333', 'Y') ;

INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES('617', '662384B381C467A1E0404F8189D868A6', 1, '66', '334', 'Y') ;

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES('478', '662384B381BA67A1E0404F8189D868A6', '1', '332', '5', '13', 'KualiDocument') ;

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES('479', '662384B381BB67A1E0404F8189D868A6', '1', '332', '5', '14', 'F') ;

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES('480', '662384B381BE67A1E0404F8189D868A6', '1', '333', '5', '13', 'KualiDocument') ;

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES('481', '662384B381BF67A1E0404F8189D868A6', '1', '333', '5', '14', 'K') ;

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES('482', '662384B381C267A1E0404F8189D868A6', '1', '334', '5', '13', 'KualiDocument') ;

INSERT INTO KRIM_PERM_ATTR_DATA_T (ATTR_DATA_ID, OBJ_ID, VER_NBR, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
VALUES('483', '662384B381C367A1E0404F8189D868A6', '1', '334', '5', '14', 'A') ;

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='notsys' 
WHERE MBR_ID = 'NotSys'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='notsysadm' 
WHERE MBR_ID = 'NotSysAdm'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='testadmin1' 
WHERE MBR_ID = 'TestAdmin1'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='testadmin2' 
WHERE MBR_ID = 'TestAdmin2'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='testuser1' 
WHERE MBR_ID = 'TestUser1'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='testuser2' 
WHERE MBR_ID = 'TestUser2'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='testuser3' 
WHERE MBR_ID = 'TestUser3'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='testuser4' 
WHERE MBR_ID = 'TestUser4'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='testuser5' 
WHERE MBR_ID = 'TestUser5'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='testuser6' 
WHERE MBR_ID = 'TestUser6'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='newaccountuser' 
WHERE MBR_ID = 'newAccountUser'
      AND MBR_TYP_CD = 'P';

UPDATE KRIM_GRP_MBR_T 
SET MBR_ID='kuluser' 
WHERE MBR_ID = 'KULUSER'
      AND MBR_TYP_CD = 'P';

COMMIT;

INSERT INTO KRNS_PARM_T (CONS_CD, NMSPC_CD, OBJ_ID, PARM_DESC_TXT, PARM_DTL_TYP_CD, PARM_NM, PARM_TYP_CD, TXT, VER_NBR)
VALUES('A', 'KR-NS', '5a5fbe94-846f-102c-8db0-c405cae621f3', 'A semi-colon delimted list of regular expressions that identify 
                                                             potentially sensitive data in strings.  These patterns will be matched 
                                                             against notes, document explanations, and routing annotations.', 'All', 'SENSITIVE_DATA_PATTERNS', 'CONFG', '[0-9]{9};[0-9]{3}-[0-9]{2}-[0-9]{4}', 1) ;

CREATE SEQUENCE KRNS_MAINT_LOCK_S START WITH 2000 INCREMENT BY 1;

ALTER TABLE KRNS_MAINT_LOCK_T ADD MAINT_LOCK_ID VARCHAR2 (14) ;

ALTER TABLE KRNS_MAINT_LOCK_T DROP PRIMARY KEY;

DECLARE CURSOR cursor1 IS SELECT MAINT_LOCK_REP_TXT
                          FROM   KRNS_MAINT_LOCK_T;BEGIN FOR r IN cursor1 LOOP EXECUTE IMMEDIATE 'UPDATE KRNS_MAINT_LOCK_T SET MAINT_LOCK_ID=KRNS_MAINT_LOCK_S.nextval';END LOOP;END;/ 

ALTER TABLE KRNS_MAINT_LOCK_T
    ADD CONSTRAINT KRNS_MAINT_LOCK_TP1
PRIMARY KEY (MAINT_LOCK_REP_TXT);

ALTER TABLE KRNS_MAINT_LOCK_T MODIFY MAINT_LOCK_REP_TXT VARCHAR2 (500) ;

COMMIT;

ALTER TABLE KRNS_SESN_DOC_T ADD CONTENT_ENCRYPTED_IND CHAR (1) DEFAULT 'N';

UPDATE krew_doc_typ_t 
SET PARNT_ID='2681' 
WHERE DOC_TYP_NM = 'NamespaceMaintenanceDocument';

UPDATE krew_doc_typ_t 
SET PARNT_ID='2681' 
WHERE DOC_TYP_NM = 'ParameterDetailTypeMaintenanceDocument';

UPDATE krew_doc_typ_t 
SET PARNT_ID='2681' 
WHERE DOC_TYP_NM = 'ParameterMaintenanceDocument';

UPDATE krew_doc_typ_t 
SET PARNT_ID='2681' 
WHERE DOC_TYP_NM = 'ParameterTypeMaintenanceDocument';

UPDATE KRIM_PERM_ATTR_DATA_T 
SET KIM_ATTR_DEFN_ID='4' 
WHERE PERM_ID = '163'
      AND ATTR_VAL = 'KR*';

INSERT INTO krns_parm_t (NMSPC_CD, PARM_DTL_TYP_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, TXT, PARM_DESC_TXT, CONS_CD)
VALUES('KR-NS', 'All', 'DEFAULT_COUNTRY', '64B87B4C5E3B8F4CE0404F8189D8291A', 1, 'CONFG', 'US', 'Used as the default country code when relating records that do not have a country code to records that do have a country code, e.g. validating a zip code where the country is not collected.', 'A') ;

UPDATE krim_typ_t 
SET SRVC_NM='rolePermissionTypeService' 
WHERE NM = 'Role';

UPDATE krim_typ_t 
SET SRVC_NM='groupPermissionTypeService' 
WHERE NM = 'Group';

UPDATE krim_typ_t 
SET NM='Edit Mode & Document Type', 
    SRVC_NM='documentTypeAndEditModePermissionTypeService' 
WHERE NM = 'Edit Mode';

UPDATE krew_doc_typ_t 
SET POST_PRCSR='org.kuali.rice.kns.workflow.postprocessor.KualiPostProcessor' 
WHERE DOC_TYP_NM = 'KualiDocument';

UPDATE krew_doc_typ_t 
SET POST_PRCSR=NULL 
WHERE DOC_TYP_NM = 'IdentityManagementPersonDocument';

COMMIT;

INSERT INTO krns_parm_t (NMSPC_CD, PARM_DTL_TYP_CD, PARM_NM, TXT, PARM_TYP_CD, PARM_DESC_TXT, CONS_CD, OBJ_ID)
VALUES('KR-IDM', 'Document', 'MAX_MEMBERS_PER_PAGE', '20', 'CONFG', 'The maximum number of role or group members to display at once on their documents. If the number is above this value, the document will switch into a paging mode with only this many rows displayed at a time.', 'A', '2238b58e-8fb9-102c-9461-def224dad9b3') ;

COMMIT;

INSERT INTO krns_parm_dtl_typ_t(SELECT 'KR-IDM', PARM_DTL_TYP_CD, SYS_GUID () , 1, NM, 'Y' FROM KRNS_PARM_DTL_TYP_T WHERE NMSPC_CD = 'KR-NS') ;

COMMIT;

TRUNCATE TABLE KRNS_SESN_DOC_T;

DROP TABLE KRNS_SESN_DOC_T;

CREATE TABLE KRNS_SESN_DOC_T (
    SESN_DOC_ID VARCHAR2 (40) NOT NULL, 
    DOC_HDR_ID VARCHAR2 (14) NOT NULL, 
    PRNCPL_ID VARCHAR2 (40) NOT NULL, 
    IP_ADDR VARCHAR2 (60) NOT NULL, 
    SERIALZD_DOC_FRM BLOB, 
    LAST_UPDT_DT DATE, 
    CONTENT_ENCRYPTED_IND CHAR (1) DEFAULT 'N') ;

CREATE INDEX KRNS_SESN_DOC_TI1 ON KRNS_SESN_DOC_T(LAST_UPDT_DT ASC);

ALTER TABLE KRNS_SESN_DOC_T 
    ADD CONSTRAINT KRNS_SESN_DOC_TP1 
            PRIMARY KEY (SESN_DOC_ID, DOC_HDR_ID, PRNCPL_ID, IP_ADDR) ;

ALTER TABLE KRIM_ROLE_RSP_ACTN_T 
    DROP CONSTRAINT KRIM_ROLE_RSP_ACTN_TR2;

ALTER TABLE KRIM_PND_DLGN_MBR_T ADD ROLE_MBR_ID VARCHAR (40) ;

ALTER TABLE KREW_DOC_HDR_T ADD (APP_DOC_STATUS varchar (30) , APP_DOC_STAT_MDFN_DT date) ;

;create index KREW_DOC_HDR_T10 on KREW_DOC_HDR_T(APP_DOC_STATUS);

;create index KREW_DOC_HDR_T12 on KREW_DOC_HDR_T(APP_DOC_STAT_MDFN_DT);

;ALTER TABLE KREW_DOC_TYP_PLCY_RELN_T ADD PLCY_DESC varchar (20) ;

ALTER TABLE KREW_RTE_NODE_T ADD NEXT_DOC_STATUS varchar (30) ;

CREATE TABLE KREW_DOC_TYP_APP_DOC_STAT_T (
    DOC_TYP_ID DECIMAL (19) , 
    DOC_STAT_NM VARCHAR (20) , 
    VER_NBR DECIMAL (8) DEFAULT 0, 
    OBJ_ID VARCHAR (36) NOT NULL, CONSTRAINT KREW_DOC_TYP_APP_DOC_STAT_TP1 PRIMARY KEY (DOC_TYP_ID, DOC_STAT_NM) , CONSTRAINT KREW_DOC_TYP_APP_DOC_STAT_TC0 UNIQUE (OBJ_ID) ) ;

create index KREW_DOC_TYP_APP_DOC_STAT_T1 on KREW_DOC_TYP_APP_DOC_STAT_T(DOC_TYP_ID);

ALTER TABLE KRNS_PESSIMISTIC_LOCK_T MODIFY (PRNCPL_ID varchar2 (11) ) ;
