@isTest
public class UpdateContactOwnerOnAccountTestClass {
    
    @testSetup
    Public static void TestData()
    {
        User userobj = [Select Id From User Where username = 'frontdeskarc@gmail.com' Limit 1];
        Account testaccobj = new Account (Name = 'Sample Account',OwnerId = userobj.id);
        insert testaccobj;
        Contact testconobj = new Contact (LastName = 'Sample Account',AccountId = testaccobj.id,OwnerId = userobj.id);
        insert testconobj;
    }
    
    @isTest
    Public static void UpdateContactOwnerOnAccountPositiveTest()
    {
        Account sampleaccobj = [Select Name,Id,OwnerId From Account Where Name ='Sample Account' LIMIT 1 ];
        Contact sampleconobj = [Select Id,OwnerId,LastName,AccountId From Contact Where LastName = 'Sample Account' LIMIT 1];
        
        Test.startTest();
        Sampleaccobj.OwnerId = System.UserInfo.getUserId();
        Update sampleaccobj;
        Test.stopTest();
        
        
        Contact updateconobj = [Select Id,OwnerId,LastName,AccountId From Contact Where LastName = 'Sample Accoun' LIMIT 1];
        System.assertEquals(System.UserInfo.getUserId(), updateconobj.OwnerId , 'Owner Id Should Be Same');
    }
    
    @isTest
    Public static void UpdateContactOwnerOnAccountNegativeTest()
    {
        Account sampleaccobj = [Select Name,Id,OwnerId From Account Where Name ='Sample Account' LIMIT 1 ];
        Contact sampleconobj = [Select Id,OwnerId,LastName,AccountId From Contact Where LastName = 'Sample Account' LIMIT 1];
        
        Test.startTest();
        Sampleaccobj.Industry = 'Agriculture';
        Update Sampleaccobj;
        Test.stopTest();
        
        User userobj = [Select Id From User Where username = 'frontdeskarc@gmail.com' Limit 1];
        Contact updateconobj = [Select Id,OwnerId,LastName,AccountId From Contact Where LastName = 'Sample Account' LIMIT 1];
        System.assertNotEquals(sampleaccobj.OwnerId, updateconobj.OwnerId, 'Owner Id Should not be same');
        //System.assertEquals(userobj.id,updateconobj.OwnerId);
    }
}