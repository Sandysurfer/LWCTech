trigger CloseOpportunityTrigger on Account (after update) {
    set<Id> accids = new Set<Id>();
    if(trigger.isAfter && trigger.isupdate){
        for(Account acc : trigger.new){
            accids.add(acc.id);
        }
    }
    if(!accids.isEmpty()){
        Date day30 = date.today()-30; //date which is 30 days less than today
        List<Opportunity> updatedopplist = new List<Opportunity>();
        List<Opportunity> opplist = [Select Id,Test_CreatedDate__c,StageName,AccountId From Opportunity Where AccountId IN : accids];
        
        if(!opplist.isEmpty()){
            for(Opportunity opp : opplist){
                if(opp.Test_CreatedDate__c < day30 && opp.stageName != 'Closed Won'){
                    opp.stageName = 'Closed Lost';
                    opp.closedate = date.today();
                    updatedopplist.add(opp);
                }
            }
            if(!updatedopplist.isEmpty()){
                update updatedopplist;
            }
        }
    }
    
}