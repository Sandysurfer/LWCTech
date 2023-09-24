//Show Min and Max Salary of Child Object (Employee records) on Parent Object (Tech Firm Records) By Using Aggregate Query..............
//Both Tech_Firm__c and Employee__c are realted to Each Other (LookUp Relationship).....

public class TechFirmHandler {
    
    public static void Method1(List<Employee__c> empList, Map<Id,Employee__C> oldMap){
        
        Set<Id>parentEmpids = new Set<Id>();
        
        if(empList != null)
        {
            for(Employee__c newEmp : empList)
            {
                if(oldMap != null)
                {
                    Employee__c oldEmp = oldMap.get(newEmp.id);
                    
                    if(newEmp.Tech_Firm__c != oldEmp.Tech_Firm__c)
                    {
                        parentEmpids.add(newEmp.Tech_Firm__c);
                        parentEmpids.add(oldEmp.Tech_Firm__c);
                    }
                    else
                    {
                        parentEmpids.add(newEmp.Tech_Firm__c);
                    }
                }
                else
                {
                    parentEmpids.add(newEmp.Tech_Firm__c);
                }
            }
        }
        List<AggregateResult> aggrList = [Select Tech_Firm__c tfId , Max(Salary__c) maxsalary, Min(Salary__c) minsalary From Employee__c Where Tech_Firm__c IN:parentEmpids group by Tech_Firm__c];
        
        Map<Id,Tech_Firm__c> maptoUpdate = new Map<Id,Tech_Firm__c>();
        
        for(Id ids : parentEmpids)
        {
            Tech_Firm__c tf = new Tech_Firm__c();
            tf.Id = ids;
            tf.Max_Salary__c = 0;
            tf.Min_Salary__c = 0;
            maptoUpdate.put(tf.Id, tf);
        }
        
        if(!aggrList.isEmpty())
        {
            for(AggregateResult aggr : aggrList)
            {
                Tech_Firm__c tf = new Tech_Firm__c();
                tf.Id = (Id)aggr.get('tfId');
                tf.Max_Salary__c = (Decimal)aggr.get('maxsalary');
                tf.Min_Salary__c = (Decimal)aggr.get('minsalary');
                maptoUpdate.put(tf.Id, tf);
            }
            if(!maptoUpdate.isEmpty())
            {
                update maptoUpdate.Values();
            }
        }
    }
    
}