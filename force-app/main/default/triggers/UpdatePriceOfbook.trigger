trigger UpdatePriceOfbook on Library__c (before insert) {
    
    if(Trigger.isBefore && Trigger.isinsert)
    {
        UpdatePriceHelper.ApplyDiscount(Trigger.new);
    }
}