CREATE TABLE AWARD_TEMPLATE_REPORT_TERMS ( 
	TEMPLATE_REPORT_TERMS_ID NUMBER(12,0) NOT NULL, 
	VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
	OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL, 
	AWARD_TEMPLATE_CODE NUMBER(5,0) NOT NULL, 
	REPORT_CLASS_CODE VARCHAR2(3) NOT NULL, 
	REPORT_CODE VARCHAR2(3) NOT NULL, 
	FREQUENCY_CODE VARCHAR2(3) NOT NULL, 
	FREQUENCY_BASE_CODE VARCHAR2(3) NOT NULL, 
	OSP_DISTRIBUTION_CODE VARCHAR2(3) NOT NULL, 
	DUE_DATE DATE NOT NULL, 
	UPDATE_TIMESTAMP DATE NOT NULL, 
	UPDATE_USER VARCHAR2(60) NOT NULL);
ALTER TABLE AWARD_TEMPLATE_REPORT_TERMS 
ADD CONSTRAINT PK_AWARD_TEMPLATE_REPORT_TERMS 
PRIMARY KEY (TEMPLATE_REPORT_TERMS_ID);
CREATE TABLE AWARD_TEMPL_REP_TERMS_RECNT(	
	TEMPL_REP_TERMS_RECNT_ID NUMBER(12,0) NOT NULL ENABLE, 
	TEMPLATE_REPORT_TERMS_ID NUMBER(12,0) NOT NULL ENABLE, 
	CONTACT_TYPE_CODE VARCHAR2(3 BYTE) NOT NULL ENABLE, 
	ROLODEX_ID NUMBER(6,0) NOT NULL ENABLE, 
	NUMBER_OF_COPIES NUMBER(2,0), 
	VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL ENABLE, 
	OBJ_ID VARCHAR2(36 BYTE) DEFAULT SYS_GUID() NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60 BYTE) NOT NULL ENABLE
	);

ALTER TABLE AWARD_TEMPL_REP_TERMS_RECNT 
ADD CONSTRAINT PK_TEMPL_REP_TERMS_RECNT 
PRIMARY KEY (TEMPL_REP_TERMS_RECNT_ID);

ALTER TABLE AWARD_TEMPL_REP_TERMS_RECNT 
ADD CONSTRAINT FK2_AWD_TEMPL_REP_TERMS_RECNT 
FOREIGN KEY (CONTACT_TYPE_CODE) 
REFERENCES CONTACT_TYPE (CONTACT_TYPE_CODE);

ALTER TABLE AWARD_TEMPLATE_REPORT_TERMS 
ADD CONSTRAINT FK2_AWD_TEMPLATE_REPORT_TERMS 
FOREIGN KEY (OSP_DISTRIBUTION_CODE) 
REFERENCES DISTRIBUTION (OSP_DISTRIBUTION_CODE); 

ALTER TABLE AWARD_TEMPLATE_REPORT_TERMS 
ADD CONSTRAINT FK10_AWD_TEMPLATE_REPORT_TERMS 
FOREIGN KEY (FREQUENCY_CODE) 
REFERENCES FREQUENCY (FREQUENCY_CODE) ;

ALTER TABLE AWARD_TEMPLATE_REPORT_TERMS 
ADD CONSTRAINT FK11_AWD_TEMPLATE_REPORT_TERMS 
FOREIGN KEY (FREQUENCY_BASE_CODE) 
REFERENCES FREQUENCY_BASE (FREQUENCY_BASE_CODE); 

ALTER TABLE AWARD_TEMPLATE_REPORT_TERMS 
ADD CONSTRAINT FK9_AWD_TEMPLATE_REPORT_TERMS 
FOREIGN KEY (REPORT_CODE) 
REFERENCES REPORT (REPORT_CODE); 

ALTER TABLE AWARD_TEMPLATE_REPORT_TERMS 
ADD CONSTRAINT FK8_AWD_TEMPLATE_REPORT_TERMS 
FOREIGN KEY (REPORT_CLASS_CODE) 
REFERENCES REPORT_CLASS (REPORT_CLASS_CODE); 

ALTER TABLE AWARD_TEMPL_REP_TERMS_RECNT 
ADD CONSTRAINT FK1_AWD_TEMPL_REP_TERMS_RECNT 
FOREIGN KEY (ROLODEX_ID) 
REFERENCES ROLODEX (ROLODEX_ID); 

