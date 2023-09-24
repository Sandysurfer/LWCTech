trigger ContactTrigger on Contact (before insert,before update) {
    
    if(Trigger.isBefore && (Trigger.isinsert || Trigger.isupdate))
    {
        ContactTriggerHandler.MappedAccount(Trigger.new,Trigger.oldMap);
    }

}