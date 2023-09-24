({
    doInit : function(component, event, helper) {
        component.find("rec").getNewRecord(
            "Contact",
            null,
            false,
            $A.getCallback(function(){
                var contactInfo = component.get("v.con");
                console.log("ContactInfo----->"+JSON.stringify(contactInfo));
                if(contactInfo == null)
                {
                    alert('Contact Initialization Failed');
                }
                else
                {
                    alert('Contact Initialization Success');    
                }
            })
        );
    },
    handleSave : function(component, event, helper){
        component.find("rec").saveRecord(function(response){
            console.log('response Obtained '+response);
            console.log('response'+JSON.stringify(response));
            if(response.state == "SUCCESS")
            {
                alert('Contact is Created Successfully'+response.recordId);
            }
            else
            {
                alert('Contact creation failed'+response.error);
            }
        });
    }
    
    
})