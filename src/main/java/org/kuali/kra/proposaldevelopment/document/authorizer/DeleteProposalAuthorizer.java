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
package org.kuali.kra.proposaldevelopment.document.authorizer;

import org.kuali.kra.infrastructure.PermissionConstants;
import org.kuali.kra.proposaldevelopment.document.ProposalDevelopmentDocument;
import org.kuali.kra.proposaldevelopment.document.authorization.ProposalTask;

/**
 * Determines if the document is in the correct state and the user
 * has the appropriate permissions to delete a proposal.
 */
public class DeleteProposalAuthorizer extends ProposalAuthorizer {

    public boolean isAuthorized(String userId, ProposalTask task) {
        ProposalDevelopmentDocument doc = task.getDocument();
        boolean result = hasProposalPermission(userId, doc, PermissionConstants.DELETE_PROPOSAL);
        result &= !kraWorkflowService.isInWorkflow(doc);
        return result;
    }
}
