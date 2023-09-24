public class UserToEmpHelper {
    
    Public static void CreateEmployee(Set<Id> userId)
    {
        List<User> newusers = [Select Id,FirstName,LastName,Email,Phone From User Where Id IN:UserId];
        List<Employee__c> createNewEmp = new List<Employee__c>();
        
        for(User EU : newusers)
        {
            Employee__c Emp = new Employee__c();
            Emp.Employee_Email__c = EU.Email;
            Emp.Employee_Phone__c = EU.Phone;
            Emp.EmployeeFirstName__c = EU.FirstName;
            Emp.Employee_Last_Name__c = EU.LastName;
            Emp.Name = EU.FirstName +' '+EU.LastName;
            createNewEmp.add(Emp);
            
        }
        if(createNewEmp.size()>0)
        {
            insert createNewEmp;
        }
    }
    
}