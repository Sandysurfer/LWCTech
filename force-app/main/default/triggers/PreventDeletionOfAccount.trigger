trigger PreventDeletionOfAccount on Account (before delete) {  // Condition to check that the code should run only before the account is being deleted
    
    
    // List of accounts with associated Contacts By Using Map We get All The Account With Related Contacts By Map.
    Map<Id,Account> mapofAllAccounts = new Map<Id, Account>();
    for(Account ac: [Select Id,(Select Id From Contacts) From Account WHERE Id IN : Trigger.oldMap.keyset()]){
        mapofAllAccounts.put(ac.Id,ac);
    }
    
    // Condition to check if any Contact is associated for each account,// If yes, then throw the error.
    //for showing error use context variable bcoz error shows on context variable.
    for(Account acc : Trigger.old)
    {
        if(!mapofAllAccounts.get(acc.Id).Contacts.isEmpty()) // 2nd condition:-(Contacts.size()>=2;(for deletion of Account Which has more than 2 or more contacts)).
        {
            acc.addError('Account associated With Contacts cannot be deleted.');
        }
    }
}