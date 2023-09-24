trigger AccountCityUpdate on Account (after update, before Insert) {
     //----->trigger to update a field (city__c) in opportunity when same field(Billingcity) is updated in account
    
    if(Trigger.isUpdate && Trigger.isAfter){
        
        Set<Id> accountids = new Set<Id>();
        for(Account acc: Trigger.new)
        {
            if(acc.BillingCity != Trigger.oldMap.get(acc.Id).BillingCity)
            {
                accountids.add(acc.id);
            }
        }
        List<Opportunity> oppList = [SELECT ID,City__c,AccountId FROM Opportunity WHERE AccountId IN : accountids];
        for(Opportunity opp:oppList)
        {
            opp.City__c = Trigger.newMap.get(opp.AccountId).BillingCity;
            
        }
        Update oppList;
    }
    
    //------>Write an Apex Trigger to Prevent the users to create Duplicate Accounts With Same Name.
    
    if(Trigger.isInsert && Trigger.isBefore)
    {
        Set<Id> accids = new Set<Id>();
        List<Account> accList = new List<Account>();
        List<String> Duplicatename = new List<String>();
        
        for(Account accobj : Trigger.new)
        {
            accids.add(accobj.Name);
            
        }
        //duplicate records of account in the list 
        List< Account> acc = [Select Id,Name From Account Where Name IN : accids];
        for(Account ac : acc)
        {
            Duplicatename.add(ac.Name);
        }
        
        //iterating over all account and seggregate list which contains duplicate name 
        for(Account ac: Trigger.new)
        {
            if(Duplicatename.contains(ac.name))
            {
                accList.add(ac);
            }
        }
        for(Account accl: accList)
        {
            accl.addError('You Cannot Create Account With Same Name');
        }
    }
}