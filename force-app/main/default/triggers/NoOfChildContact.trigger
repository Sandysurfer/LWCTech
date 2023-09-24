//  Write a Trigger to Count Total No Of Contacts Associated With Accounts.(Roll Up Summary Examples....)

trigger NoOfChildContact on Contact (After insert,After Update,After delete)
{
    
    if(Trigger.isAfter && Trigger.isinsert || Trigger.isupdate || Trigger.isdelete || Trigger.isundelete)
    {
        NoOfChildContactHandler.CountOfContact(Trigger.new, Trigger.old);
        
    }
    
}