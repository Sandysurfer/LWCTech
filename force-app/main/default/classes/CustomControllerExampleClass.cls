public class CustomControllerExampleClass {
    public string UserName{set;get;}
    public string message{set;get;}
    
    public Integer Num1{set;get;}
    public Integer Num2{set;get;}
    public Integer result{get;set;}
    
    
    public void ShowMessage()
    {
        message = 'Welcome ' + UserName;
    }
    public void Addition()
    {
        result = num1 + num2;
    }
    public void Substraction()
    {
        result = num1 - num2;
    }
    public void Multiplication()
    {
        result = num1 * num2;
    }
    public void Division()
    {
        result = num1 / num2;
    }
}