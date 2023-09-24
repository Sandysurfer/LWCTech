//Apex Class to Count No of OpportunityLineItems Associated With Opportunity and display the Count(Number of Products) on Account Object Custom Field....... 

public class OpportunityLineItemHandler {
    
    public static void updateCountofProducts(List<OpportunityLineItem> oliList){
        
        Set<Id> oppIds = new Set<Id>();
        Map<Id,Decimal> oliMap = new Map<Id,Decimal>();
        List<Account> accListToUpdate = new List<Account>();
        
        for (OpportunityLineItem oli : oliList) {
            //Add the Opportunity ID to the set only if it's not null
            if (oli.OpportunityId != null) {
                oppIds.add(oli.OpportunityId);
            }
        } 
        
        if(!oppIds.isEmpty()){
            List<Opportunity> oppList = [Select Id,AccountId From Opportunity Where Id IN : oppIds];
            if(!oppList.isEmpty()){
                for(Opportunity opp : oppList){
                    oliMap.put(opp.AccountId, 0);
                }
            }
            for(AggregateResult aggr : [Select Count(Id) oli, opportunity.AccountId From OpportunityLineItem Where Opportunity.AccountId IN : oliMap.keySet() group by opportunity.AccountId]){
                oliMap.put((Id)aggr.get('AccountId'), (Decimal) aggr.get('oli'));
            }
            
            for(Id accIds : oliMap.keySet()){
                Account acc = new Account();
                acc.Id = accIds;
                acc.Number_of_Product__c = oliMap.get(accIds); 
                accListToUpdate.add(acc);
            }
            if(!accListToUpdate.isEmpty()){
                try
                {
                    update accListToUpdate;
                }
                catch(exception ex)
                {
                    System.debug('Error While  Updating Record--->'+ex.getMessage());   
                }
            }
        }
        
    }
    //2.Update Asset Value related with oppLineItem on Opportunity Related Account......
    Public static void updateAssetonAccount(List<OpportunityLineItem> oliList){
        Set<Id> oppIds = new Set<Id>();
        List<Asset> assetList =  new List<Asset>();
        
        for(OpportunityLineItem oli : oliList){
            oppIds.add(oli.OpportunityId);
        }
        if(!oppIds.isEmpty()){
            List<Opportunity> oppList = [Select Id,Account.Name,AccountId From Opportunity Where Id IN : oppIds];
            if(!oppList.isEmpty()){
                for(Opportunity opp : oppList){
                    if(opp.AccountId != Null){
                        Asset assObj = new Asset();
                        assObj.Name = opp.Account.Name+ 'OpportunityLineItems';
                        assObj.AccountId = opp.AccountId;
                        assetList.add(assObj);
                    }
                    
                }
                if(!assetList.isEmpty()){
                    insert assetList;
                }
            }      
        }
    }
    //Prevent insertion of OpportunityLineItem if Family and Product Family Field of Opportunity and Product Objects does not match.......... 
    public static void preventInsertion(List<OpportunityLineItem> oliList){
        Set<Id> oppIds = new Set<Id>();
        Set<Id> proIds =new Set<Id>();
        
        if(oliList.isEmpty()){
            for(OpportunityLineItem ol : oliList){
                oppIds.add(ol.opportunityId);
                proIds.add(ol.Product2Id);
            }
        }
        if(!oliList.isEmpty() && !proIds.isEmpty()){
            Map<Id,Opportunity> oppMap = new Map <Id,Opportunity>([Select Id,Product_Family__c FROM Opportunity Where Id IN : oppIds]);
            Map<Id,Product2> proMap = new Map<Id,Product2>([Select Id,Family FROM Product2 Where Id IN : proIds]);
            
            if(!oliList.isEmpty()){
                for(OpportunityLineItem olObj : oliList){
                    if(oppMap.containsKey(olObj.OpportunityId) && proMap.containsKey(olObj.Product2Id)
                       && oppMap.get(olObj.OpportunityId).Product_Family__c != proMap.get(olObj.Product2Id).Family)
                    {
                        olObj.addError('Family and Product Family of Oppoprtunity and Product are not Same');
                    }
                }
            }
        }
        
        
    }
}