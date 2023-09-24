public class CustomIterable implements Iterable<Account>{
    
    public Iterator<Account> iterator()
    {
        List<Account> accounts = [Select Id,Name,NumberofEmployees From Account Limit 10];
        return new CustomIterator(accounts); 
    } 
    
}