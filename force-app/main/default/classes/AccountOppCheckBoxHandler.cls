//Write Apex Class to Automatically close all Opportunities with Probability > 70%, when checkbox(Close_all_Opps__c) is checked on Account.....

public class AccountOppCheckBoxHandler {
    
    public static void updateAccountCheckbox(List<Account> accList,Map<Id,Account> oldMap){
        Set<Id> accIds = new Set<Id>();
        
        if(!accList.isEmpty())
        {
            for(Account acc : accList)
            {
                if(acc.Close_all_Opps__c == true && oldMap.containskey(acc.id)  && oldMap.get(acc.Id).Close_all_Opps__c == false)
                {
                    accIds.add(acc.Id);
                }
            }
        }
        
        if(!accIds.isEmpty())
        {
            List<Opportunity> oppList = [Select Id,AccountId,StageName From Opportunity Where AccountId IN : accIds AND StageName != 'Closed Won' AND Probability >= 70];
            List<Opportunity> listToUpdate = new List<Opportunity>();
            
            if(!oppList.isEmpty())
            {
                for(Opportunity opp : oppList)
                {
                    opp.StageName = 'Closed Won';
                    opp.CloseDate = date.today();
                    listToUpdate.add(opp);
                }
            }
            if(!listToUpdate.isEmpty())
            {
                update listToUpdate;
            }
        }
        
    }
}