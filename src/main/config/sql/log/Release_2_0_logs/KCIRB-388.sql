
DELETE FROM SUBMISSION_TYPE WHERE SUBMISSION_TYPE_CODE='131';
DELETE FROM SUBMISSION_TYPE WHERE SUBMISSION_TYPE_CODE='132';

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('115', 'Continuing Review/Continuation with Amendment', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('101', 'Continuing Review/Continuation without Amendment', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('104', 'Self Report of Non-Compliance', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('105', 'Complaint', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('106', 'Adverse Event', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('107', 'Report of protocol-related COI', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('108', 'Request for Termination', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('109', 'Request to Close', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('110', 'Request for Suspension', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('111', 'Request to Close Enrollment', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('112', 'FYI', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('113', 'Request for Data Analysis Only', sysdate,'KRADEV');

INSERT INTO SUBMISSION_TYPE (SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP,UPDATE_USER) VALUES ('114', 'Request for Re-open Enrollment', sysdate,'KRADEV');

COMMIT;
