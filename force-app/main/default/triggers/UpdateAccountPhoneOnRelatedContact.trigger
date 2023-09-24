// When I Update Phone no of Account then all its related contact phone should also be update with same values.........
 
trigger UpdateAccountPhoneOnRelatedContact on Account (After update) {
   
    // Get the current records
    Map<Id,Account> currentAccRecords = new Map<Id,Account>();
    for(Account acc : Trigger.new)
    {
        if(acc.Phone != null){
            currentAccRecords.put(acc.Phone, acc);
        }
    }
    //Step 2: Get Contacts based on Account.
    List<Contact> existingconlist = new List<Contact>();
    for(Contact con : [SELECT Id, AccountId, Phone FROM Contact Where AccountId  =: trigger.newMap.keySet()])
    {    // Compare the phone value with old value and check wheteher it contains accountid
        if(trigger.oldmap.get(con.AccountId).phone != currentAccRecords.get(con.AccountId).phone && currentAccRecords.containsKey(con.AccountId)) 
        {
            con.Phone = currentAccRecords.get(con.AccountId).phone;
            existingconlist.add(con);
        }
        if(existingconlist.size()>0)
        { // update...
            update existingconlist;
        }
    }
    
}