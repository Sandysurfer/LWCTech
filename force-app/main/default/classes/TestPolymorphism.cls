public class TestPolymorphism {
    public static void print()         //Polymorphism example........
    {
     Bank b = new Bank();
        System.debug('Bank Rate Of Interest is '+b.getRateOfInterest());
        
     SBI sb = new SBI();
        System.debug('SBI Rate Of Interest is '+sb.getRateOfInterest());
        
     BOB bb = new BOB();
        System.debug('BOB Rate Of Interest is '+bb.getRateOfInterest());
        
     UCO uc = new UCO();
        System.debug('UCO Rate Of Interest is '+uc.getRateOfInterest());
    }

}