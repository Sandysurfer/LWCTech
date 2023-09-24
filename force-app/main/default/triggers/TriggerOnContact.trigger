trigger TriggerOnContact on Contact (before insert) {
    
    if(Trigger.isinsert && Trigger.isBefore)
    {
        ClassToUpdateContactOtherPhone.UpdateContactOtherPhone(Trigger.new);
    }

}