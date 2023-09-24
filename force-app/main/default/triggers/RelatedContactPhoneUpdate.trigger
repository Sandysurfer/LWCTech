//Write an trigger to update contact phone whenever acccount phone is updated with new value.....(update child by parent)
trigger RelatedContactPhoneUpdate on Account (After Update) {
    
    Map<Id,Account> accMap = new Map<Id,Account>();
    if(trigger.isAfter && trigger.isupdate)
    { 
        for(Account acc : trigger.new)
        {
            if(acc.phone != trigger.oldMap.get(acc.id).phone)
            {
                accMap.put(acc.Id,acc);
            }
        }
    }
    List<Contact> contactlist = [Select Id,AccountId,Phone From Contact Where AccountId IN : accMap.keySet()];
   
    List<Contact> ConlistUpdate = new List<Contact>();
    
    if(!ConlistUpdate.isEmpty())
    {
        for(Contact con : contactlist)
        {
            con.Phone = accMap.get(con.AccountId).Phone;
            ConlistUpdate.add(con);
        }
    }
    if(!ConlistUpdate.isEmpty())
    {
        update ConlistUpdate;
    }
}