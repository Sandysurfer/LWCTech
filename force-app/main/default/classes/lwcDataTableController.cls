public class lwcDataTableController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        return[SELECT Id, FirstName, LastName, Phone, Email FROM Contact LIMIT 25];
    }

}