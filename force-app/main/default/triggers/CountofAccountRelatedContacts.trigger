trigger CountofAccountRelatedContacts on Contact (after insert,after update,after delete) {
    
    Set<id> idset =new Set<id>();
    List<Account> accountToUpdate = new List<Account>();
    
    if(trigger.isAfter && trigger.isInsert || trigger.isUndelete){
        for(Contact con : trigger.new){
            if(con.AccountId != null){
                idset.add(con.AccountId);
            }
        }
    }
    if(trigger.isAfter && trigger.isupdate){
        for(Contact con : trigger.new){
            if(con.AccountId != trigger.oldMap.get(con.id).AccountId)
            {
                if(trigger.oldMap.get(con.id).AccountId != Null)
                {
                    idset.add(trigger.oldMap.get(con.id).Accountid);
                }
                if(con.AccountId != Null)
                {
                    idset.add(con.AccountId);    
                }
            }
        }
    }
    
    if(trigger.isAfter && trigger.isDelete){
        for(Contact con : trigger.old){
            if(con.AccountId != null){
                idset.add(con.AccountId);
            }
        }
    }
    if(!idset.isEmpty()){
        List<Account> acclist = [Select Id,No_Of_Contact__c,(Select id from Contacts) from Account Where Id IN : idset];
        if(!accList.isEmpty()){
            for(Account acc : acclist){
                acc.No_Of_Contact__c = acc.Contacts.size();
                accountToUpdate.add(acc);
            }
            if(!accountToUpdate.isEmpty()){
                update accountToUpdate;
            }
        }
    }
    
}