public class AccountTriggerHandler {
    
     public static void sendEmailAfterAccountUpdate(List<Account> acclist,Map<Id,Account> oldMap){
        Set<Id> accIds = new Set<Id>();
        for(Account acc : acclist){
            if(acc.Type != oldMap.get(acc.id).Type){
                accIds.add(acc.Id);
            }
        }
        List<Contact> conlist = [Select Id,Email,AccountId FROM Contact Where AccountId IN : accIds];
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        if(!conlist.isEmpty()){
            for(Contact con : conlist){
                if(con.Email != null){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setTargetObjectId(con.Id);
                    mail.setSenderDisplayName('System Administrator');
                    mail.setSubject('Account Update Info');
                    
                    String body = 'Dear '+con.LastName+',<br/>';
                    body += 'Your Account Type has been Updated Successfully';
                    mail.setHtmlBody(body);
                    mail.toaddresses = new String[]{con.Email};
                        emailList.add(mail);
                }
            }
            if(!emailList.isEmpty()){
                Messaging.sendEmail(emailList);
            }
        }
    }
    
    public static void SendEmailOnUndelete(List<Account> accListNew) {
        
        //Scenario:-8
        List<Messaging.SingleEmailMessage> emaillist = new List<Messaging.SingleEmailMessage>();
        for(Account accNew : accListNew)
        {
            Messaging.SingleEmailMessage emailobj = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(userinfo.getUserEmail());
            emailobj.settoaddresses(emailAddress);
            emailobj.setSubject('Account has been successfully restored '+accNew.Name);
            emailobj.setplaintextbody('Hello no body written here please refer subject');
            emaillist.add(emailobj);
        }
        
        Messaging.sendEmail(emaillist);
    }
    public static void SendEmailOnAfterDelete(List<Account> accListOld)
    {
        //Scenario:-7
        List<Messaging.SingleEmailMessage> emaillist = new List<Messaging.SingleEmailMessage>();
        for(Account accOld : accListOld)
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

}