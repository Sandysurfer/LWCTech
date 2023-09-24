public class auraCreateContact {
    
    @AuraEnabled(cacheable = true)
    public static void createContact(String firstname, String lastname, String email, String phone){
        contact con = new contact();
        con.firstname = firstname;
        con.lastname = lastname;
        con.email = email;
        con.phone = phone;
        Insert con;
    }
}