public class SumOfOddEven {
    
    public void EvenMethod(Integer N)
    {
        Integer count = 0;
        Integer Result = 0;
        
        While(N > count)
        {
            System.debug('Count Before Calculation '+count);
            System.debug('Result Before Calculation '+Result);
            count = count + 2;
            Result = Result + count;
            
            System.debug('Result After Calculation '+Result);
             System.debug('Count After Calculation '+count);
            
            
        }
        System.debug('Sum Of even numbers up to given numbers are '+Result);
        
    }
    public void OddMethod(Integer P)
    {
        Integer count1 = 1;
        Integer Result = 0;
        
        While(P > count1)
        {
            System.debug('Count Before Calculation '+count1);
            System.debug('Result Before Calculation '+Result);
            Result = Result + count1;
            count1 = count1 + 2;
            System.debug('Result After Calculation '+Result);
            
        }
        System.debug('Sum Of odd numbers up to given numbers are '+Result);
        
        
    }
    
/* public void Main(Integer X,String Y)
{
if(y == 'Even')
{
evenMethod(X);

}
else if(Y == 'Odd')
{
OddMethod(X);
}
}
}*/
}