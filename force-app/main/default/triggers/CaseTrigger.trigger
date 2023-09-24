trigger CaseTrigger on Case (before insert) {
    
    if(Trigger.isbefore && Trigger.isinsert)
    {
        CaseTriggerHandler.onInsertCheckDomain(Trigger.new);
    }

}