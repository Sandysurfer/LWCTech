trigger ContactValidation on Contact (before insert) {
    
    Set<String> EmailSet = new Set<String>();
    for(Contact con: Trigger.new)
    {
        EmailSet.add(con.Email);
    }
    
    Integer ConNumber = [Select Count() From Contact Where Email IN : EmailSet];
    
    if(ConNumber>0)
    {
        for(Contact con : Trigger.new) 
        {
            con.addError('This Email Already Exist');
            
        }
    }
    
    
    
    
    
    
}