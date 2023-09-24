public with sharing class LeadTriggerHandler{
    
    public static void upadtePhoneOnLead(List<Lead> listleadrecord)
    {
        for(Lead leadobj : listleadrecord)
        {
            if(leadobj.Phone == null && leadobj.MobilePhone != null)
            {
                leadobj.Phone = leadobj.MobilePhone;
                
            }
        }
        
    }
}