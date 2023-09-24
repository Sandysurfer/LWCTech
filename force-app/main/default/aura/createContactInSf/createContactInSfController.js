({
    handleClick : function(component, event, helper) {
        var firstnameJS = component.find("fname").get("v.value");
        var lastnameJS = component.find("lname").get("v.value");
        var emailJS = component.find("email").get("v.value");
        var phoneJS = component.find("phone").get("v.value"); 
        
        var action = component.get("c.createContact");
        action.setParams({ firstName:firstnameJS,lastname:lastnameJS,email:emailJS,phone:phoneJS});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("From server: " + response.getReturnValue());
                alert("From server: " + response.getReturnValue());
            }
            else if (state === "INCOMPLETE") {
                
            }
                else if (state === "ERROR") {
            
            }
        });
        $A.enqueueAction(action);
        
        
    }
})