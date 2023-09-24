trigger AccountDescriptionUpdate on Contact (After insert,After Update) {
    
    Map<Id,String> mapAccIdDesc = new Map<Id,String>();
    List<Account> acclist = new list<Account>();
    
    for(Contact con : Trigger.new)
    {   //Check if contact is primary and comparing the current contact primary contact with the old contacts
        if(con.Primary_Contact__c == true && con.Primary_Contact__c != Trigger.oldMap.get(con.id).Primary_Contact__c)
        {
            mapAccIdDesc.put(con.AccountId, con.Description);
        }
    }
    
    if(mapAccIdDesc != null)
    {
        for(Account acc : [Select Id,Name,Description From Account Where Id IN : mapAccIdDesc.keySet()])
        {
            acc.Description = mapAccIdDesc.get(acc.Id);
            acclist.add(acc);
        }
    }
    if(!acclist.isEmpty())
    {
        update acclist;
    }
}