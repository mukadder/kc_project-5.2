/*
 Copyright 2005-2014 The Kuali Foundation

 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.osedu.org/licenses/ECL-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/
/* Table Script */ 
CREATE TABLE MEMBERSHIP_ROLE ( 
    MEMBERSHIP_ROLE_CODE VARCHAR2(3) NOT NULL,
    DESCRIPTION VARCHAR2(200) NOT NULL,
    UPDATE_TIMESTAMP DATE NOT NULL,
    UPDATE_USER VARCHAR2(60) NOT NULL,
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL,
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);
/* Primary Key Constraint */ 
ALTER TABLE MEMBERSHIP_ROLE
ADD CONSTRAINT PK_MEMBERSHIP_ROLE 
PRIMARY KEY (MEMBERSHIP_ROLE_CODE);
/* View for Coeus compatibility */
CREATE OR REPLACE VIEW OSP$MEMBERSHIP_ROLE AS SELECT
    MEMBERSHIP_ROLE_CODE,
    DESCRIPTION,
    UPDATE_TIMESTAMP,
    UPDATE_USER
FROM MEMBERSHIP_ROLE;
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 1, 'Chair', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 2, 'Member - Scientist', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 3, 'Member - Non Scientist', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 4, 'Member', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 5, 'Community Member', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 6, 'Prisoner Representative', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 7, 'Vice Chair', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 8, 'Non-Member', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 9, 'Additional Committee Member', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 10, 'Expedited/Exempt Reviewer', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 11, 'Non-member/Consultants', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 12, 'Alternate', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 13, 'IRB Administrator', sysdate, user );
INSERT INTO MEMBERSHIP_ROLE ( MEMBERSHIP_ROLE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER ) 
VALUES ( 14, 'Inactive', sysdate, user );
COMMIT;
