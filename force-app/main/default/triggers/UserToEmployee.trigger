trigger UserToEmployee on User (After insert) {
    
    Map<Id,User> userMap = Trigger.newMap;
    Set<Id> userId =  userMap.keySet();
    
    UserToEmpHelper.CreateEmployee(userId);
   

}