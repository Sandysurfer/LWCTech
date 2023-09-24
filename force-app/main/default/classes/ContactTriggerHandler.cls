public class ContactTriggerHandler {
    
    public static void updateMappedAccount(List<Contact> newConlist,Map<Id,Contact> oldConMap)
    {
        Set<Id> accids = new Set<Id>();
        Map<Id,Contact> mapOfAccCon = new Map<Id,Contact>();
        
        if(!newConlist.isEmpty()) {
            for(Contact con : newConlist) { 
                //Condition to map Contact on Account 
                if(con.Sync__c == true && con.AccountId != null){ 
                    //check for before insert call with value in old map
                    if(oldConMap == null)
                    {
                        mapOfAccCon.put(con.AccountId,con);
                    }
                     //before update call only for the specific action
                    else if(oldConMap != null && ((con.FirstName != oldConMap.get(con.Id).FirstName)||
                                                  (con.LastName != oldConMap.get(con.Id).LastName)||
                                                  (con.Email != oldConMap.get(con.Id).Email)||
                                                  (con.Phone != oldConMap.get(con.Id).Phone))||
                            (con.AccountId != oldConMap.get(con.id).AccountId)|| (con.Sync__c == true))
                    {
                        mapOfAccCon.put(con.AccountId,con);
                    }
                }
            }     
        }
        
        List<Account> acclistUpdate = new List<Account>();
        if(!mapOfAccCon.isEmpty())
        {   //Query over the Account for the ids stored in map.
            for(Account acc : [SELECT Id, Contact_First_Name__c, Contact_Email__c, Contact_Last_Name__c, Contact_Phone__c FROM Account Where Id IN : mapOfAccCon.keyset()])
            {
                if(mapOfAccCon.containskey(acc.id))
                {
                    acc.Contact_First_Name__c = mapOfAccCon.get(acc.id).FirstName;
                    acc.Contact_Last_Name__c = mapOfAccCon.get(acc.id).LastName;
                    acc.Contact_Email__c = mapOfAccCon.get(acc.id).Email;
                    acc.Contact_Phone__c = mapOfAccCon.get(acc.id).Phone;
                    acclistUpdate.add(acc);
                }
            }
            if(!acclistUpdate.isEmpty())
            {
                update acclistUpdate;
            }
            
        }
        
    }
    
}