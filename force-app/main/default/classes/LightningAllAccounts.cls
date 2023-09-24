public class LightningAllAccounts {
    @AuraEnabled
    public static List<Account> getAccountList(){
        List<Account> accList = [Select Id,Name From Account];
        return accList;
    }
    
    @AuraEnabled
    public static String createAccount(string Name, string Phone, string Rating){
        Account acc = new Account();
        acc.Name = 'Aura Demo';
        acc.Phone = '8486648';
        acc.Rating = 'Hot';
        insert acc;
        return acc.Name;
    }
    
}