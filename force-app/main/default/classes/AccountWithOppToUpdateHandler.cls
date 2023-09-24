public class AccountWithOppToUpdateHandler {
    
    public static void updateRelatedopp (List<Account> newAccounts, Map<Id,Account> oldMap)
    {
        Map<Id,Account>accMapToUpdate = new Map<Id,Account>();
        
        for(Account acc:newAccounts)
        {
            if(oldMap!=null && acc.phone!= oldMap.get(acc.id).phone)
            {
                accMapToUpdate.put(acc.Id,acc);
            }
        }
        
        List<Opportunity> relatedopp = [Select Id,AccountId,TrackingNumber__c From Opportunity Where AccountId IN :accMapToUpdate.keyset()];
        
        List<Opportunity> UpdatedFinalOpportunity = new List<Opportunity>();
        
        for(Opportunity opp : relatedopp)
        {
            if(accMapToUpdate.containskey(opp.AccountId))
            {
                Opportunity oppUpdate = new Opportunity();
                oppUpdate.Id = opp.id;
                oppUpdate.TrackingNumber__c = accMapToUpdate.get(opp.AccountId).phone;
                UpdatedFinalOpportunity.add(oppUpdate);
            }
        }
        update relatedopp;
        
    }
    
}