({
    recordSubmitted : function(component, event, helper) {
        console.log('Record Saved');
        
        var eventSuccess = $A.get("e.force:showToast");
        eventSuccess.setParams({
            title : 'Success',
            message : 'Record Created Successfully',
            type : 'success'
        });
        
        eventSuccess.fire();
        
    }
    
    
})