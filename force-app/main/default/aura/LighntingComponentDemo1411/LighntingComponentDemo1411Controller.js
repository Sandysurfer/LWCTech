({
    checkEligibility : function(component) {
        var age = component.find("Age").get("v.value");
        if(age >=18)
        {
            component.set('v.isEligible',true)            
        }
        else
        {
            component.set('v.isEligible',false)
        }
        
    }
})