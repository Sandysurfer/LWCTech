global class ScheduleApexJobforStudentCourseReport implements schedulable {
    
    //Schedulable interfeace implements schedulable. 
    //Parameter SchedulableContext.
    global static void execute(SchedulableContext ctx){
        
        List<Student_Course_Report__c> lstofReportToDelete = new List<Student_Course_Report__c>();
        
        //Report With Status Closed Should be Deleted every Night.
        for(Student_Course_Report__c obj : [Select Id,Status__c From Student_Course_Report__c Where Status__c = 'Closed'])
        {
            lstofReportToDelete.add(obj);
        }
        if(!lstofReportToDelete.isEmpty())
        {
            delete lstofReportToDelete;
        }
        
        //Calling Callout Method
        makeGetCallout();
    }
    @future(callout = true)
    public static void makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals: '+animals);
            for(Object animal: animals) {
                System.debug(animal);
            }
        }
        
        
    }
    
}