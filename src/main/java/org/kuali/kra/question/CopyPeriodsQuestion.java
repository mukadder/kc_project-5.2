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
package org.kuali.kra.question;

import org.kuali.rice.kns.question.QuestionBase;

import java.util.ArrayList;

public class CopyPeriodsQuestion extends QuestionBase {
    
    public static final String ONE = "1";
    public static final String ALL = "0";
    
    private static final ArrayList<String> BUTTONS;
    static {
        BUTTONS = new ArrayList<String>();
        BUTTONS.add("copyoneper");
        BUTTONS.add("copyallperiods");
    }
    
    /**
     * @param question
     * @param buttons
     */
    public CopyPeriodsQuestion() {
        super("Confirm", BUTTONS);
    }

}
