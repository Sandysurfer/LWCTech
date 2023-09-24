//Whenever the BillingCity of any Account is updated, update MailingCity of all the Contacts related to the account.

trigger UpdateContactMailingCity on Account (After Update) {
    
    Map<Id, Account> mapAllUpdatedAccounts = new Map<Id,Account>();
    for(Account accObj : Trigger.new)    //we use trigger.new to update below new value in contacts. 
    {
        if(accObj.BillingCity != Trigger.oldMap.get(accobj.Id).BillingCity)
        {
            mapAllUpdatedAccounts.put(accObj.Id,accObj);   //key,value pair.....
        } 
    } 
    
    if(mapAllUpdatedAccounts.size()>0)
    {
        List<Contact> allContactsList = [Select Id, AccountId, MailingCity From Contact where AccountId IN : mapAllUpdatedAccounts.keySet()];
        for(Contact conObj:allContactsList)
        {
            conObj.MailingCity = mapAllUpdatedAccounts.get(conObj.AccountId).BillingCity;    //To get the  Particular contact related to account which we have to update..
        }
        update allContactsList;
    }
    
}