ALTER TABLE AWARD_TEMPLATE_REPORT_TERMS 
ADD CONSTRAINT FK7_AWD_TEMPLATE_REPORT_TERMS 
FOREIGN KEY (AWARD_TEMPLATE_CODE) 
REFERENCES AWARD_TEMPLATE (AWARD_TEMPLATE_CODE); 

drop table COMMENT_TYPE cascade constraints;

CREATE TABLE COMMENT_TYPE ( 
	COMMENT_TYPE_CODE			VARCHAR2(3),
	DESCRIPTION					VARCHAR2(200),
	TEMPLATE_FLAG				VARCHAR2(1),
	CHECKLIST_FLAG				VARCHAR2(1),
	AWARD_COMMENT_SCREEN_FLAG	VARCHAR2(1),
    UPDATE_TIMESTAMP       		DATE,
    UPDATE_USER            		VARCHAR2(60),
    VER_NBR 					NUMBER(8,0) DEFAULT 1,
	OBJ_ID 						VARCHAR2(36) DEFAULT SYS_GUID()
);


alter table COMMENT_TYPE ADD CONSTRAINT PK_COMMENT_TYPE PRIMARY KEY(COMMENT_TYPE_CODE) ENABLE;

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(2, 'General Comments', 'Y', 'N', 'Y', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(4, 'Intellectual Property Comments', 'Y', 'N', 'Y', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(9, 'Cost Sharing Comments', 'Y', 'N', 'N', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(3, 'Fiscal Report Comments', 'Y', 'N', 'Y', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(1, 'Invoice Instructions', 'N', 'N', 'N', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(10, 'Special Review Comments', 'N', 'N', 'N', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(7, 'Special Rate', 'N', 'N', 'N', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(8, 'Indirect Cost Comments', 'N', 'N', 'N', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(5, 'Procurement Comments', 'Y', 'N', 'Y', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(12, 'Proposal Summary', 'N', 'N', 'N', sysdate, user);
            
insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(6, 'Property Comments', 'Y', 'N', 'Y', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(13, 'Proposal Comments', 'N', 'N', 'N', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(16, 'Proposal IP Review Comment', 'N', 'N', 'N', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(17, 'Proposal IP Review Comment', 'N', 'N', 'N', sysdate, user);
            
insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(18, 'Pre-Award Sponsor Auth Comments ', 'N', 'N', 'N', sysdate, user);
insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(19, 'Pre-Award Institutional Auth Comments', 'N', 'N', 'N', sysdate, user);

insert into COMMENT_TYPE (COMMENT_TYPE_CODE,DESCRIPTION,TEMPLATE_FLAG,CHECKLIST_FLAG,AWARD_COMMENT_SCREEN_FLAG,UPDATE_TIMESTAMP,UPDATE_USER)
            values(20, 'Benefits Rates Comments', 'N', 'N', 'N', sysdate, user);
            
commit;

alter table AWARD_COMMENT modify COMMENT_TYPE_CODE VARCHAR2(3);

alter table AWARD_COMMENT ADD CONSTRAINT FK_AWARD_COMMENT_COMMENT_TYPE FOREIGN KEY(COMMENT_TYPE_CODE) REFERENCES COMMENT_TYPE(COMMENT_TYPE_CODE) ENABLE;

CREATE OR REPLACE VIEW OSP$COMMENT AS SELECT 
	COMMENT_TYPE_CODE COMMENT_CODE,
	DESCRIPTION DESCRIPTION,
	TEMPLATE_FLAG TEMPLATE_FLAG,
	CHECKLIST_FLAG CHECKLIST_FLAG,
	AWARD_COMMENT_SCREEN_FLAG AWARD_COMMENT_SCREEN_FLAG,
	UPDATE_TIMESTAMP UPDATE_TIMESTAMP, 
	UPDATE_USER UPDATE_USER
FROM COMMENT_TYPE;

drop table AWARD_TEMPLATE_COMMENTS;

CREATE TABLE AWARD_TEMPLATE_COMMENTS ( 
	AWARD_TEMPLATE_COMMENTS_ID NUMBER(12,0) NOT NULL, 
	VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
	OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL, 
	AWARD_TEMPLATE_CODE NUMBER(5,0) NOT NULL, 
	COMMENT_TYPE_CODE VARCHAR2(3) NOT NULL, 
	CHECKLIST_PRINT_FLAG CHAR(1) NOT NULL, 
	COMMENTS CLOB, 
	UPDATE_TIMESTAMP DATE NOT NULL, 
	UPDATE_USER VARCHAR2(60) NOT NULL);
	
ALTER TABLE AWARD_TEMPLATE_COMMENTS 
ADD CONSTRAINT PK_AWARD_TEMPLATE_COMMENTS 
PRIMARY KEY (AWARD_TEMPLATE_COMMENTS_ID);

ALTER TABLE AWARD_TEMPLATE_COMMENTS 
ADD CONSTRAINT UQ_AWARD_TEMPLATE_COMMENTS 
UNIQUE (AWARD_TEMPLATE_CODE, COMMENT_TYPE_CODE);

ALTER TABLE AWARD_TEMPLATE_COMMENTS 
ADD CONSTRAINT FK_AWARD_TEMPLATE_COMMENT_CODE 
FOREIGN KEY (COMMENT_TYPE_CODE) 
REFERENCES COMMENT_TYPE (COMMENT_TYPE_CODE);

ALTER TABLE AWARD_TEMPLATE_COMMENTS 
ADD CONSTRAINT FK_AWARD_TEMPLATE_CODE 
FOREIGN KEY (AWARD_TEMPLATE_CODE) 
REFERENCES AWARD_TEMPLATE (AWARD_TEMPLATE_CODE);


drop table AWARD_TEMPLATE_TERMS cascade constraints;

CREATE TABLE AWARD_TEMPLATE_TERMS ( 
	AWARD_TEMPLATE_TERMS_ID NUMBER(12,0) NOT NULL, 
	VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
	OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL, 
	AWARD_TEMPLATE_CODE NUMBER(5,0) NOT NULL, 
	SPONSOR_TERM_ID NUMBER(12,0) NOT NULL, 
	UPDATE_TIMESTAMP DATE NOT NULL, 
	UPDATE_USER VARCHAR2(60) NOT NULL);

ALTER TABLE AWARD_TEMPLATE_TERMS 
ADD CONSTRAINT PK_AWARD_TEMPLATE_TERMS 
PRIMARY KEY (AWARD_TEMPLATE_TERMS_ID);

ALTER TABLE AWARD_TEMPLATE_TERMS 
ADD CONSTRAINT FK1_AWARD_TEMPLATE_TERMS 
FOREIGN KEY (AWARD_TEMPLATE_CODE) 
REFERENCES AWARD_TEMPLATE (AWARD_TEMPLATE_CODE) ;

ALTER TABLE AWARD_TEMPLATE_TERMS 
ADD CONSTRAINT FK2_AWARD_TEMPLATE_TERMS 
FOREIGN KEY (SPONSOR_TERM_ID) 
REFERENCES SPONSOR_TERM (SPONSOR_TERM_ID) ;

CREATE OR REPLACE VIEW OSP$TEMPLATE (
	TEMPLATE_CODE, 
	DESCRIPTION, 
	STATUS_CODE, 
	PRIME_SPONSOR_CODE, 
	NON_COMPETING_CONT_PRPSL_DUE, 
	COMPETING_RENEWAL_PRPSL_DUE, 
	BASIS_OF_PAYMENT_CODE, 
	METHOD_OF_PAYMENT_CODE, 
	PAYMENT_INVOICE_FREQ_CODE, 
	INVOICE_NUMBER_OF_COPIES, 
	FINAL_INVOICE_DUE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
	AS SELECT 
	AWARD_TEMPLATE_CODE, 
	DESCRIPTION, 
	STATUS_CODE, 
	PRIME_SPONSOR_CODE, 
	NON_COMPETING_CONT_PRPSL_DUE, 
	COMPETING_RENEWAL_PRPSL_DUE, 
	BASIS_OF_PAYMENT_CODE, 
	METHOD_OF_PAYMENT_CODE, 
	PAYMENT_INVOICE_FREQ_CODE, 
	INVOICE_NUMBER_OF_COPIES, 
	FINAL_INVOICE_DUE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_TEMPLATE;

CREATE OR REPLACE VIEW OSP$AWARD_STATUS (STATUS_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
	AS SELECT 
	STATUS_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_STATUS;

CREATE OR REPLACE VIEW OSP$METHOD_OF_PAYMENT (	
	METHOD_OF_PAYMENT_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER) 
AS SELECT 
	METHOD_OF_PAYMENT_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_METHOD_OF_PAYMENT;

CREATE OR REPLACE VIEW OSP$BASIS_OF_PAYMENT(	
	BASIS_OF_PAYMENT_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER) 
	AS SELECT 
	BASIS_OF_PAYMENT_CODE, 
	DESCRIPTION, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_BASIS_OF_PAYMENT;

CREATE OR REPLACE VIEW OSP$TEMPLATE_COMMENTS
	(TEMPLATE_CODE, 
	COMMENT_CODE, 
	CHECKLIST_PRINT_FLAG, 
	COMMENTS, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	AWARD_TEMPLATE_CODE, 
	COMMENT_TYPE_CODE, 
	CHECKLIST_PRINT_FLAG, 
	COMMENTS, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_TEMPLATE_COMMENTS;
CREATE OR REPLACE VIEW OSP$TEMPLATE_CONTACT (	TEMPLATE_CODE, 
	CONTACT_TYPE_CODE, 
	ROLODEX_ID, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	AWARD_TEMPLATE_CODE, 
	CONTACT_TYPE_CODE, 
	ROLODEX_ID, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER
FROM AWARD_TEMPLATE_CONTACT;

CREATE OR REPLACE VIEW OSP$TEMPLATE_DOCUMENT_TERMS(	TEMPLATE_CODE, 
	REFERENCED_DOCUMENT_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER) 
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE REFERENCED_DOCUMENT_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '6';
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_EQUIPMENT_TERMS (	TEMPLATE_CODE, 
	EQUIPMENT_APPROVAL_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE EQUIPMENT_APPROVAL_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '1';		
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_INVENTION_TERMS (	TEMPLATE_CODE, 
	INVENTION_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_TYPE_CODE INVENTION_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '2';		

CREATE OR REPLACE VIEW OSP$TEMPLATE_PRIOR_TERMS (TEMPLATE_CODE, 
	PRIOR_APPROVAL_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE PRIOR_APPROVAL_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '3';		
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_PROPERTY_TERMS (TEMPLATE_CODE, 
	PROPERTY_CODE, 
	UPDATE_TIMESTAMP,
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE PROPERTY_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '4';				
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_PUBLICATION_TERMS (	TEMPLATE_CODE, 
	PUBLICATION_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE PUBLICATION_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '5';		
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_RIGHTS_TERMS (TEMPLATE_CODE, 
	RIGHTS_IN_DATA_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE RIGHTS_IN_DATA_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '7';			
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_SUBCONTRACT_TERMS (	TEMPLATE_CODE, 
	SUBCONTRACT_APPROVAL_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE SUBCONTRACT_APPROVAL_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '8';
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_TRAVEL_TERMS (	TEMPLATE_CODE, 
	TRAVEL_RESTRICTION_CODE, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER) 
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	B.SPONSOR_TERM_CODE TRAVEL_RESTRICTION_CODE, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_TERMS A,SPONSOR_TERM B,SPONSOR_TERM_TYPE C where 
		A.SPONSOR_TERM_ID = B.SPONSOR_TERM_ID and
		B.SPONSOR_TERM_TYPE_CODE = C.SPONSOR_TERM_TYPE_CODE and
		C.SPONSOR_TERM_TYPE_CODE = '9';
		
CREATE OR REPLACE VIEW OSP$TEMPLATE_REPORT_TERMS (	TEMPLATE_CODE, 
	REPORT_CLASS_CODE, 
	REPORT_CODE, 
	FREQUENCY_CODE, 
	FREQUENCY_BASE_CODE, 
	OSP_DISTRIBUTION_CODE, 
	DUE_DATE, 
	CONTACT_TYPE_CODE, 
	ROLODEX_ID, 
	NUMBER_OF_COPIES, 
	UPDATE_TIMESTAMP, 
	UPDATE_USER)
AS SELECT 
	A.AWARD_TEMPLATE_CODE, 
	A.REPORT_CLASS_CODE, 
	A.REPORT_CODE, 
	A.FREQUENCY_CODE, 
	A.FREQUENCY_BASE_CODE, 
	A.OSP_DISTRIBUTION_CODE, 
	A.DUE_DATE, 
	B.CONTACT_TYPE_CODE, 
	B.ROLODEX_ID, 
	B.NUMBER_OF_COPIES, 
	A.UPDATE_TIMESTAMP, 
	A.UPDATE_USER
FROM AWARD_TEMPLATE_REPORT_TERMS A,AWARD_TEMPL_REP_TERMS_RECNT B
WHERE A.TEMPLATE_REPORT_TERMS_ID = B.TEMPLATE_REPORT_TERMS_ID;		