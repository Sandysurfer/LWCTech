public class CaseTriggerHandler {
    
    public static void onInsertCheckDomain(List<Case> newCaseList)
    {
        //Step 1: Map to store domain with case record.
        Map<String,Case> mapCaseDomain = new Map <String,Case>();
        
        for(Case caseobj : newCaseList)
        {
            //Step 2: Check For Null value.
            if(caseobj.SuppliedEmail != null)
            {
                //Step 3: Getting Value from email i.e domain ('@gmailcom')
                String ValueOfDomain =  caseobj.SuppliedEmail.SubstringAfter('@');
                System.debug('Value Of Domain----> '+ValueOfDomain);
                //Step 4: Put the value in map format with domain as key and value as case object.
                mapCaseDomain.put(ValueOfDomain,caseobj);   //(@gmail.com,case record)
            }
        }
        System.debug('MapCaseDomain----> '+mapCaseDomain);
        //Step 5: Check for Empty Map
        if(!mapCaseDomain.isEmpty())
        {
            for(Contact conobj : [Select Id,Email,Domain__c,AccountId From Contact Where Domain__c IN : mapCaseDomain.keyset()])
            {
                if(conobj != null)
                {
                    if(mapCaseDomain.containskey(conobj.Domain__c)) 
                    {   //Attach with contact
                        mapCaseDomain.get(conobj.Domain__c).contactId = conobj.id;
                    }
                    if(conobj.AccountId != null)
                    {  //Attach with Contact
                        mapCaseDomain.get(conobj.Domain__c).AccountId = conobj.AccountId;
                    }
                }
            }
        }
        
    }
    
}