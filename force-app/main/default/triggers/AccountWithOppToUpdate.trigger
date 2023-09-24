trigger AccountWithOppToUpdate on Account (After Update) {
    
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        AccountWithOppToUpdateHandler.updateRelatedopp (Trigger.new,Trigger.oldMap); 
    }
    
}