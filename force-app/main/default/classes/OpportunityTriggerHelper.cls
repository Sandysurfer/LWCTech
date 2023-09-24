public class OpportunityTriggerHelper {
    
    public static void checkOpportunityStage(List<Opportunity> oppList, Map<Id,Opportunity> oldmap)
    {
        Set<Id> oppAccountId = new Set<Id>();
        List<Account> updatedAccount = new List<Account>();  
        for(Opportunity opp : opplist) 
        {
            if(opp.StageName == 'Closed Won' && opp.StageName != oldmap.get(opp.id).StageName)
            {
                oppAccountId.add(opp.AccountId);
            }
        }
        
        if(oppAccountId.size()>0)
        {
            List<Account> accList = new List<Account>([Select Id,Has_Open_Opportunities__c,(Select Id From Opportunities where StageName != 'Closed Won') From Account Where Id IN:oppAccountId]);
            
            if( accList != null && !accList.isEmpty() && accList.size()>0)
            {
                for(Account acc:accList)
                {
                    Integer oppCount = acc.Opportunities.size();
                    
                    if(oppCount > 0 && acc.Has_Open_Opportunities__c == True)
                    {
                        acc.Has_Open_Opportunities__c = False;
                        updatedAccount.add(acc);
                    }
                    
                    if(oppCount==0 && acc.Has_Open_Opportunities__c == False) 
                    {
                        acc.Has_Open_Opportunities__c = True;
                        updatedAccount.add(acc);
                    }
                    
                }
            }
            if(!UpdatedAccount.isEmpty() && UpdatedAccount.size()>0)
            {
                update(updatedAccount);
            }
        }
        
    }
}