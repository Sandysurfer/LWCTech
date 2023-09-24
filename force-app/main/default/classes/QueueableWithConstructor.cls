//Implementation of Queueable apex with the help of constructor....

public class QueueableWithConstructor implements Queueable {
    
    private List<Account>acclist;
    private Id parentAccId;
    
    //Constructor name should always be same as class name...
    //Constructor are used to assign default value for class member...
    //Constructor does not hae return type not even void...
    
    public QueueableWithConstructor(List<Account>accRecords, Id parentId)
    {
        this.accList = accRecords;
        this.parentAccId = parentId;
    }
    
    public void execute(QueueableContext context)
    {
        for(Account acc : acclist)
        {
            acc.ParentId = parentAccId;
        }
        update acclist;
        
         //Execute another queueable class
       
        //Execute in Anonymous window.....
        //List<Account> accList = [Select Id From Account Where BillingState = 'NY'];
        //Id ParentId = [Select Id From Account Where Name = ]
         //QueueableClass obj = new QueueableClass();
         //Id jobId = System.enqueueJob(obj);
        
          //Track the result.....
         //AsyncApexJob jobdetails = [Select Id,Status,JobItemsProcessed From AsyncApexJob Where Id =: jobId];
        //System.debug('Job Id '+jobdetails.Id);
        //System.debug('Job Status '+jobdetails.Status);
        
    }

}