-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$TRAINING AS SELECT 
    TRAINING_CODE, 
    DESCRIPTION, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM TRAINING;
