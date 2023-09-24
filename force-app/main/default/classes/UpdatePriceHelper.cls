public class UpdatePriceHelper {
    
    public static void ApplyDiscount( List<Library__c> library)
    {
        
        for(Library__c EB : library)
        {
            EB.Price__c*=0.9; //x*=y
        }
        
    }
}