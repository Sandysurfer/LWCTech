({
	handleNumbers : function(component, event, helper) {
        //Push 1 to 20 numbers...
        //Array Declaration.....
        var jsNumbers = [];
        for(var i=0;i<20;i++)
        {
            jsNumbers.push(i);
            console.log('Numbers are '+jsNumbers);
        }
        //component.set("v.numbers",jsNumbers);
       //console.log(component.get("v.numbers"));
       console.log(jsNumbers);
		for(var key in jsNumbers)
        {
            console.log('Keys '+key);
        }
	}
})