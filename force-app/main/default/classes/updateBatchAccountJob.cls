global class updateBatchAccountJob implements Database.Batchable<sObject>,Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name,Industry,Rating,AnnualRevenue,Active__c FROM Account');
    }
    
    global void execute(Database.BatchableContext bc, List<sObject> recordsToProcess) {
        // process each batch of records
        // Can give callout request
        if(!recordsToProcess.isEmpty()){
            List<Account> accList = new List<Account>();
            for(sObject sObj : recordsToProcess){
                Account accRecord = (Account)sObj;
                accRecord.Rating = 'Hot';
                accRecord.AnnualRevenue = 75000;
                accRecord.Active__c = 'Yes';
                accList.add(accRecord);
            }
            if(!accList.isEmpty()){
                Database.update(accList, false);
            }
            
        }
    }
    
    global void finish(Database.BatchableContext bc) {
        // execute any post-processing operations - send emails, notify clients,Check status of Apex Job.
        // give a call to another batch class
        // Can give to another batch class
        // Can give callout request
        // To Check Informations About Job Whether Jobs Processed Successfully.....
        system.debug('batch job id = '+bc.getJobId());
        AsyncApexJob jobdetails = [SELECT Id, JobType, JobItemsProcessed, TotalJobItems, NumberOfErrors FROM AsyncApexJob Where Id =: bc.getJobId()];
        System.debug('Details---->'+jobdetails);
        
    }
    
}