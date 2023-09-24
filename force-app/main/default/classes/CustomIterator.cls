public class CustomIterator implements Iterator<Account> {
    
    private List<Account> accs; 
    private integer currentIndex;
    
    public CustomIterator(List<Account> Accounts){
        this.accs = Accounts;
        this.currentIndex = 0;
    }
    
    public boolean hasNext(){
        return currentIndex<accs.size();
    }
    
    public Account next(){
        if(hasNext())
        {
            return accs[currentIndex++];
        }
        else
        {
            System.debug('Iterator has no more elements');
            return null;
        }
    }
    
}