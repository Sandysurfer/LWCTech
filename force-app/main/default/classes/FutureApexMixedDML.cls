public class FutureApexMixedDML {
    
    public static void insertWithNonSetUpObject(){
        //Step 1:- Dml to Insert NonSetup Object
        Account obj = new Account();
        obj.Name = 'Setup Record';
        insert obj;
        
        //Calling Future Method.
        InsertWithSetUpObject();
    }
    
    @future
    public static void InsertWithSetUpObject(){
        //Dml to Insert Setup Object
        
        Profile profileobj = [Select Id From Profile Where Name = 'Front Desk Executive'];
        User roleobj = [Select Id From User Where Name = 'Front Desk User'];
        
        User userobj = new User();
        userobj.LastName = 'setupTest';
        userobj.Alias = 'stest';
        userobj.email = 'frontdeskarc@gmail.com';
        userobj.ProfileId = profileobj.id;
        //userobj.UserRoleId = roleobj.Id;
        insert userobj;
        System.debug('Userobj----> '+userobj);
        
    }
    
    @future(callout = true)
    public static void futureToMakeCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
            }
        }
        
    }
    
}