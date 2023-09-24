({
	handleEvent : function(component, event, helper) {
        
		//Get the Message From Lightining Event....
		var message = event.getParam("message")
        
		//Set Lightning Component Attribute to Lightning Event Message.....
		component.set("v.messageFromEvent",message)
        
		//Incrementing the Number.....
		var finalNumber = parseInt(component.get("v.incNumber"))+1;
        
		//Set the Number to Lighting Attribute  
		component.set("v.incNumber",finalNumber);
	}
})