public class AccountHandler {
    @AuraEnabled
    public static boolean CreateAccount (String Name , String Phone, String AccountNumber, Decimal AnnualRevenue){
        Account acc = new Account();
        acc.Name = name;
        acc.Phone = phone;
        acc.AccountNumber = accountnumber;
        acc.AnnualRevenue = annualRevenue;
        try{
            insert acc;
            return true;
        } catch(Exception e){
            return false;
        }
    }
}