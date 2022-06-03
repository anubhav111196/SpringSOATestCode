({
	doInit : function(component, event, helper) {
        
	var action = component.get("c.displayAccounts"); 
        
    action.setCallback(this, function(response) {
            var state = response.getState(); //Checking response status
            var result = response.getReturnValue();
            if (state === "SUCCESS")
                component.set("v.accLst", result);  // Adding values in Aura attribute variable.   
        });
        $A.enqueueAction(action);
	}
})