trigger ClosedWonOpportunityDeletion on Opportunity (before delete, After update) {
    
    if(Trigger.isBefore && Trigger.isDelete)
    {
        // Get the admin profile and list of system administrator from collection.
        //Profile SystemAdminProfile = [Select Id From Profile Where Name = 'System Administrator']; (for single system admin)
       
        List<Profile> SystemAdmins = new List <Profile> ([Select Id, Name From Profile Where Name = 'System Administrator']);
        
        for(Opportunity oppObj: Trigger.old)
        {
            Boolean isCurrentUserSystemAdmin = false;
            //for checking Whether there are Multiple System Admins....
            for(Profile SystemAdminProfile: SystemAdmins)
            {
                if(SystemAdminProfile.Id == System.UserInfo.getUserId())
                { 
                    isCurrentUserSystemAdmin = true;
                }
            }
            if(!isCurrentUserSystemAdmin && (oppObj.StageName == 'Closed Won' || oppObj.StageName == 'Closed Lost'))
            {
                oppObj.addError('Only System Admin Can Delete This Closed Opportunity');
                
            }
        }
        
    }
    if(Trigger.isAfter && Trigger.isupdate)
    {
        List<Messaging.SingleEmailMessage> allOpportunityEmails = new List<Messaging.SingleEmailMessage>();  //For Email Messaging use this Method.
        List<Opportunity> allOpportunities = [Select Id,Owner.Id, Name, StageName, Owner.Email, Account.Owner.Email From Opportunity Where Id IN :Trigger.newMap.keySet() AND StageName = 'Closed Won'];
        
        for(Opportunity oppObj:allOpportunities)
        {
            Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
            List<String> setToAddressEmails = new List<String>();
            setToAddressEmails.add(oppObj.Owner.Email);
            setToAddressEmails.add(oppObj.Account.Owner.Email);
            emailObj.setToAddresses(setToAddressEmails);
            
            //emailObj.setToAddresses(new List<String> {oppObj.Owner.Email,oppObj.Account.Owner.Email}); Above Logic in This Line.
           
            emailObj.setSubject(oppObj.Name + 'Opportunity-Closed Won');
            emailObj.setPlainTextBody('Below Opportunity with Opportunity Id and Name is now Closed Won.\n' + 
                                      'Opportunity Id: ' + oppObj.Id + '\n' +
                                      'Name: ' + oppObj.Name);
            allOpportunityEmails.add(emailObj);
            
        }
        Messaging.sendEmail(allOpportunityEmails);
    }
}