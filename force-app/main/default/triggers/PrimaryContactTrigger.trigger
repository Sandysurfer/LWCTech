trigger PrimaryContactTrigger on Contact (before insert,before Update, After insert) {
    
  // Enforce Single Primary Contact on Account.......
    if(trigger.isBefore && trigger.isUpdate)
    {
        PrimaryContactHandler.updatePrimaryContact(trigger.new,trigger.oldMap);
    }
    else if(trigger.isBefore && trigger.isInsert)
    {
       PrimaryContactHandler.updatePrimaryContact(trigger.new, null); 
    }
    
}