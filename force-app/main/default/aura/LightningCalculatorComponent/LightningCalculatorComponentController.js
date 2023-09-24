({
    handleNumbers: function(component, event,helper){
        
        const numberComp = event.getSource().getLocalId();
        const buttonLabel = component.find(numberComp).get("v.label");
        //Existing Number
        const existingNumber = component.get("v.currentNumber");
        
        //Condition
        if(existingNumber){
            component.set("v.currentNumber",existingNumber+buttonLabel);
        }
        else{
            component.set("v.currentNumber",buttonLabel);
        }
        //Setting final Value to result
        component.set("v.result",component.get("v.currentNumber"));
    },
    
    handleClear:function(component, event,helper){
        component.set("v.result",0);
        component.set("v.currentNumber",null);
    }
})
    
    
   /* MathOperation : function(component, event, helper) 
    {
        var num1 = component.find('num1').get('v.value');
        var num2 = component.find('num2').get('v.value');
        
        //It Will Call Apex Method
        var action = component.get("c.GetAdd");
        var action = component.get("c.GetSub");
        
        action.setParams({
            a:num1,
            b:num2,
            c:num1,
            d:num2
        });
        action.setCallback(this,function(response){
            console.log(response.getState());
            console.log(response.getReturnValue());
            if(response.getState()==="SUCCESS"){
                component.find("result").set('v.value',response.getReturnValue()); 
            }else if(response.getState()==="ERROR"){
                alert("Error came= "+response.getError());
            }
        });
        
        $A.enqueueAction(action);
        
    }*/