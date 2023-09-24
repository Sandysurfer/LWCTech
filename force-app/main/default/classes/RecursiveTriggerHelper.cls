public class RecursiveTriggerHelper {     
    
    //Recursion Example..........
    
    public static Boolean recursiveflag = true;
    
    public static void CreateSystemGenOpp(List<Opportunity> newOpp)
    {
        List<Opportunity> opplist = new List<Opportunity>();
        for(Opportunity op : newOpp)
        {
            Opportunity opp = new Opportunity();
            opp.Name = 'System Created Opp';
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.today();
            opplist.add(opp);
        }
        if(!opplist.isEmpty())
        {
            insert opplist;
        }
        
        
    }
    
}