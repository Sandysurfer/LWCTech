({
    helperMethod : function(component) {
        
        //Step 1:- Call Server side Method... 
        var action = component.get("c.getAccountList");
        //Step 2:- Pass Parameter....
        
        //Step 3:- Invoke Server Side Apex...
        action.setCallback(this,function(response){
            var state = response.getState();
            //console.log(state);
            if(state == 'SUCCESS')
            {
                component.set("v.accList",response.getReturnValue())
            }
        });
        
        //Step 4:- Enqueue Action...
        $A.enqueueAction(action);
        
    },
    
    helperAccount: function(component){
        var action = component.get("c.createAccount");
        action.setParams({
            "Name":"Lightning Component",
            "Phone":"54846848",
            "Rating":"Hot"
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == 'SUCCESS')
            {
                var res = response.getReturnValue();
                console.log(JSON.stringify(res));
                alert(res); 
            }
            else
            {
                alert("No Response");
            }
            
        });
        $A.enqueueAction(action);
    }
})