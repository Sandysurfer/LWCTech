({
	handleSaveRecord : function(component, event, helper) {
        component.find("recordEditor").saveRecord($A.getCallback(function(response){
            if(response.state =="SUCCESS")
            {
                //alert("Save Completed Successfully "+response.recordId);
                var resultToast = $A.get("e.force:ShowToast");
                resultToast.setParams({
                    type:"Success",
                    title:"Saved",
                    message:"The Record is saved With new Account Name"    
                });
                resultToast.fire();
            }
            
            else if(response.state == "ERROR")
            {
                alert("Record has Error "+JSON.stringify(response.error));
            }
            
            else if(response.state == "INCOMPLETE")
            {
                alert("Network Issue");
            }
            else
            {
                alert("Some Unknown Problem");
            }
        }));
		
	}
})