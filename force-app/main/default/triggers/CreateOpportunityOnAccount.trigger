trigger CreateOpportunityOnAccount on Account (after insert, after Update) {
    List<Account> accountList = new List<Account>();
    for(Account accountobj:Trigger.new)
    {
        if(accountobj.Industry == 'Agriculture')
        {
            accountList.add(accountobj);
        }
    }
    
    if(accountList.size()>0)
    {
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account accountListobj: accountList)
        {
            Opportunity oppobj = new Opportunity();
            oppobj.StageName = 'Prospecting';
            Oppobj.Amount = 0;
            oppobj.CloseDate = System.today()+90;
            oppobj.AccountId = accountListobj.Id;
            oppobj.Name = accountListobj.Name  + 'Opportunity';
            oppList.add(oppobj);
        }
        insert oppList;    
    }
    
}