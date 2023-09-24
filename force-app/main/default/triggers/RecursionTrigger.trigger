trigger RecursionTrigger on Contact (before insert){ 
    
    if(trigger.isbefore && trigger.isinsert && RecursionTrigger.isRecursion)
    {
        RecursionTrigger.isRecursion = false;
        RecursionTrigger.onInsertCall(Trigger.new);
    }
    
}