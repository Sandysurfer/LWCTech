public class AnimalsCallouts {
    public static HttpResponse makegetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //If the request is successful parse the JSON Response.
        if(response.getStatusCode() == 200){
            //Deserialize the JSON String into Collection of Primitive datatypes.
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            //Cast the Values in animals Keys as a result.
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Recieved the Following Animals:');
            for(Object animal : animals){
                System.debug(animal);
            }
        }
        return response;
    }
    
    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('Post');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }
    
}