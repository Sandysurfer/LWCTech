global class BatchAccountDescriptionUpdate implements Database.Batchable<sobject>, Database.Stateful{
    
    integer recordsCount = 0;
    
    //Step 1:- Start Method.......
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
         String query = 'Select Description from Account';
         return Database.getQueryLocator(query);
        
        //(or) 
        //return Database.getQueryLocator('Select Description From Account');
    }
    
    //Step 2:- Execute Method.....
    global void execute(Database.BatchableContext bc, List<Account> acclist )
    {  
        //Records will be  Processed in Batches.
        for(Account acc : acclist)
        {
            if(String.isBlank(acc.Description))
            {
                acc.Description = 'Please fill Account Details else Transactions will be made inactive';
            }
            recordsCount++;
        }
        System.debug('No of Records Processed '+recordsCount);
        update acclist;
    }
    
    //Step 3:- Finish Method For Sending email notificactions when an process is executed.......
    global void finish(Database.BatchableContext bc)
    {
        //code of sending mails
        //calling another batch class
        List<Messaging.SingleEmailMessage> sendemaillist = new List<Messaging.SingleEmailMessage>();  
        Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
        List<String> setToAddressEmails = new List<String>();
        setToAddressEmails.add('sandysurfe15@gmail.com');
        emailObj.setToAddresses(setToAddressEmails);
        emailObj.setSubject('Account Description Batch Update');
        emailObj.setPlainTextBody('All Accounts has been updated succcesfully');
        sendemaillist.add(emailobj);
        Messaging.sendEmail(sendemaillist);
    }
    
}