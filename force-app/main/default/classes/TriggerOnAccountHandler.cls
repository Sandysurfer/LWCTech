public class TriggerOnAccountHandler {
    
    public static void onInsertAccount(List<Account>acclist,Map<Id,Account> oldmapAcc)
    {
        List<Contact> conlistInsert = new List<Contact>();
        Set<Id> accids = new Set<Id>();
        for(Account acc : acclist)
        {
            if(oldmapAcc == null)
            {
                Contact con = new Contact();
                con.LastName = acc.Name;
                con.AccountId = acc.id;
                conlistInsert.add(con);
            }
            if(oldmapAcc != null && (oldmapAcc.get(acc.id).Field_Update__c != acc.Field_Update__c) && acc.Field_Update__c == true)
            {
                accids.add(acc.id);
            }
        }
        List<Contact> conlistUpdate = new List<Contact>();
        if(!accids.isEmpty())
        {
            for(Contact con : [Select Id,Description,AccountId from Contact Where AccountId IN :accids])
            {
                con.Description = 'Account Field Updated To be True';
                conlistUpdate.add(con);
            }
        }
        if(!conlistUpdate.isEmpty())
        {
            update conlistupdate;
        }
       /* if(!conlistInsert.isEmpty())
        {
            insert conlistInsert;
        }*/
    }
    
}