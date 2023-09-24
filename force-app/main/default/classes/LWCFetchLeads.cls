public class LWCFetchLeads {
    
    @AuraEnabled(cacheable=true)
    public static List<Lead> getAllLeads(){
        List<Lead> allLeads = new List<Lead>();
        allLeads = [Select Id,Name,Status From Lead];
        return allLeads;
    }
    
}