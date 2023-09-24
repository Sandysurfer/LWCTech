public class UpdateContactOtherPhoneHandler {
    
    public static void UpdateContactPhone(List<Contact> conlist)
    {
        set<Id> accIdSet = new set<Id>();
        for(Contact con : conlist)
        {
            if(con.AccountId != null)
            {
                accIdSet.add(con.AccountId);
            }
        }
        if(accIdSet.size()>0)
        {
            Map<Id,Account> accMap = new Map<Id,Account>([Select Id,Phone From Account Where Id IN : accIdSet]);
            for(Contact con : conlist)
            {
                if(con.AccountId != null && accMap.containskey(con.AccountId))
                {
                    if(accMap.get(con.AccountId).Phone != null)
                    {
                        con.OtherPhone = accMap.get(con.AccountId).Phone;
                    }
                }
            }
            
        }
    }
    
}