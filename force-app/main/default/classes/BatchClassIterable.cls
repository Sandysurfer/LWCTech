global class BatchClassIterable implements Database.Batchable<Account> {
    
    global Iterable<Account> start(Database.BatchableContext bc){
        return new CustomIterable();
    }
    
    global void Execute(Database.BatchableContext bc, List<Account> accounts){
        List<Account> accListToUpdate = new List<Account>();
        if(!accListToUpdate.isEmpty()){
            for(Account acc : accounts){
               // System.debug('Account Id '+acc.Id);
                acc.Name = 'Iterable Batch';
                acc.NumberOfEmployees = 69;
                accListToUpdate.add(acc);
            }
            update accListToUpdate;
        }
    }
    
    global void Finish(Database.BatchableContext bc){
        
    }
}