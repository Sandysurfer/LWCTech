trigger CreateContactRelationCreation on Contact (After insert) {
    
    if(Trigger.isAfter && Trigger.isInsert)
    {
        ContactMasterHandler.CreateContactRelationshipByContact(Trigger.new);
    }

}