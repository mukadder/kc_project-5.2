CREATE TABLE AWARD_COMMENT ( 
	AWARD_COMMENT_ID			NUMBER(8,0) constraint AWARD_COMMENTN0 NOT NULL ENABLE,
	AWARD_ID					NUMBER constraint AWARD_COMMENTN1 NOT NULL ENABLE,
	SEQUENCE_NUMBER				NUMBER(8,0) constraint AWARD_COMMENTN2 NOT NULL ENABLE,
	COMMENT_TYPE_CODE			NUMBER(3,0) constraint AWARD_COMMENTN3 NOT NULL ENABLE,
	CHECKLIST_PRINT_FLAG		VARCHAR2(1) constraint AWARD_COMMENTN4 NOT NULL ENABLE,
	COMMENTS					CLOB constraint AWARD_COMMENTN5 NOT NULL ENABLE,
    UPDATE_TIMESTAMP       		DATE constraint AWARD_COMMENTN6 NOT NULL ENABLE,
    UPDATE_USER            		VARCHAR2(60) constraint AWARD_COMMENTN7 NOT NULL ENABLE,
    VER_NBR 					NUMBER(8,0) DEFAULT 1  constraint AWARD_COMMENTN8 NOT NULL ENABLE,
	OBJ_ID 						VARCHAR2(36) DEFAULT SYS_GUID()  constraint AWARD_COMMENTN9 NOT NULL ENABLE,
    CONSTRAINT PK_AWARD_COMMENT PRIMARY KEY(AWARD_COMMENT_ID) ENABLE,
    CONSTRAINT U_AWARD_COMMENT UNIQUE(AWARD_ID,SEQUENCE_NUMBER,COMMENT_TYPE_CODE) ENABLE,
    CONSTRAINT FK_AWARD_COMMENT_COMMENT_TYPE FOREIGN KEY(COMMENT_TYPE_CODE)REFERENCES COMMENT_TYPE(COMMENT_TYPE_CODE) ENABLE,
	CONSTRAINT FK_AWARD_COMMENT_AWARD_ID FOREIGN KEY (AWARD_ID) REFERENCES AWARD(AWARD_ID) ENABLE
)