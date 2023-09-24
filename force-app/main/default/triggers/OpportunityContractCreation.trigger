//When Opportunity stage is "closed won" then create a child contract for opportunity........

trigger OpportunityContractCreation on Opportunity (After insert, After Update) {
    
    List<Contract> contlist = new List<Contract>();
    List<Contract> contractList1 = new List<contract>();
    List<Contract> contractList2 = new List<Contract>();
    Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>();
    
    if(trigger.isExecuting && trigger.isAfter && (trigger.isinsert)){
        for(Opportunity opp : trigger.new){
            if(opp.StageName == 'Closed Won'){
                Contract ct = new Contract();
                ct.AccountId = opp.AccountId;
                ct.Name = opp.Name;
                ct.Status = 'Draft';
                ct.StartDate = system.today()+2;
                ct.ContractTerm = 12;
                ct.OpportunityContract__c = opp.id;
                contlist.add(ct);
            }
            else if(trigger.isupdate && opp.StageName == 'Closed Lost'){
                oppMap.put(opp.Id, opp);
                if(oppMap.size()>0){
                    contractList1 = [Select Id,StartDate,OpportunityContract__r.Id From Contract Where OpportunityContract__r.Id =:oppMap.keySet()];
                }
                if(contractList1.size()>0){
                    for(Contract cont : contractList1){
                        cont.StartDate = System.today();
                        cont.Description = oppMap.get(cont.OpportunityContract__r.id).Name;
                        contractList2.add(cont);
                    }
                }
                insert contList;
                update contractList2;
                
            }
        }
        
    }
    
}