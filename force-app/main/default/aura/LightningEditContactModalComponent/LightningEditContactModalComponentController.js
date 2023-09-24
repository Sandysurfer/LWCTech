({
    HideContactModal : function(component, event, helper) {
        
        helper.helperHideContactModalMethod(component,event);
        
    },
    handleSubmit: function(component, event, helper) {
        event.preventDefault();       // stop the form from submitting
        var fields = event.getParam('fields');
        component.find('ContactEditForm').submit(fields);
        helper.helperHideContactModalMethod(component,event);
    },
    handleSuccess: function(component, event, helper) {
        
    }
})