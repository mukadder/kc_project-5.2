
CREATE OR REPLACE VIEW OSP$EPS_PROP_COST_SHARING ( PROPOSAL_NUMBER,VERSION_NUMBER,FISCAL_YEAR,COST_SHARING_PERCENTAGE,SOURCE_ACCOUNT,AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER) 
AS select PROPOSAL_NUMBER,BUDGET_VERSION_NUMBER,FISCAL_YEAR,COST_SHARING_PERCENTAGE,SOURCE_ACCOUNT,AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER
	from EPS_PROP_COST_SHARING;
