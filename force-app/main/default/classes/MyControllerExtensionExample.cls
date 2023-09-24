public class MyControllerExtensionExample {
    
    public string message{get;set;}
    public string VariableforStoringAccountName{get;set;}
    
    public MyControllerExtensionExample(ApexPages.StandardController stdcontroller){
        
    }
    
    public void ShowGreeting(){
        message = 'Welcome to Extension Demo';
    }
    
    public void MySave()
    {
        Account myaccount = new Account();
        myaccount.name = VariableforStoringAccountName;
        myaccount.industry = 'Energy';
        insert myaccount;
    }
    
}