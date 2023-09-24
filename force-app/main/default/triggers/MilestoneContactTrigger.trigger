trigger MilestoneContactTrigger on Contact (After insert, After Update) {
    
    Set<Id> accids = new Set<Id>();
    List<Account> acclist  = new List<Account>();
    
    //Step 1:- Based on Ids associated with contacts collect all the contacts associated with Account.
    if(trigger.isinsert||trigger.isupdate)
    {
        for(Contact con: trigger.new)
        {
            accids.add(con.AccountId);
        }
    }
    //Step 2:-While Looping on Account the selected Field which we needs to be implemented on and also to its associated contact Query Outside for loop. 
    for(Account acc : [SELECT Id, No_Of_Contact__c, Recently_Completed_Milestone__c,(SELECT Id, LastName, status_change__c FROM Contacts) FROM Account WHERE ID IN:accids])
    {
        Datetime dt = Datetime.newInstance(2099, 12, 31, 0, 0, 00);  //use date time instance object to select and set it with parameters.
        
        List<Contact> conlist = acc.Contacts;  //collect no of contacts associated with Account in a list of account.
        for(Contact cont : conlist)
        {
            if(cont.status_change__c == 'Completed' && cont.status_change__c != Trigger.oldMap.get(cont.Id).status_change__c) //Check whether status is changed to completed and compare it
            {                                                                                                        //with old status it's changed or not.
                dt = System.now();
            }
        }
        acc.No_Of_Contact__c = conlist.size();
        acc.Recently_Completed_Milestone__c = dt;
        acclist.add(acc);
    }
    update acclist;
}