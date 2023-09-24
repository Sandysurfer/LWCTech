//Write a trigger to calculate the sum of all Amount of Total Opportunities on Account Object(TotalOppAmount__c).......

trigger SumOfAllOppAmountRelatedWithAccount on Opportunity (after insert,after update, after delete, after undelete) {
    
    Set<Id> accIds = new Set<Id>(); 
    if(trigger.isAfter && trigger.isInsert || trigger.isundelete)
    {
        for(Opportunity opp : trigger.new)
        {
            if(opp.AccountId != null)
            {
                accIds.add(opp.Id);
            }
        }
    }
    
    if(trigger.isAfter && trigger.isUpdate)
    {
        for(Opportunity opp : trigger.new)
        {
            if(opp.AccountId != trigger.oldMap.get(opp.Id).AccountId)
            {
                accIds.add(opp.AccountId);
                accIds.add(trigger.oldMap.get(opp.id).AccountId);
            }
            else
            {
                accIds.add(opp.AccountId);
            }
        }
    }
    
    if(trigger.isAfter && trigger.isDelete)
    {
        for(Opportunity opp : trigger.old)
        {
            if(opp.AccountId !=  null)
            {
                accIds.add(opp.AccountId);
            }
        }
    }
    
    List<AggregateResult> aggrList = [Select AccountId ids, Sum(Amount) totalAm From Opportunity WHERE AccountId IN : accIds group by AccountId]; 
    Map<Id,Account> accMap = new Map<Id,Account>();
    
    if(!aggrList.isEmpty())
    {
        for(AggregateResult aggr : aggrList)
        {
            Account acc = new Account();
            acc.Id = (Id)aggr.get('ids');
            acc.TotalOppAmount__c = (Decimal)aggr.get('totalAm');
            accMap.put(acc.Id, acc);
            
        }
    }
    else
    {
        for(Id accId : accIds)
        {
            Account acc = new Account();
            acc.Id = accId;
            acc.TotalOppAmount__c = 0;
            accMap.put(acc.Id, acc);
        }
    }
    
    if(!accMap.isEmpty())
    {
        update accMap.values(); 
    }
}