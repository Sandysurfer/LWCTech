trigger CreateContactByNumber on Account (after insert, after update, before delete) {
    
    if(trigger.isinsert && trigger.isAfter)
    {
        CreateContactByNumberHandler.createContact(Trigger.new);
    }
    if(trigger.isupdate)
    {
        CreateContactByNumberHandler.updateCreateContact(Trigger.new,Trigger.oldMap);
    }
    if(trigger.isdelete)
    {
        CreateContactByNumberHandler.deleteAccCon(Trigger.old);
    }
}