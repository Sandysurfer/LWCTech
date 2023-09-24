public class LightningGetAllObjects {
    
    @AuraEnabled
    public static List<String> getAllObjects() {
        
        List<String> objectList = new List<String>();
        List < Schema.SObjectType > gd = Schema.getGlobalDescribe().Values();      
        for(SObjectType Obj : gd){
            objectList.add(Obj.getDescribe().getName());
        }
        return objectList;
    }
    
    @AuraEnabled
    public static List<String> getAllFields( String obj){
        
        List<String> reqFields = new List<String>();
        Map <String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        
        Schema.SObjectType sobjType = gd.get(obj);
        Schema.DescribeSObjectResult r = sobjType.getDescribe();
        
        Map<String, Schema.SObjectField> MapofField = r.fields.getMap();
        
        for(String keys: MapofField.keySet()){
            reqFields.add(MapofField.get(Keys).getDescribe().getName());   
        }
        return reqFields;
    }
    
}