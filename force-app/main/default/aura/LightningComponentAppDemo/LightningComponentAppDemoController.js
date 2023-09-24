({
	getInfo : function(component) {
        console.log(component)
        var firstName = component.find("FirstName").get("v.value");
        var lastName = component.find("LastName").get("v.value");
        var outputNameElement = component.find("NametoDisplay");
        outputNameElement.set("v.value",firstName + " " + lastName);
    }
})