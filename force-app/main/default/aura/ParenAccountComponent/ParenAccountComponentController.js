({
    handleComponetEvent : function(component, event, helper) {
        
        var accountName = event.getParam("accountName");
        console.log(accountName);
        
        // if($A.util.isEmpty(accountName))
        var action = component.get("c.GetAccountContacts");
        
        action.setParams({
            accName : accountName,
        });
        
        action.setCallback(this,function(response){
            console.log(response.getState());
            
            if(response.getState()==="SUCCESS")
            {
                console.log(response.getReturnValue());
                if(response.getReturnValue().length)
                {
                    component.set("v.isContactEmpty",false);
                    component.set("v.accContacts",response.getReturnValue());
                }
                else
                {
                    component.set("v.accContacts", []);
                    component.set("v.isContactEmpty",true);
                }
            }else if(response.getState()==="ERROR"){
                component.set("v.isContactEmpty",true);
                component.set("v.accContacts", []);
                console.log("Error came= "+response.getError());
            }
        });
        
        $A.enqueueAction(action);
        
    },
    
    showEditContactModal :  function(component, event, helper){
       // console.log(event.getSource().get('v.name'));
        component.set('v.contactRecordId', event.getSource().get('v.name'));
        component.set('v.isShowContactModal',true);
    },
    
    HideEditContactModal:  function(component, event, helper){
        
        var isHideEditModalParam = event.getParam('hideContactModal');
        component.set('v.isShowContactModal',isHideEditModalParam);
    }
})