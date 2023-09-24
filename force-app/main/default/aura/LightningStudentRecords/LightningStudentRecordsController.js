({
	doinit : function(component, event, helper) {
        
        console.log('call on page load');
        
        var action = component.get("c.GetStudentRecords");
        
         action.setCallback(this,function(response){
            console.log(response.getState());
            console.log(response.getReturnValue());
             
            if(response.getState()==="SUCCESS"){
                component.set("v.studentList" ,response.getReturnValue()); 
            }else if(response.getState()==="ERROR"){
                alert("Error came= "+response.getError());
            }
        });
        
        $A.enqueueAction(action);
		
	}
})