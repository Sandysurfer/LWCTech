public class LightningMathematicalOperation {
    
    @AuraEnabled
    public static Integer GetAdd(Integer a, Integer b)
    {
       return a+b;
    }
    
   @AuraEnabled
    public static List<Student__c> GetStudentRecords()
    {
       List<Student__c> studentRecords = [SELECT Id, Student_Name__c, Student_Email__c, Fees_Deposited__c, Course__c,Course__r.Name FROM Student__c Limit 10];
           return studentRecords;
    }
 
    
}