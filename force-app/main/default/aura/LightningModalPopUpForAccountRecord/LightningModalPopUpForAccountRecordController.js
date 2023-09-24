({
    openModal: function(component, event, helper) {
        component.set("v.isModalOpen", true);
    },
    
    closeModal: function(component, event, helper) {
        component.set("v.isModalOpen", false);
    },
    
    submitDetails: function(component, event, helper) {
        
        var name = component.find("name").get("v.value");
        var phone = component.find("phone").get("v.value");
        var annualrevenue = component.find("annualrevenue").get("v.value");
        var accountnumber = component.find("accountnumber").get("v.value");
        
        var action = component.get("c.CreateAccount");
        action.setParams({ Name : name , Phone:phone, AccountNumber:accountnumber,Annualrevenue:annualrevenue });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.response", response.getReturnValue());
                if(response.getReturnValue() == true){
                    
                    var toastEvent = $A.get("e.force:showToast");
                    console.log('Toast');
                    toastEvent.setParams({
                        title : 'Success',
                        message: 'Record has been Created Successfully',
                        duration:' 5000',
                        key: 'info_alt',
                        type: 'success',
                        mode: 'pester'
                    });
                    toastEvent.fire();
                    component.set("v.isModalOpen", false);
                }
            }
            
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });
        
        $A.enqueueAction(action);
        
    },
})