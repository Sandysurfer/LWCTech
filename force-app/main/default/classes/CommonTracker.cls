@istest
public class CommonTracker {
    
    public static  contact createcontact()
    {
        Contact c = new Contact();
        c.LastName = 'Test100';
        c.Email = 'test@gmail.com';
        c.Phone = '22222';
        insert c;
        return c;
    }
    
}