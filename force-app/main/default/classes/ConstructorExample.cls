public class ConstructorExample {
    
    Integer Length;
    Integer Breadth;
  
    
  /*  public ConstructorExample(Integer L, Integer B)  //on the load of class while instantiating an object value is passed by constructor of class.
    {
        Length = L;
        Breadth = B;
    } */
    
    Public void CalculateArea(Integer L,Integer B)
    {
        Integer Area;
        Area = L * B;
        System.debug(Area);
        
    }
}