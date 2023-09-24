trigger TechFirmTrigger on Employee__c (After insert,After Update,After delete) {
    
    if(Trigger.isUpdate && Trigger.isAfter)
    {
        TechFirmHandler.Method1(Trigger.new,Trigger.oldMap);
        
    }
    else if(Trigger.isDelete && Trigger.isAfter)
    {
        TechFirmHandler.Method1(Trigger.old, null);
    }
    else
    {
        TechFirmHandler.Method1(Trigger.new, null);
    }
    
}