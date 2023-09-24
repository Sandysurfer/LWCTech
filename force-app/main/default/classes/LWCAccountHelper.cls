public class LWCAccountHelper {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList()
    {
        List<Account> varAccList = new List<Account>();
        
        varAccList = [Select Id, Name, Phone, Website, Industry From Account];
        
        return varAccList;
    }
    
}