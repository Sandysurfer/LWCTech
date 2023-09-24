public class GreatestNumber {
    
    public void calculate(Integer Num1, Integer Num2, Integer Num3)
    {
        if(Num1>Num2 && Num1>Num3)
        {
            System.debug('The Greater Number is '+Num1);
        }
        else if(Num2>Num1 && Num2>Num3)
        {
            System.debug('The Greater Number is '+Num2);
        }
        else
        {
            System.debug('The Greatest Number is '+Num3);
        }
    }
    
}