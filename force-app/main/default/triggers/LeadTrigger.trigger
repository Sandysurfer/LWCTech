trigger LeadTrigger on Lead(before insert)
{
    //before insert
    
    LeadTriggerHandler.upadtePhoneOnLead(Trigger.new);
    
    
}