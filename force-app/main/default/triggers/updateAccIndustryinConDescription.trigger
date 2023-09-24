//When Account industry is updated update the industry name  in contact description.............

trigger updateAccIndustryinConDescription on Account (After update) {
    
    Map<Id,Account> accMap = new Map <Id,Account>();
    List<Contact> conlist = new List<Contact>();
    List<Contact> conlistUpdate = new List<Contact>();
    
    if(trigger.isExecuting && trigger.isAfter && (trigger.isinsert || trigger.isupdate)){
        for(Account acc : trigger.new){
            if(acc.industry != trigger.oldMap.get(acc.id).industry){
                accMap.put(acc.id, acc);
            }
            if(accMap.size()>0){
               conlist  = [Select Id,Description,AccountId From Contact Where AccountId =: accMap.keySet()];
            }
            if(conlist.size()>0){
                for(Contact con : conlist){
                    con.Description = accMap.get(con.AccountId).industry;
                    conlistUpdate.add(con);
                }
            }
        }
    }
    update conlistUpdate;    
}