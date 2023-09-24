@isTest
public class CreateRelatedContactTestClass{
    @isTest
    Public Static void CreateRelatedContactTest1()
    {
        Account accobj = new Account();
        accobj.Name = 'RuchiSoya Ltd';
        insert accobj;
        
        Contact newConobj = [Select Id,AccountId,LastName From Contact Where AccountID =: accobj.id];
        
        System.assertEquals(accobj.Name, newConobj.LastName);
    }

}