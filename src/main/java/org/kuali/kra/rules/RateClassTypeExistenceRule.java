/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.rules;

import org.kuali.kra.budget.rates.RateClass;
import org.kuali.kra.budget.rates.RateClassType;
import org.kuali.rice.kns.document.MaintenanceDocument;

import java.util.HashMap;
import java.util.Map;

public class RateClassTypeExistenceRule extends KraMaintenanceDocumentRuleBase {
    
    /**
     * Constructs a RateClassTypeExistenceRule.java.
     */
    public RateClassTypeExistenceRule() {
        super();
    }
    
    /**
     * 
     * @see org.kuali.core.maintenance.rules.MaintenanceDocumentRuleBase#processCustomRouteDocumentBusinessRules(org.kuali.core.document.MaintenanceDocument)
     */ 
    protected boolean processCustomRouteDocumentBusinessRules(MaintenanceDocument document) {
        return checkExistence(document);
    }
    
    /**
     * 
     * @see org.kuali.core.maintenance.rules.MaintenanceDocumentRuleBase#processCustomApproveDocumentBusinessRules(org.kuali.core.document.MaintenanceDocument)
     */
    @Override
    protected boolean processCustomApproveDocumentBusinessRules(MaintenanceDocument document) {
        return checkExistence(document);
    }

    /**
     * 
     * This method to checkl rateclasstype exist in table.
     * @param maintenanceDocument
     * @return
     */
    private boolean checkExistence(MaintenanceDocument maintenanceDocument) {


        boolean valid= true;
        if (LOG.isDebugEnabled()) {
            LOG.debug("new maintainable is: " + maintenanceDocument.getNewMaintainableObject().getClass());
        }
        RateClass rateClass = (RateClass) maintenanceDocument.getNewMaintainableObject().getDataObject();

        Map pkMap = new HashMap();
        pkMap.put("rateClassType", rateClass.getRateClassType());
        valid=checkExistenceFromTable(RateClassType.class,pkMap,"rateClassType", "Rate Class Type");


        return valid;

    }
    

}
