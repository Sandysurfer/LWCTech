@istest(SeeAllData=true)
public class AccountTest {
    
    Static testmethod void getAccountTest()
    {
        test.startTest();
        //Querying an existing account from the salesforce database
        Account a = [Select Id,Name From Account where Name = 'RuchiSoya Ltd' Limit 1];
        System.debug('a--> '+a.id);
        System.assert(a!=null);
        
        //Creating a new test Account based on the queried account 
        Account newAccount = a.clone();
        newAccount.Name = 'Accenture';
        insert newAccount;
        
        Account testAccount2 = [Select Id,Name FROM Account Where Name ='Accenture' Limit 1];
        System.assert(testAccount2!=null);
        test.stopTest();
    }

}