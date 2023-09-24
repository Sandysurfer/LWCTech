public class LWCSaveCourseRows {
    
    @AuraEnabled
    public static List<Course__c> saveCourseData(String courseDataString){
        List<Course__c> courseList = (List<Course__c>)System.JSON.deserialize(courseDataString, List<Course__c>.class);
        Database.insert(courseList);
        return courseList;
    }
    
}