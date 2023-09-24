global class SchedulableBatch implements Database.Batchable<sObject>, schedulable {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        string query = 'Select Id,LeadSource From Lead Where LeadSource=Null Limit 5';
        return Database.getQueryLocator(query);
    }
    
    global void Execute(Database.BatchableContext bc, List<sObject> scope){
        List<Lead> leadList = (List<Lead>) scope ;
        List<Lead> leadListToUpdate = new List<Lead>();
        
        if(!leadList.isEmpty()){
            for(Lead le : leadList){
                le.LeadSource = 'DreamForce';
                leadListToUpdate.add(le);
            }
            if(leadListToUpdate.size()>0){
               Database.update(leadListToUpdate,false);
            }
        }
    }
    
    global void Finish (Database.BatchableContext bc){}
    
    //Schedule Batch Class Without Implementing Another schedulable Class....
    global void Execute (schedulableContext sc){
        Database.executeBatch(new SchedulableBatch());
    }
//Execute using Anonymous Window and Check Schedule Jobs in Config...
//string cronExp = '0 0 10 * * ?';
//System.Schedule('update Lead Source', cronExp, new schedulableBatch());
}