//Send Email On Creation Of Lead When new Lead is Created to the Following Customer 

trigger SendEmail on Lead (before insert) {
    
    List<Messaging.Email> emailList = new List<Messaging.Email>();
    for(Lead le : trigger.new)
    {
        if(le.Status == 'Working' && le.Email != null)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(New String [] {le.Email});
            email.setSubject('Regrading: Lead Status Working Contacted');
            String Body = '<h1>Dear Customer<h1><p> Your Lead With LeadId :' +le.OwnerId;
            body = body+'is set to Working Contacted </p>Thanks </br> SalesTeam</p>';
            email.setHtmlBody(Body);
            emailList.add(email);
            
        } 
    }
    
}