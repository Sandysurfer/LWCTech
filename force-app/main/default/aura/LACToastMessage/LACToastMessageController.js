({
	handleSuccess : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title:"Success Message",
            type:"Success",
            message:"Succesfully Saved"     
        });
        toastEvent.fire();
	},
    
    	handleInformation : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title:"Information Message",
            type:"Info",
            message:"Mode is disabled"     
        });
        toastEvent.fire();
	},
    
    	handleError : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title:"Error Message",
            type:"warning",
            message:"Mode has issue"     
        });
        toastEvent.fire();
	}
})