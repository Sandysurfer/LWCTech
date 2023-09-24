public with sharing class lwcWiretoCreateClass {
    
    @Auraenabled(cacheable=true)
    public Static List<Contact> findContacts(String searchtext) {
       string key ='%'+searchtext+'%';

       return[Select Id,Name,Phone,Email From Contact Where FirstName like:key];
    }
}