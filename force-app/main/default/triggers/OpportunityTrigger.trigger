trigger OpportunityTrigger on Opportunity (after update,after insert,after delete,after undelete) {
    
    if(Trigger.isUpdate && Trigger.isAfter)
    {
        //OpportunityTriggerHelper.checkOpportunityStage(Trigger.new,Trigger.oldmap);
        
        OpportunityHandler.updateMaxOppMethod(trigger.new,trigger.oldMap);
    }
    else if(trigger.isDelete && trigger.isAfter)
    {
        OpportunityHandler.updateMaxOppMethod(trigger.old, null);
    }
    else if(trigger.isInsert && trigger.isAfter)
    {
        OpportunityHandler.updateMaxOppMethod(trigger.new, null);
    }
    
}