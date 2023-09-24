//Write an Apex Class to Enforce Single Primary Contact on Account.......
public class PrimaryContactHandler {
    
    public static void updatePrimaryContact(List<Contact> conList, Map<Id,Contact> oldMap){
        
        Set<Id> parentIds = new Set<Id>();
        Map<Id,Integer> conMap = new Map<Id,Integer>();
        
        if(!conList.isEmpty())
        {
            for(Contact con : conList)
            {
                if(oldMap != null)
                {
                    Contact oldcon = oldMap.get(con.id);
                    if(con.AccountId != oldcon.AccountId)
                    {
                        parentIds.add(oldcon.AccountId);
                        parentIds.add(con.AccountId);
                    }
                    else
                    {
                        parentIds.add(con.AccountId); 
                    }
                }
                else
                {
                    parentIds.add(con.AccountId); 
                }
            }
        }
        if(!parentIds.isEmpty())
        {
            List<Contact> contactList = [Select Id, AccountId, Primary_Contact__c From Contact Where AccountId IN : parentIds AND Primary_Contact__c = TRUE]; 
            if(!contactList.isEmpty())
            {
                for(Contact conObj : contactList)
                {
                    conMap.put(conObj.AccountId,contactList.size());
                }
                
                for(Contact errorCon : conList)
                {
                    if(errorCon.primary_Contact__c == true && conMap.containsKey(errorCon.AccountId) && conMap.get(errorCon.AccountId) > 0)
                    {
                        errorCon.addError('This Account cannot have more than one primary contact');
                    }
                }
            }
        }
        
    }
    // 2nd Method to do the Same...
    public static void updateContactMap(List<Contact> conList,Map<Id,Contact> conMap){
        
        Set<Id>accIds = new set<Id>();
        Map<Id,Contact> contactMapToUpdate = new Map<Id,Contact>();
        Map<Id,Integer> CountConMap = new Map<Id,Integer>();
        
        for(Contact con : conList)
        {
            if(con.AccountId != null)
            {
                accIds.add(con.id);
            }
        } 
        //soql query to get all the contacts whose date of creating is greater.
        for(Contact conobj :[SELECT Id, AccountId, Primary_Contact__c FROM Contact Where AccountId IN:accIds Order by CreatedDate ASC])
        {
            if(!CountConMap.containsKey(conobj.AccountId))   //check whether the contactMap contains contact id then implement the logic 
            {
                conobj.Primary_Contact__c = true;
                CountConMap.put(conobj.AccountId, 1);
                contactMapToUpdate.put(conobj.AccountId,conobj);
            }
            else
            {
                conobj.Primary_Contact__c = false;         //check whether the contactMap doesnt contains contact id then implement the logic        
                CountConMap.put(conobj.AccountId,CountConMap.get(conobj.AccountId) +1);
            }
        }
        if(!contactMapToUpdate.isEmpty() && contactMapToUpdate.size()>0)
        {
            update contactMapToUpdate.values(); 
        }
        
    }
    
}