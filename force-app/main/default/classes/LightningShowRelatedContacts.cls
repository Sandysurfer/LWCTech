public class LightningShowRelatedContacts {
    
    @AuraEnabled
    public static List<Contact> ContactlistofrelatedAccount(String accountid)
    {
        List<Contact> contactlist = new List<Contact>();
        for(Contact con : [Select Id, Name, AccountId, Account.Name, Email, Phone From Contact Where AccountId =: accountid])
        {
            contactlist.add(con);
        }
        return contactlist;
        
    }
    
}