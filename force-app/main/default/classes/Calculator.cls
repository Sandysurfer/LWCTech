public class Calculator {
    
    private integer bonus = 2000;
                                                     //encapsulation + arithmetic opertion example.........
    //getter method to achieve encapsualation
    public integer GetBonus()
    {
        return bonus;
    }
    //setter method to achieve encapsulation
    public void SetBonus(integer newbonus)
    {
        bonus = newbonus;
    }
    // parameterised constructor
    public Calculator(integer bonus1)
    {
        bonus = bonus1;
    }
    //default constructor
    public Calculator()
    {
        
    }
    public integer Add(integer num1, integer num2)
    {
        return num1+num2+bonus; 
    }
    /* public integer Sub(integer num1, integer num2)
    {
        return num1-num2; 
    }
     public integer Mul(integer num1, integer num2)
    {
        return num1*num2; 
    }
     public double Div(integer num1, integer num2)
    {
        return num1/num2; 
    }*/
}