({
    myaction : function(component, event, helper) {
        
        var lstofContact = component.get("c.ContactlistofrelatedAccount");
        var recordId = component.get("v.recordId");
        
        lstofContact.setParams({
            accountid:recordId 
        });
        
        lstofContact.setCallback(this,function(response){
            var state = response.getState();
            if(state==='SUCCESS'){
                var contactList1 = response.getReturnValue();
                component.set("v.ContactList",contactList1);
                console.log(contactlist1);
            }else{
                alert('Error has Occcured');
            }
            
        });
        $A.enqueueAction(lstofContact);
    },
    
    handleclick: function(component, event, helper) {
        
        var idx = event.target.getAttribute('data-index');
        var contact =  component.get("v.ContactList")[idx];
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": contact.Id,
            "slideDevName": "detail"
        });
        
        navEvt.fire();
    }
    
    
})