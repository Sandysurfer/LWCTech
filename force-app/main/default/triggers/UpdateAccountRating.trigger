trigger UpdateAccountRating on Opportunity (After insert, After update) {
    
    Set<Id> accIds = new Set<Id>();
    List<Account> acclist = new List<Account>();
    
    for(Opportunity opp : Trigger.new)
    {
        if(opp.StageName == 'Closed Won')
        {
            accIds.add(opp.AccountId);
        }
    }
    
    for(Account acc : [Select Id,Rating From Account Where Id IN: accIds])
    {
        acc.Rating = 'Hot';
        acclist.add(acc);
    }
    if(acclist.size()>0)
    {
        update acclist ;
    }
    
}