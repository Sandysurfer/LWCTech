@istest
private class ContactEmailPhoneDefaultTest {
    
    @testsetup
    Static void setup()
    {
         Contact c = new Contact();
        c.LastName = 'Test 100';
        c.Email = 'test@gmail.com';
        c.Phone = '22222';
        insert c; 
    }
    
    //Step 1 : When Phone is Null.
    @istest
    static void Scenario1()
    {
        test.startTest();
        
        List<Contact> contacts = [Select Phone From Contact Where LastName = 'Test 100'];
        contacts[0].Phone = '33333';
        update contacts[0];
        System.assertEquals('33333', contacts[0].Phone);
        test.stopTest();
    }
    
    @istest
    static void scenario12()
    {
        test.startTest();
        
        List<Contact> contacts = [Select Phone From Contact Where LastName = 'Test 100'];
        System.debug('Update Phone ---->'+ contacts[0].Phone);
        //System.assertEquals('33333', contacts[0].Phone);
        test.stopTest();
        
    }
   /* //Step 2 : When Phone is Not Null.
    @istest 
    static void Scenario2()
    {
        test.startTest();
        Contact c = new Contact();
        c.LastName = 'Test 100';
        c.Email = 'test@gmail.com';
        c.Phone = '22222';
        insert c; 
        
        List<Contact> contacts = [Select Phone From Contact Where Id=:c.Id];
        System.assertEquals('22222', contacts[0].Phone);
        test.stopTest();
    }
        
        //Step 3 : When Email is Null.
        @istest
     static void Scenario3()
      {
        test.startTest();
        Contact c = new Contact();
        c.LastName = 'Test 100';
        c.Phone = '22222';
        insert c; 
        
        List<Contact> contacts = [Select Phone From Contact Where Id=:c.Id];
        System.assertEquals('no@email.com', contacts[0].Email);
        test.stopTest();
      }
        //Step 4 : When Email is Not Null.
       @istest
      static void Scenario4()
      {
        test.startTest();
        Contact c = new Contact();
        c.LastName = 'Test 100';
        c.Phone = '22222';
        c.Email = 'test@gmail.com';
        insert c; 
        
        List<Contact> contacts = [Select Phone From Contact Where Id=:c.Id];
        System.assertEquals('test@gmail.com', contacts[0].Email);
        test.stopTest();
      }*/
        //Step 5 : When Email and Phone both are Null.
        //Step 6 : When Email and Phone both are not Null.
        
    }