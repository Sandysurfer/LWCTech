public class RecursionTrigger {
    
    public static Boolean isRecursion = true;
    
    public static void onInsertCall(List<Contact> newConlist)
    {
        List<Contact> conlist = new List<Contact>();
        for(Contact con : newConlist)
        {
            Contact conobj = new Contact();
            conobj.FirstName = 'TEST';
            conobj.LastName = 'SECOND';
            conlist.add(conobj);
            
        }
        if(!conlist.isEmpty())
        {
            insert conlist;
        }
    }
}