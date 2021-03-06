DROP TABLE AWARD_APPROVED_FOREIGN_TRAVEL;

CREATE TABLE AWARD_APPROVED_FOREIGN_TRAVEL (
   AWARD_APPR_FORN_TRAVEL_ID NUMBER(22,0) NOT NULL,
   AWARD_ID NUMBER(22,0) NOT NULL,
   AWARD_NUMBER varchar2(12) NOT NULL,
   SEQUENCE_NUMBER NUMBER(4) NOT NULL,
   PERSON_ID VARCHAR2(9),
   ROLODEX_ID NUMBER(6),
   TRAVELER_NAME varchar2(90),
   DESTINATION varchar2(30) NOT NULL,
   START_DATE DATE NOT NULL,
   END_DATE DATE,
   AMOUNT NUMBER(12,2),
   UPDATE_TIMESTAMP date NOT NULL,
   UPDATE_USER varchar2(60) NOT NULL,
   VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL,
   OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL
);

ALTER TABLE AWARD_APPROVED_FOREIGN_TRAVEL ADD CONSTRAINT PK_AWARD_APPRV_FORN_TRVL PRIMARY KEY (AWARD_APPR_FORN_TRAVEL_ID);