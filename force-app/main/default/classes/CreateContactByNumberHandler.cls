public class CreateContactByNumberHandler {
    
    //Scenario 1: For Insertion of Contact, When Account Contact Number for(eg:- 1 or 2) is inserted contacts get created. 
    public static void createContact(List<Account> acclist)
    {
        List<Contact> conlist = new List<Contact>();
        for(Account acc : acclist){
            if(acc.Contact_Number__c != null){
                for(Integer i=0; i<acc.Contact_Number__c ;i++)
                {
                    Contact con = new Contact();
                    con.lastName = acc.name +' '+i;
                    con.AccountId = acc.id;
                    conlist.add(con);
                }
            }
            
        }
        if(!conlist.isEmpty()){
            insert conlist;
        }
    }
    
    //Scenario 2: For Updation of Contact When Account Contact Number is Updated then Contact Should be Created w.r.t to new Contact Number other wise do nothing. 
    public static void updateCreateContact(List<Account> accNewlist, Map<Id,Account> accOldMap){
        List<Contact> newConlist = new List<Contact>();
        Map<Id,Decimal> accNewMap = new Map<Id,Decimal>();
        Set<Id> accIdSet = new Set<Id>();
        
        for(Account acc : accNewlist)
        {
            accIdSet.add(acc.id);
            accNewMap.put(acc.id,acc.Contact_Number__c);
            
            if(acc.Contact_Number__c > accOldMap.get(acc.id).Contact_Number__c) //5>4 then create contact
            {
                for(Decimal j=accOldMap.get(acc.id).Contact_Number__c; j<acc.Contact_Number__c; j++)
                {
                    Contact con = new Contact();
                    con.lastName = acc.name +' '+j;
                    con.AccountId = acc.id;
                    newConlist.add(con);
                }
            }
        }
        
        List<Contact> conList = [Select Id,AccountId From Contact Where AccountId IN : accIdSet];
        List<Contact> conDelList = new List<Contact>();
        Map<Id,Decimal> conCount = new Map<Id,Decimal>();
        for(Contact con : conlist)
        {
            if(accNewMap.get(con.AccountId) < accOldMap.get(con.AccountId).Contact_Number__c)
            {
                Decimal getConCount;
                if(conCount.isEmpty())
                {
                    getConCount = 1; 
                }
                else
                {
                    getConCount = conCount.get(con.AccountId);
                }
                if(getConCount <= accNewMap.get(con.AccountId)) 
                {
                    if(conCount.containsKey(con.AccountId))
                    {
                        conCount.put(con.AccountId, conCount.get(con.AccountId)+1);
                    }
                    else
                    {
                        conCount.put(con.AccountId,2);
                    }
                }
                else
                {
                    conDelList.add(con);
                }
            }
        }
        if(!newConlist.isEmpty()){
            insert newConlist;   
        }
        if(!conDelList.isEmpty()){
            delete conDelList;
        }
        
    }
    
    //Scenario 3: When Account is deleted then its related contact should be deleted.
    public static void deleteAccCon(List<Account> oldAccList)
    {
        Set<Id> accIds = new Set<Id>();
        for(Account acc : oldAccList)
        {
            accIds.add(acc.id);
        }
        List<Contact> conList = [Select Id,AccountId From Contact Where AccountId IN : accIds];
        if(!conList.isEmpty()){
            delete conList;
        }
    }
}