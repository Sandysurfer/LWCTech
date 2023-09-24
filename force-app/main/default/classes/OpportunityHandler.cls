//Update the Parent Account Field(Max_Opportunity__c) with Opportunity Name Which has Highest Amount...........

public class OpportunityHandler {
    
    public static void updateMaxOppMethod(List<Opportunity> oppList,Map<Id,Opportunity>oldMap){
        Set<Id> parentIds = new Set<Id>();
        if(!oppList.isEmpty())
        {
            
            for(Opportunity newOpp : oppList)
            {
                if(oldMap != null)
                {
                    Opportunity oldOpp = oldMap.get(newOpp.id);
                    if(newOpp.AccountId != oldOpp.AccountId)
                    {
                        parentIds.add(oldOpp.AccountId);
                        parentIds.add(newOpp.AccountId);
                    }
                    else
                    {
                        parentIds.add(newOpp.AccountId);
                    }
                }
                
            }
        }
        if(!parentIds.isEmpty())
        {
            List<Account> accList = [Select Id, Max_Opportunity__c,(Select Name,Amount From Opportunities Where Amount != null order by Amount DESC LIMIT 1) From Account Where Id IN : parentIds];
            List<Account> listToUpdateAcc = new List<Account>();
            if(!accList.isEmpty())
            {
                for(Account acc : accList)
                {
                    if(!acc.Opportunities.isEmpty())
                    {
                        acc.Max_Opportunity__c = acc.Opportunities[0].Name;
                        listToUpdateAcc.add(acc);
                    }
                    else
                    {
                        acc.Max_Opportunity__c = '';
                        listToUpdateAcc.add(acc);
                        
                    }
                }
                if(!listToUpdateAcc.isEmpty())
                {
                    update listToUpdateAcc;
                }
            }
            
        }
        
    }
    
}