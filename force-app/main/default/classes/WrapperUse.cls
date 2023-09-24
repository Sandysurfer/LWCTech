public class WrapperUse {
    
    public string N;               //Primitive data type
    
    public WrapperClass W; //Abstract data type
    
    public List<Contact> con;   //Collection data
    
    public void Method()
    {
        N = 'ArcTech';               //String Method
        System.debug(N);
        
        W = new WrapperClass();      //String 
        W.Name = 'SFDC';
        System.debug(W.Name); 
                                      //Integer
        W.salary = 21000;
        
        W.acc = [Select Id,Name,Phone,Fax From Account];   //List
        
        Contact C1 = new Contact (LastName ='IT',FirstName ='New'); //collection
        W.con = C1;
        
    }
    
}