trigger TriggerAccount on Account (After insert,After update) {
    
    if(Trigger.isAfter && (Trigger.isupdate || Trigger.isinsert))
    {
        TriggerOnAccountHandler.onInsertAccount(Trigger.new, Trigger.oldMap);
    }

}