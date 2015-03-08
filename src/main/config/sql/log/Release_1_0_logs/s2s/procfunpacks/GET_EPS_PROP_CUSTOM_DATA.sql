CREATE OR REPLACE procedure get_eps_prop_custom_data
   ( AW_PROPOSAL_NUMBER IN OSP$EPS_PROP_CUSTOM_DATA.PROPOSAL_NUMBER%TYPE,
   cur_generic IN OUT result_sets.cur_generic) is


begin

open cur_generic for

  SELECT OSP$EPS_PROP_CUSTOM_DATA.PROPOSAL_NUMBER,
    OSP$EPS_PROP_CUSTOM_DATA.COLUMN_NAME,
    OSP$EPS_PROP_CUSTOM_DATA.COLUMN_VALUE,
        OSP$EPS_PROP_CUSTOM_DATA.UPDATE_TIMESTAMP,
        OSP$EPS_PROP_CUSTOM_DATA.UPDATE_USER  ,
    OSP$CUSTOM_DATA_ELEMENTS.COLUMN_LABEL,
    OSP$CUSTOM_DATA_ELEMENTS.DATA_TYPE,
    OSP$CUSTOM_DATA_ELEMENTS.DATA_LENGTH,
    OSP$CUSTOM_DATA_ELEMENTS.DEFAULT_VALUE,
    OSP$CUSTOM_DATA_ELEMENTS.HAS_LOOKUP,
    OSP$CUSTOM_DATA_ELEMENTS.LOOKUP_WINDOW,
    OSP$CUSTOM_DATA_ELEMENTS.LOOKUP_ARGUMENT,
	OSP$CUSTOM_DATA_ELEMENTS.GROUP_NAME, -- Added for CoeusLite Enhancement
	DECODE(OSP$CUSTOM_DATA_ELEMENTS.HAS_LOOKUP, 'Y',
			get_desc_for_lookup_code(COLUMN_VALUE, LOOKUP_WINDOW, LOOKUP_ARGUMENT))
			AS DESCRIPTION
  FROM OSP$EPS_PROP_CUSTOM_DATA, OSP$CUSTOM_DATA_ELEMENTS
  WHERE ltrim(rtrim(PROPOSAL_NUMBER)) = ltrim(rtrim(AW_PROPOSAL_NUMBER))
      AND OSP$EPS_PROP_CUSTOM_DATA.COLUMN_NAME = OSP$CUSTOM_DATA_ELEMENTS.COLUMN_NAME;

end;
/

