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
package org.kuali.kra.protocol.auth;

import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.kra.protocol.actions.submit.ProtocolSubmissionBase;


/**
 * Is the user allowed to create an amendment for the protocol and the action is currently not available?
 */
public abstract class CreateAmendmentUnavailableAuthorizerBase extends ProtocolAuthorizerBase {

    /**
     * @see org.kuali.kra.protocol.auth.ProtocolAuthorizerBase#isAuthorized(java.lang.String, org.kuali.kra.protocol.auth.ProtocolTaskBase)
     */
    public boolean isAuthorized(String userId, ProtocolTaskBase task) {
        return hasPermission(userId, task.getProtocol(), getPermissionCreateAmendmentHook()) &&
               ( isAmendmentOrRenewal(task.getProtocol()) ||
                 (isRequestForSuspension(findSubmisionHook(task.getProtocol()), getProtocolSubmissionTypeHook()) & !isAdmin(userId, getAdminNamespaceHook(), getAdminRoleHook())) ||
                 !canExecuteAction(task.getProtocol(), getActionTypeAmendmentCreatedHook())
               );
    }

    protected abstract String getActionTypeAmendmentCreatedHook();
    protected abstract String getPermissionCreateAmendmentHook();
    protected abstract String getAdminNamespaceHook();
    protected abstract String getAdminRoleHook();
    protected abstract String getProtocolSubmissionTypeHook();
    protected abstract ProtocolSubmissionBase findSubmisionHook(ProtocolBase protocol);
    
}
