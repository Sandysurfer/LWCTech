public class ContactMasterHandler {
    
    public static void CreateContactRelationshipByContact(List<Contact> conlist)
    {
        List<Contact_Relationship__c> crlist = new List<Contact_Relationship__c>();
        for(Contact con : conlist)
        {
            if(con.Contact_Relation__c == true)
            {
                Contact_Relationship__c crobj = new Contact_Relationship__c ();
                crobj.Name = con.Name;
                crobj.Contact__c = con.Id;
                crlist.add(crobj);
            }
        }
        insert crlist;
    }
}