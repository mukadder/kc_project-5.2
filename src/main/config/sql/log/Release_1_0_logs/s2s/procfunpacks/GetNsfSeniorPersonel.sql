CREATE OR REPLACE PROCEDURE GetNsfSeniorPersonel
 (AW_PROPOSAL_NUMBER IN OSP$BUDGET_PERIODS.PROPOSAL_NUMBER%TYPE,
  AW_BUDGET_PERIOD in osp$budget_periods.budget_period%type,
 cur_generic IN OUT result_sets.cur_generic) is

begin

if aw_budget_period > 0 then
 open cur_generic for
 	
      SELECT PP.PERSON_ID , PP.FULL_NAME,
           'Principal Investigator' as PROJECT_ROLE,
           '1' as SORT_ID
      FROM  OSP$EPS_PROP_PERSON PP, OSP$eps_PROP_INVESTIGATORS PI
      WHERE PP.PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
      AND PP.PERSON_ID = PI.PERSON_ID
      AND PP.PROPOSAL_NUMBER = PI.PROPOSAL_NUMBER
      AND pi.principal_investigator_flag = 'Y'

  		UNION
  		
      SELECT PP.PERSON_ID , PP.FULL_NAME,
           'Co-PI' as PROJECT_ROLE,
           '2' as SORT_ID
      FROM  OSP$EPS_PROP_PERSON PP, OSP$eps_PROP_INVESTIGATORS PI
      WHERE PP.PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
      AND PP.PERSON_ID = PI.PERSON_ID
      AND PP.PROPOSAL_NUMBER = PI.PROPOSAL_NUMBER
      AND pi.principal_investigator_flag = 'N'

  		UNION  		

		SELECT PP.PERSON_ID, PP.FULL_NAME ,  K.PROJECT_ROLE,
		'3' as SORT_ID
		FROM  OSP$EPS_PROP_PERSON PP, OSP$EPS_PROP_KEY_PERSONS K
		WHERE PP.PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
		AND PP.PERSON_ID = K.PERSON_ID
		AND PP.PROPOSAL_NUMBER = K.PROPOSAL_NUMBER
	
      UNION

		select  distinct OSP$BUDGET_PERSONNEL_DETAILS.person_id as person_id,
        				OSP$PERSON.FULL_NAME as full_name, 
       				OSP$PERSON.PRIMARY_TITLE as project_role,
       				'4' as SORT_ID
		from    OSP$BUDGET_PERSONNEL_DETAILS, OSP$PERSON, OSP$BUDGET_DETAILS, OSP$BUDGET_CATEGORY_MAPPING,
              OSP$BUDGET
		where	  OSP$BUDGET_DETAILS.proposal_number = AW_PROPOSAL_NUMBER 
		AND     OSP$BUDGET_DETAILS.proposal_number = OSP$BUDGET_PERSONNEL_DETAILS.proposal_number
		AND     OSP$BUDGET_PERSONNEL_DETAILS.person_id = OSP$PERSON.person_id
      AND 	  OSP$BUDGET_DETAILS.VERSION_NUMBER = OSP$BUDGET_PERSONNEL_DETAILS.VERSION_NUMBER
	   AND 	  OSP$BUDGET.VERSION_NUMBER = OSP$BUDGET_DETAILS.VERSION_NUMBER 
        AND     OSP$BUDGET.VERSION_NUMBER = FN_GET_VERSION(aw_proposal_number)
    --  AND     OSP$BUDGET.FINAL_VERSION_FLAG = 'Y'
		AND     OSP$BUDGET.PROPOSAL_NUMBER = OSP$BUDGET_DETAILS.PROPOSAL_NUMBER
		AND     OSP$BUDGET.PROPOSAL_NUMBER = OSP$BUDGET_PERSONNEL_DETAILS.PROPOSAL_NUMBER
		AND     OSP$BUDGET.VERSION_NUMBER = OSP$BUDGET_PERSONNEL_DETAILS.VERSION_NUMBER
		AND  	  OSP$BUDGET_DETAILS.BUDGET_PERIOD  = OSP$BUDGET_PERSONNEL_DETAILS.BUDGET_PERIOD
      and     osp$budget_details.budget_period  = aw_budget_period
		AND     OSP$BUDGET_PERSONNEL_DETAILS.LINE_ITEM_NUMBER =  OSP$BUDGET_DETAILS.LINE_ITEM_NUMBER
		AND     OSP$BUDGET_DETAILS.BUDGET_CATEGORY_CODE = OSP$BUDGET_CATEGORY_MAPPING.COEUS_CATEGORY_CODE
		AND     OSP$BUDGET_CATEGORY_MAPPING.MAPPING_NAME = 'NSF_PRINTING'
      AND     OSP$BUDGET_CATEGORY_MAPPING.TARGET_CATEGORY_CODE = '01'
      and    osp$budget_personnel_details.person_id not in (
				select person_id
				from  osp$eps_prop_person
			   where proposal_number = AW_PROPOSAL_NUMBER   )
	ORDER BY SORT_ID;
