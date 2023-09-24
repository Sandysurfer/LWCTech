({
    helperHideContactModalMethod : function(component,event) {
        var hideContactEvent = component.getEvent('hideContactModal');
        
        hideContactEvent.setParams({
            
            hideContactModal:false
        });
        
        hideContactEvent.fire();
        
    }
})