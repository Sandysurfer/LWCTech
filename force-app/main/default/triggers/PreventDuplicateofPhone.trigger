//While inserting contact, search contact's phone number only in it's parent account's contacts and if there is any duplicate contact, throw error.
//Phone number can be duplicate in some other account's contacts.
//Make trigger bulkify


trigger PreventDuplicateofPhone on Contact (before insert){
    
    Set<String> accPhoneSet = new Set<String>();
    for(Contact con : trigger.new)
    {
        accPhoneSet.add(con.Phone);
    }
    
    List<Account> acclist = [Select Id,Phone From Account Where Phone IN : accPhoneSet];
    
    Set<String> duplicateAccPhone = new Set<String>();
    
    for(Account acc : acclist)
    {
        duplicateAccPhone.add(acc.Phone);
    }
    
    for(Contact con : trigger.new)
    {
        if(duplicateAccPhone.contains(con.Phone))
        {
            con.addError('Contacts Phone Already exists in account');
        } 
    }
}