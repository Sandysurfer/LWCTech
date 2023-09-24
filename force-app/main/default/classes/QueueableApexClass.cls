public class QueueableApexClass implements Queueable {
    
    public void execute(QueueableContext context)
    {
        List<Account> acclist = new List<Account>();
        for(Account accobj : [Select Id,Type From Account Where Type = 'Customer - Direct'])
        {
            accobj.Type =  'Prospect';
            acclist.add(accobj);
        }
        if(!acclist.isEmpty()) 
        {
            update acclist;
        }
        //Execute another queueable class
       
        //Execute in Anonymous window.....
        //QueueableClass1 obj = new QueueableClass1();
        //Id jobId = System.enqueueJob(obj);
        
         //Track the result.....
        //AsyncApexJob jobdetails = [Select Id,Status,JobItemsProcessed From AsyncApexJob Where Id =: jobId];
       //System.debug('Job Id '+jobdetails.Id);
      //System.debug('Job Status '+jobdetails.Status);
        
    }
    
}