({
	handleAdd : function(component, event, helper) {
        
        //Get the Event Details...
        var cEvent = Component.getEvent("LightningIncrementNumber");
        
        //Set the Lightining Event Attributes...
        cEvent.setParams({"message":"A Component is fired from ChildCmp"});
        
        //Fire the Event...
        cEvent.fire();
	}
})