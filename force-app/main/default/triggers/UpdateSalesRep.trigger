// When we create the Account record, the Account owners will be automatically added to the sales rep field. 

trigger UpdateSalesRep on Account (before insert,before update) {
    
    if(trigger.isbefore && trigger.isinsert)
    {
        Set<Id> accOwnerSet = new Set<Id>();
        for(Account acc:Trigger.new)
        {
            accOwnerSet.add(acc.ownerId);
        }
        
        Map<Id,User> userMap = new Map<Id,User>([Select Name From User Where Id IN : accOwnerSet]);
        
        for(Account acc:Trigger.new)
        {
            user usr = usermap.get(acc.ownerId);
            acc.sales_Rep__c = usr.Name;
            
        }
        
    }
    
    
}