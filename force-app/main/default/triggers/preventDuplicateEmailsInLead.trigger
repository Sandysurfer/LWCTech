//When lead is created or updated then check if the email of lead is already there in existing contacts. If email already exist then throw error.........

trigger preventDuplicateEmailsInLead on Lead (before insert) {
    
    Set<String> setOfEmailIds = new Set<String>();
    for(Lead leadobj : Trigger.new)
    {
        setOfEmailIds.add(leadobj.email);
    }
    
    Set<String> DupEmail = new Set<String>();
    List<Contact> conlist = [Select Id,Email FROM Contact Where Email IN :setOfEmailIds];
    
    for(Contact con:conlist)
    { 
        DupEmail.add(con.Email); 
    }
    
    //for showing Validation error use context variable bcoz error shows on context variable.
    for(Lead leadObj : Trigger.new)
    {
        if(DupEmail.contains(leadObj.Email))
        {
            leadObj.addError('Lead Email Already Exists on Contacts');
        }
        
    }
    
}