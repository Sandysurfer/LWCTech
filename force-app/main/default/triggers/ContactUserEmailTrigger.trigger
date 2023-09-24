trigger ContactUserEmailTrigger on Contact (before insert) {
    
    //When Iam Creating Contact, If The Contact Email Is Exist as a user email then i need to update the phone and address.....
    
    //step 1:Get the current contacts in Trigger.new.....
    List<Contact> conlist = Trigger.new;
    set<String> conEmails = new Set<String>();
    for(contact con : conlist)
    {
        if(con.Email != null)
        {
            conEmails.add(con.Email);
        }
    }
    //Step 2: Get the user record based on email
    Map<String,User> existinguserMap = new Map<String,User>();
    for(User usr: [Select Id,UserName,Email From User Where Email =: conEmails])
    {
        existinguserMap.put(usr.Email, usr);
    }
    //Step 3: Compare the emails
    for(Contact con :conlist)
    {
        if(existinguserMap.containsKey(con.Email))
        {
            con.Phone = existinguserMap.get(con.Email).phone;
        }
    }
    
}