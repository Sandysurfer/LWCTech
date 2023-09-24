@isTest
public class CreateOpportunityOnAccountTestClass {
    
    @isTest
    Public Static void CreateOpportunityOnAccountPositiveTest()
    {
        Account newacc = new Account(Name = 'Test Account Sample', Industry = 'Agriculture');
        
        Test.startTest();
        insert newacc;
        Test.stopTest();
        
        List<Opportunity> insertedOpp = [Select Id,Account.Name,CloseDate,Amount From Opportunity Where AccountId =: newacc.id];
        System.assertEquals(newacc.Name, insertedOpp[0].Account.Name,  'Inserted Opportunity does not have the expected account.');
        System.assertEquals(System.today() + 90, insertedOpp[0].CloseDate,   'Close Date is not as expected.');
        System.assertEquals(0, insertedOpp[0].Amount,  'Amount in the inserted opportunity should be 0');
    }
    
    @isTest
    Public static void CreateOpportunityOnAccountNegativeTest() {
        Account newacc1 = new Account(Name='Test Account Sample', Industry='Biotechnology');
        
        Test.startTest();
        insert newacc1;
        Test.stopTest();
        
        List<Opportunity> insertedOpp1 = [Select Id, Account.Name, CloseDate, Amount From Opportunity Where AccountId =: newacc1.id]; 
        
        System.assertEquals(0, insertedOpp1.size(), '0 opportunity should be inserted for the Account');
    }
}