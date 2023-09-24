trigger AvoidDuplicateCreationofAccount on Account (before insert) {
    
    //Step 1: Create a list to store account names
    Set<String> accNames = new Set<String>();
    
    //Step 2: Collect all the account names in list created in step 1
    for(Account acc : Trigger.new)
    {
        accNames.add(acc.Name);
    }
    
    //Step 3: Create a list to store duplicate names of account
    Set<String> dupnames = new Set<String>();
    
    //Step 4: Collect all the existing account names in the list created in step 3.
    for(Account accobj : [Select Id,Name From Account Where Name IN : accNames])
    {
        dupNames.add(accobj.Name);
    }
    //Step 5: Iterate Main logic in for loop and use list created in step 3 for comparison.
    for(Account acc : Trigger.new)
    {
        if(dupNames.contains(acc.Name))
        {
            acc.Name.addError('Account With Same Name Already Exists ');
        }
    }
    
}