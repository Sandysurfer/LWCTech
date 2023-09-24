trigger UpdateContactOwnerOnAccount on Account (After update) {
    
    List<Id> updatedOwnerList = new List<Id>();
    
    for(Account newAccountobj:Trigger.new)
    {
        Account previousRecord = Trigger.oldMap.get(newAccountobj.Id);
        if(newAccountobj.OwnerId != previousRecord.OwnerId)  //  new Record Owner ID != Old Record Owner Id. verify if the Owner is changed or not.
        {
            updatedOwnerList.add(newAccountobj.Id);
        }
    }
    
    // check if at least 1 account was updated with new owner
    if(updatedOwnerList.size()>0)
    {
        // Get list of all the contacts..
        List<contact> allAccountcontactsList = [Select Id, OwnerId, AccountId FROM Contact Where AccountId IN:updatedOwnerList];
        
        // Get the Owner Id value from newMap of ContactsAccount and update the contact's Owner
        for(Contact conObj : allAccountcontactsList)
        {
            conObj.OwnerId = Trigger.newMap.get(conObj.AccountId).OwnerId;
        }
        update allAccountcontactsList;
    }
    
}