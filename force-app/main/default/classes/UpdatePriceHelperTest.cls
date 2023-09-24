@istest
private class UpdatePriceHelperTest {
    
    @istest
    static void DiscountPriceTest()
    {
        //Step 1 : Initialize the class and create a samplebook in library object
        Library__c  B = new Library__c(); 
        B.Name = 'My Test Book';
        B.Price__c = 1000;
        insert B;
        
        //Step 2 : SOQL
        List<Library__c> Booklist = [Select Id,Price__c From Library__c Where Id=:B.Id];
        
        //Step 3 : Compare the price expected in data base
        System.assertEquals(900, Booklist[0].price__c);
    }
    
    
    
    
    
}