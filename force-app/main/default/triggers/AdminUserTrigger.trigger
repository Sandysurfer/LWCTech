trigger AdminUserTrigger on User (after insert,after update) {
    
    if(Trigger.isAfter && Trigger.isinsert)
    {
        UserTriggerHandler.MoveToAdminsGroup(Trigger.new);
    }
    
    if(Trigger.isafter && Trigger.isupdate)
    {
        UserTriggerHandler.UpdateAdminGroup(Trigger.new,Trigger.oldMap);
    }
}