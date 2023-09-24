trigger OpportunityTriggerDueDateValidation on Opportunity (after update) {
    
    if(Trigger.isupdate && Trigger.isAfter)
    {
        OppTriggerHelper.validateDueDate(Trigger.new,Trigger.oldMap);
    }

}