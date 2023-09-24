({
    doinit: function(component, event, helper) {
        var options = [];
        var action = component.get("c.getAllObjects");
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                var allvalues = response.getReturnValue();
                console.log(allvalues);
                allvalues.forEach((value, i) => {
                    var Item = {
                    label: value,
                    value: value
                };
                                  options.push(Item);
            });
            component.set("v.options", options);
        }
                           });
        $A.enqueueAction(action);
    },
    
    handleClick: function(component, event, handler) {
        var fields = [];
        var selectedOptionValue = event.getParam("value");
        component.set("v.objName", selectedOptionValue);
        console.log("click");
        var action = component.get("c.getAllFields");
        action.setParams({
            obj: selectedOptionValue
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                var allvalues = response.getReturnValue();
                console.log(allvalues);
                allvalues.forEach((value, i) => {
                    var Item = {
                    label: value,
                    value: value
                };
                                  fields.push(Item);
            });
            component.set("v.fields", fields);
            var listfield = component.get("v.fields");
            component.set("v.values", listfield);
        }
                           });
        
        $A.enqueueAction(action);
    },
    
    handleChange: function(component, event, helper) {
        var selectedOptionValue = event.getParam("value");
        var selectedlist = component.set("v.selectedList",selectedOptionValue.toString() + "");
        var getvalue = component.get("v.selectedList");
    },
    
    handleFunction: function(component,event,helper){
        
    },
    
    generateQuery: function(component, event, helper) {
        var objtName = component.get("v.objName");
        var SelectId = component.get("v.options");
        var makequery = component.get("v.selectedList");
        var querymaker = "SELECT" + " " + makequery + " " + "From" + " " + objtName;
        component.set("v.queryString", querymaker);
    }
});