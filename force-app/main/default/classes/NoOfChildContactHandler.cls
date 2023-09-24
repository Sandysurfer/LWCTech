public class NoOfChildContactHandler{
    
    //ROLLUP Summary example for insert and delete only.(for update we have to add some field on relationship query where we contact related to account.)
    public static void CountOfContact(List<Contact> newConlist, List<Contact> oldConlist)
    {
        Set<Id> accIds = new Set <Id>();
        
        if(newConlist != null){
            for(Contact con : newConlist){
                if(con.AccountId != null){
                    accIds.add(con.AccountId);
                }
            }
        }
        else if(oldConlist != null){
            for(Contact con : oldConlist){
                if(con.AccountId != null){
                    accIds.add(con.AccountId);
                }
            }
        }
        List<Account> acclist = new List<Account>();
        
        if(!accIds.isEmpty())
        {
            for(Account accobj :  [SELECT Id, Total_Contacts_Count__c,(Select Id from Contacts)FROM Account Where Id IN : accIds])
            {
                if(accobj.contacts.size()>0)
                {
                    accobj.Total_Contacts_Count__c = accobj.Contacts.size();
                    accList.add(accobj);
                }
                else
                {
                    accobj.Total_Contacts_Count__c = 0;
                    acclist.add(accobj);
                }
            }
        }
        
        if(!accList.isEmpty())
        {
            update accList;
        }
        
    }
    
    
}