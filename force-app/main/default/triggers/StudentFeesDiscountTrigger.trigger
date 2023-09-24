trigger StudentFeesDiscountTrigger on Student__c (before insert,before update) {
    for(Student__c studentobj:Trigger.New)
    { 
        double discountedfees = 0;
        Discounted_Student__c discountedstudent = new Discounted_Student__c();
        if(studentobj.Percentage__c >= 60 && studentobj.Percentage__c < 70)
        {
            studentobj.Discount_Label__c = '10% discount';
            discountedfees = studentobj.Total_Fees__c - (studentobj.Total_Fees__c*0.5);
        }
        else if(studentobj.Percentage__c >= 70 && studentobj.Percentage__c < 85)
        {
            studentobj.Discount_Label__c = '15% discount';
            discountedfees = studentobj.Total_Fees__c - (studentobj.Total_Fees__c*0.3);
        }
        else if(studentobj.Percentage__c >= 85)
        {
            studentobj.Discount_Label__c = '20% discount';
            discountedfees = studentobj.Total_Fees__c - (studentobj.Total_Fees__c*0.1);
           
        }
        if(discountedfees >0)
        {
            studentobj.RemainingFees__c = discountedfees - studentobj.Fees_Deposited__c;
            discountedstudent.Name = studentobj.Student_Name__c;
            insert discountedstudent;
        }
        else
        {
            studentobj.Discount_Label__c = ' NO discount';
            studentobj.RemainingFees__c = studentobj.Fees_Deposited__c - discountedfees;
        }
        studentobj.DiscountedFees__c = discountedfees;
        // studentobj.RemainingFees__c =  discountedfees>0? discountedfees - studentobj.Fees_Deposited__c:studentobj.Fees_Deposited__c - discountedfees;
        
    }
    
    
}