trigger OpportunityLineItemTrigger on OpportunityLineItem (before insert,after insert,after delete) {
    
    if(trigger.isAfter && trigger.isBefore){
        if(trigger.isInsert){
            OpportunityLineItemHandler.updateCountofProducts(trigger.new);
            OpportunityLineItemHandler.updateAssetonAccount(trigger.new);
            OpportunityLineItemHandler.preventduplicationofRecords(trigger.new);
            
        }
        if(trigger.isDelete){
            OpportunityLineItemHandler.updateCountofProducts(trigger.old);
        }
    }
    
}