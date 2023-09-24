public class OppTriggerHelper 
{
    static List<Opportunity> inquarter = new List<Opportunity>();
    static List<Opportunity> outquarter = new List<Opportunity>();
    
    public static void validateDueDate(List<Opportunity> oppList, Map<Id,Opportunity> oldMap)
    {
        List<Integer> months = new List<Integer>();
        Map<String,List<Integer>> QuarterMap = new Map<String,List<Integer>>();
        QuarterMap.put('Q1',new List<Integer>{2,3,4});
        QuarterMap.put('Q2',new List<Integer>{5,6,7});
        QuarterMap.put('Q3',new List<Integer>{8,9,10});
        QuarterMap.put('Q4',new List<Integer>{11,12,1});
        
        Integer currentmonth = Date.today().Month();
        String qnumber = null;
        
        for(String qvalue : QuarterMap.keyset())
        {
            List<Integer> monthlist = QuarterMap.get(qvalue);
            if(monthlist.contains(currentmonth) && qnumber == null)
            {
                qnumber = qvalue;
            }
        }
        for(Opportunity opp : oppList)
        {
            List<Integer> allmonthinquarter = QuarterMap.get(qnumber);
            
            if(oldMap.get(opp.id).DueDate__c != null && opp.DueDate__c != oldMap.get(opp.id).DueDate__c )
            {
                integer prevmonth =  oldMap.get(opp.id).DueDate__c.Month();
                //Scenario 1 = If duedate is updated from other quarter to current quarter -send notifiaction "Due Date Is With In The Quarter"                
                if(allmonthinquarter.contains(opp.DueDate__c.Month()) && !allmonthinquarter.contains(prevmonth))
                {
                    inquarter.add(opp);
                }
                
                //scenario 2 = If duedate is updated with in the quarter - Donot send any emaill
                if(allmonthinquarter.contains(opp.DueDate__c.Month()) && allmonthinquarter.contains(prevmonth))
                {
                    
                }
                
                //scenario 3 =  If duedate is updated from current quarter to other quarter - send notifiaction "Due Date Is out of The current Quarter"
                if(!allmonthinquarter.contains(opp.DueDate__c.Month()) && allmonthinquarter.contains(prevmonth))
                {
                    outquarter.add(opp);
                }
            }
            
            //scenario 4 = If previous due date value is null ,updating due date form null	to current	quarter	-send notification "Due date is with in the quarter"
            if( oldMap.get(opp.id).DueDate__c == null)
            {
                if(allmonthinquarter.contains(opp.DueDate__c.Month()) )
                {
                    inquarter.add(opp);
                }
                
                //scenario 5 = If previous due date value is null ,updating due date form null	to other quarter - Do not send any notification.
                if(allmonthinquarter.contains(opp.DueDate__c.Month()) )
                {
                    
                }
            }
        }
        if(inquarter.size()>0)
        {
            sendNotification1(inquarter,qnumber);
        }
        if(outquarter.size()>0)
        {
            sendNotification2(outquarter,qnumber);
        }
    }
    
    public static void sendNotification1(List<Opportunity> opps , String QuarterNumber)
    {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for(Opportunity opp: opps)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            String[] sendingTo = new String[]{'sandysurfe15@gmail.com'};
                email.setToAddresses(sendingTo);
            email.setSubject('Due Date Is in Quarter');
            email.setPlainTextBody('Hello !!!!!! Opportunity due date is in quarter '+QuarterNumber);
            emails.add(email);
            
        }
        if(emails.size()>0)
            Messaging.sendEmail(emails);
        
    }
    public static void sendNotification2(List<Opportunity> opps , String QuarterNumber)
    {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for(Opportunity opp: opps)
        {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            String[] sendingTo = new String[]{'sandysurfe15@gmail.com'};
                email.setToAddresses(sendingTo);
            email.setSubject('Due Date Is in Quarter');
            email.setPlainTextBody('Hello !!!!!! Opportunity due date is out of this quarter '+QuarterNumber);
            emails.add(email);
            
        }
        if(emails.size()>0)
            Messaging.sendEmail(emails);
        
    }
}