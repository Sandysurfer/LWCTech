trigger RecursiveTrigger on Opportunity (before insert) {
    
    if(Trigger.isinsert && Trigger.isbefore && RecursiveTriggerHelper.recursiveflag)
    {
        RecursiveTriggerHelper.recursiveflag = false;
        RecursiveTriggerHelper.CreateSystemGenOpp(Trigger.new);
        
    }
    

}