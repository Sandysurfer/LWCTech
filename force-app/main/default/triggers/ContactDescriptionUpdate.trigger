trigger ContactDescriptionUpdate on Contact (After update) {
    
    Set<Id> accIds = new Set<Id>();
    
    if(trigger.isAfter && trigger.isUpdate)
    {
        for(Contact con : trigger.new)
        {
            if(con.AccountId != null && trigger.oldMap.get(con.Id).Description != con.Description)
            {
                accIds.add(con.AccountId);
            }
        }
    }
    if(!accIds.isEmpty())
    {
        Map<Id,Account> accMap = new Map<Id,Account>([Select Id,Description From Account Where Id IN : accIds]);
        List<Account> acclistToUpdate = new List<Account>();
        
        if(!accMap.isEmpty())
        {
            for(Contact cont : trigger.new)
            {     
                Account acc = accMap.get(cont.AccountId);
                acc.Description = cont.Description;
                acclistToUpdate.add(acc);
            }
            if(!acclistToUpdate.isEmpty())
            {
                update acclistToUpdate;
            }
        }
    }
    
}