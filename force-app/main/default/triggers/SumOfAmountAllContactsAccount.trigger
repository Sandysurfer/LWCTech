trigger SumOfAmountAllContactsAccount on Contact (After insert,After update,After delete,After undelete) {
    
    set<Id> accids = new Set<Id>();
    //Step 1: Collect all the contacts related to account
    if(trigger.isinsert||trigger.isupdate||trigger.isundelete)
    {
        for(Contact con : trigger.new)
        {
            if(con.AccountId != null)
            {
                accids.add(con.AccountId);   
            }
        }
    }
    if(trigger.isupdate||trigger.isdelete)
    {
        for(Contact con: trigger.old)
        {
            if(con.AccountId != null)
            {
                accids.add(con.AccountId);
            }
        }
    }
    List<Account> relatedAcclist = [Select Id,No_Of_Contact__c,Sum_Of_Amount_All_Contact__c,(Select Id,Amount__c From Contacts)From Account where Id IN : accids];
    
    for(Account acc : relatedAcclist)
    {
        acc.No_Of_Contact__c = acc.Contacts.size();
        
        Decimal sumOfallAmounts = 0;
        
        for(Contact con : acc.contacts)
        {
            sumOfallAmounts =  sumOfallAmounts + con.Amount__c;  
        }
        acc.Sum_Of_Amount_All_Contact__c = sumOfallAmounts;
    }
    update relatedAcclist;
    
}