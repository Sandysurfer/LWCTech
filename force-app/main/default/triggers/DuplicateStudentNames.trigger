trigger DuplicateStudentNames on Student__c (before insert) {
    
    Set<String> setStudentName = new Set<String>();
    
    for(Student__c stobj : trigger.new)
    {
        setStudentName.add(stobj.Student_Name__c);
    }
    
    List <Student__c> studentlist = [Select Id,Student_Name__c From Student__c  Where Student_Name__c IN : setStudentName];
    
    if(studentlist.size()>0)
    {
        for(Student__c stobj : trigger.new)
        {
            stobj.addError('Student Name Already Exists');
        }
    }
    
    
}