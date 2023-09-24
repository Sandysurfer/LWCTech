trigger AccountTrigger on Account (before insert, before update,before delete, After insert,After Update,After delete,After undelete) {
    //Scenario:-9
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        AccountTriggerHandler.sendEmailAfterAccountUpdate(Trigger.new,Trigger.oldMap);
    }
    //Scenario:-8
    if(Trigger.isAfter && Trigger.isundelete)
    {
        AccountTriggerHandler.SendEmailOnUndelete(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isdelete)
    {
        //Scenario:-7
        List<Messaging.SingleEmailMessage> emaillist = new List<Messaging.SingleEmailMessage>();
        for(Account accOld : Trigger.old)
        {
            
            Messaging.SingleEmailMessage emailobj = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(userinfo.getUserEmail());
            emailobj.settoaddresses(emailAddress);
            emailobj.setSubject('Account has been successfully deleted '+accOld.Name);
            emailobj.setplaintextbody('Hello no body written here please refer subject');
            emaillist.add(emailobj);
        }
        Messaging.sendEmail(emaillist);
    }
    
    if(Trigger.isbefore &&  Trigger.isdelete)
    {
        //Scenario:-6
        for(Account accOld : Trigger.old)
        {
            if(accOld.Active__c  == 'yes')
            {
                accOld.addError('You cannot delete an active account');
            }
        }
    }
    
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        //Scenario:-5
        Set<Id>accIdsWithBillingAddressChanged = new Set<Id>();
        for(Account accRecNew : Trigger.new)
        {
            Account accRecOld = Trigger.oldMap.get(accRecNew.id);
            if(accRecNew.BillingStreet != accRecOld.BillingStreet)
            {
                accIdsWithBillingAddressChanged.add(accRecNew.id);
            }
        }
        List<Account> accwithContacts = [Select Id,Name,billingcity,billingstate,billingstreet,billingcountry,(Select Id,Name From Contacts) From Account Where Id IN:accIdsWithBillingAddressChanged];
        List<Contact> conListToUpdate = new List<Contact>();
        
        for(Account acc : accwithContacts)
        {
            List<Contact> consofLoopedAccounts = acc.Contacts;
            for(Contact con : consofLoopedAccounts)
            {
                con.MailingCity = acc.BillingCity;
                con.MailingCountry = acc.BillingCountry;
                con.MailingState = acc.BillingState;
                con.MailingStreet = acc.BillingStreet;
                conListToUpdate.add(con);
            }
        }
        if(conListToUpdate.size()>0)
        {
            update conListToUpdate;
        }
    }
    
    if(Trigger.isbefore && Trigger.isUpdate)
    {
        for(Account accNewRec : Trigger.new)
        {
            //Scenario:-4
            Account accOldRec = Trigger.oldMap.get(accNewRec.Id);
            if(accNewRec.Name != accOldRec.Name)
            {
                accNewRec.addError('Account Name cannot be  Modified ');
            }
        }
        
    }
    
    if(Trigger.isAfter && Trigger.isInsert)
    {
        //Scenario:- 3
        list<contact> contactlist = new list<contact>();
        for(account acc:trigger.new)
        {
            contact con = new contact();
            con.LastName = acc.Name ;
            con.AccountId = acc.Id;
            contactlist.add(con);
            
        }
        if(Contactlist.size()>0)
        {
            insert contactlist;
        }
    }
    
    if(Trigger.isbefore && Trigger.isinsert)
    {
        for(Account accRec : Trigger.new)
        {
            //scenario 2
            if(accRec.AnnualRevenue < 1000)
            {
                accRec.addError('Annual Revenue Should Not be less than 1000');
            }
            
            //scenario 1
            if(accRec.ShippingCity == null)
            {
                accRec.ShippingCity = accRec.BillingCity;  
            }
            if(accRec.ShippingCountry == null)
            {
                accRec.ShippingCountry = accRec.BillingCountry;
            }
            if(accRec.ShippingState == null)
            {
                accRec.ShippingState = accRec.BillingState;
            }
            if(accRec.ShippingPostalCode == null)
            {
                accRec.ShippingPostalCode = accRec.BillingPostalCode;
            }
        }
    }
}