else
    open cur_generic for
 	
      SELECT PP.PERSON_ID , PP.FULL_NAME,
           'Principal Investigator' as PROJECT_ROLE,
           '1' as SORT_ID
      FROM  OSP$EPS_PROP_PERSON PP, OSP$eps_PROP_INVESTIGATORS PI
      WHERE PP.PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
      AND PP.PERSON_ID = PI.PERSON_ID
      AND PP.PROPOSAL_NUMBER = PI.PROPOSAL_NUMBER
      AND pi.principal_investigator_flag = 'Y'

  		UNION
  		
      SELECT PP.PERSON_ID , PP.FULL_NAME,
           'Co-PI' as PROJECT_ROLE,
           '2' as SORT_ID
      FROM  OSP$EPS_PROP_PERSON PP, OSP$eps_PROP_INVESTIGATORS PI
      WHERE PP.PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
      AND PP.PERSON_ID = PI.PERSON_ID
      AND PP.PROPOSAL_NUMBER = PI.PROPOSAL_NUMBER
      AND pi.principal_investigator_flag = 'N'

  		UNION  		

		SELECT PP.PERSON_ID, PP.FULL_NAME ,  K.PROJECT_ROLE,
		'3' as SORT_ID
		FROM  OSP$EPS_PROP_PERSON PP, OSP$EPS_PROP_KEY_PERSONS K
		WHERE PP.PROPOSAL_NUMBER = AW_PROPOSAL_NUMBER
		AND PP.PERSON_ID = K.PERSON_ID
		AND PP.PROPOSAL_NUMBER = K.PROPOSAL_NUMBER
	
     UNION

		select  distinct OSP$BUDGET_PERSONNEL_DETAILS.person_id as person_id,
        				OSP$PERSON.FULL_NAME as full_name, 
       				OSP$PERSON.PRIMARY_TITLE as project_role,
       				'4' as SORT_ID
		from    OSP$BUDGET_PERSONNEL_DETAILS, OSP$PERSON, OSP$BUDGET_DETAILS, OSP$BUDGET_CATEGORY_MAPPING,
              OSP$BUDGET
		where	  OSP$BUDGET_DETAILS.proposal_number = AW_PROPOSAL_NUMBER 
		AND     OSP$BUDGET_DETAILS.proposal_number = OSP$BUDGET_PERSONNEL_DETAILS.proposal_number
		AND     OSP$BUDGET_PERSONNEL_DETAILS.person_id = OSP$PERSON.person_id
      AND 	  OSP$BUDGET_DETAILS.VERSION_NUMBER = OSP$BUDGET_PERSONNEL_DETAILS.VERSION_NUMBER
	   AND 	  OSP$BUDGET.VERSION_NUMBER = OSP$BUDGET_DETAILS.VERSION_NUMBER 
         AND     OSP$BUDGET.VERSION_NUMBER = FN_GET_VERSION(aw_proposal_number)
     -- AND     OSP$BUDGET.FINAL_VERSION_FLAG = 'Y'
		AND     OSP$BUDGET.PROPOSAL_NUMBER = OSP$BUDGET_DETAILS.PROPOSAL_NUMBER
		AND     OSP$BUDGET.PROPOSAL_NUMBER = OSP$BUDGET_PERSONNEL_DETAILS.PROPOSAL_NUMBER
		AND     OSP$BUDGET.VERSION_NUMBER = OSP$BUDGET_PERSONNEL_DETAILS.VERSION_NUMBER
		AND  	  OSP$BUDGET_DETAILS.BUDGET_PERIOD  = OSP$BUDGET_PERSONNEL_DETAILS.BUDGET_PERIOD
     
		AND     OSP$BUDGET_PERSONNEL_DETAILS.LINE_ITEM_NUMBER =  OSP$BUDGET_DETAILS.LINE_ITEM_NUMBER
		AND     OSP$BUDGET_DETAILS.BUDGET_CATEGORY_CODE = OSP$BUDGET_CATEGORY_MAPPING.COEUS_CATEGORY_CODE
		AND     OSP$BUDGET_CATEGORY_MAPPING.MAPPING_NAME = 'NSF_PRINTING'
      AND     OSP$BUDGET_CATEGORY_MAPPING.TARGET_CATEGORY_CODE = '01'
      and    osp$budget_personnel_details.person_id not in (
					select person_id
					from  osp$eps_prop_person
				   where proposal_number = AW_PROPOSAL_NUMBER   )
		ORDER BY SORT_ID;		  
  end if;
END;
/


  