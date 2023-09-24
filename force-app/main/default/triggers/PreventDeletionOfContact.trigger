trigger PreventDeletionOfContact on Contact (before delete) {
    
    //Step 1: Create a Map to store accountid as key an Account related With Contacts records as value
    Map<Id,Account> accMap = new Map<Id,Account>();
    
    //Step 2: Collect Realtive data in the map created in step 3
    for(Account acc : [Select Id,Name From Account Where Id IN : trigger.oldMap.keySet()])
    {
        accMap.put(acc.id,acc);
    }
    //Step 3: Iterate the Main Logic in for loop
    for(Contact con : Trigger.old)
    {
        if(accMap.containsKey(con.AccountId))
        {
            if(accMap.get(con.AccountId) != null)
            {
                con.addError('Contact cannot be deleted');
            }
        }
    }
    
    
}