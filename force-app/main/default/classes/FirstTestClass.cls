@istest
public class FirstTestClass {
    
    @testsetup
    private static void CreateTestData(){
        String a;
        Account acc = new Account();
        acc.Name = 'testAccount';
        acc.Description = 'test';
        acc.Description = 'Banking';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'TestLastName';
        con.Description = 'TestDescription';
        
    }
    @istest
    private static void TestMethod1(){
        
        Account accList = [Select Id,Industry From Account Limit 1];
        accList.Industry = 'Energy';
        update accList;
        
        Contact conlist = [Select Id,LastName,AccountId,Description From Contact Where AccountId =: accList.id Limit 1];
        
    }
}