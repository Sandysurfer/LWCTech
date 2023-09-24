public class ContactEmailPhoneDefault {
    
    public static void checkphone(List<Contact> Contacts)
    {
        for(Contact con:Contacts)
        {
            con.phone = '99999';
            
        }
    }
    
    public static void checkemail(List<Contact> Contact)
    {
        for(Contact con:Contact)
        {
            con.Email = 'noname@email.com';
        }
    }
}