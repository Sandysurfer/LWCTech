//Automatically create related Contact on insertion of Account and update client contact lookup field on Account.......
public class updateClientContactLookupField {
    
    public static void updateRelatedField(List<Account> accList){
        Set<Id> accIds = new Set<Id>();
        List<Contact> conList = new List<Contact>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        List<Account> accListToUpdate = new List<Account>();
        
        if(!accList.isEmpty())
        {
            for(Account acc : accList)
            {
                Contact con = new Contact();
                con.LastName = 'Test Con '+acc.Name;
                con.AccountId = acc.Id;
                conList.add(con);
                accIds.add(acc.Id);
            }
            if(!conList.isEmpty())
            {
                insert conList;
            }
            if(!accIds.isEmpty())
            {
                List<Account> acctList = [Select Id,Client_Contact__c From Account Where Id IN : accIds];
                if(!acctList.isEmpty())
                {
                    for(Account acc : acctList)
                    {
                        accMap.put(acc.Id,acc);
                    }
                }
                if(!conList.isEmpty())
                {
                    for(Contact con : conList)
                    {
                        if(accMap.containsKey(con.AccountId))
                        {
                            Account ac = accMap.get(con.AccountId);
                            ac.Client_Contact__c = con.Id;
                            accListToUpdate.add(ac);
                        }
                    }
                }
                if(!accListToUpdate.isEmpty())
                {
                    update accListToUpdate;
                }
            }
        }
        
    }
    
}