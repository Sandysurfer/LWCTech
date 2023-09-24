public class PolymorphismOverridingChild extends PolymorphismOverriding {
    
    public override void overridingMethod()
    {
        System.debug('This is child Method :Overriding');
    }
    public void Main()
    {
        overridingMethod();
        super.overridingMethod();
    }
    
}