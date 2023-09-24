({
	handleFetchData : function(component, event, helper) {
		var recordId = component.get("v.recordId");
        component.find("recordLoader").set("v.recordId",recordId);
        component.find("recordLoader").reloadRecord();
	}
})