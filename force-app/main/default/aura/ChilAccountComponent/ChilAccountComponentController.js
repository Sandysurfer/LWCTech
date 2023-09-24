({
    SetEventAccountName : function(component, event, helper) {
        
        var inputAccountName = component.find('accountName').get('v.value');
        
        if(inputAccountName != null && inputAccountName!="")
        {
            component.set('v.isAccountName',false);
            var varAccConEvent = component.getEvent('accConEventName');
            varAccConEvent.setParams({
                accountName : inputAccountName
                
            });
            
            varAccConEvent.fire();
        }
        else
        {
            //alert("Please enter Account Name!")
            component.set('v.isAccountName',true);
        }
        
        
        
    }
})