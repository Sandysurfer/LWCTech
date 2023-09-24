global class UpdateAccountBatchJob implements Database.Batchable<sObject> {
    
    //If We are Passsing Query Outside the class we can achieve it By Using Constructor.....
    string query;
    global updateAccountBatchJob(string q){
        query = q;
    }
    //Start Method.....
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        //1 million-- 2000 records to execute.....
       // String query = 'Select Id,Name from Account';  Passing Query at class level and using Constructor...
        return Database.getQueryLocator(query);  //to avoid exception
    }
    
    //Execute Method......
    global void execute(Database.BatchableContext bc, List<Account>subListFromStartMethod)
    {
        //logic to process all 2000 records
        for(Account acc : subListFromStartMethod)
        {
            acc.name = 'Batch updated-'+acc.Name;
        }
        update subListFromStartMethod; 
    }
    
    //Finsish Method For Process Operations after process the action and sending emails....
    global void finish(Database.BatchableContext bc)
    {
        //post process logic
        System.debug('@Batch Job Complete');
    }
    
}