public class LightningAccountContactsController {
    
    @AuraEnabled
    public static List<Contact> GetAccountContacts(string accName)
    {
        Account accObj = [Select Id,Name From Account Where Name =: accName Limit 1];
        
        List<Contact> accContacts = [Select Id,Name,AccountId,Email,Phone From Contact Where AccountId =: accobj.id];
        
        return accContacts;
        
    }
    
}