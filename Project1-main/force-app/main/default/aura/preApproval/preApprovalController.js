({
    handleAddCustomer : function(component, event, helper) {
        // Saves record to the database
        let getCustomer = event.getParam("customer");
        let action = component.get("c.saveCustomer");
        action.setParams({
            "customer": getCustomer
        });
        action.setCallback(this, function(response) {
            let state = response.getState();
            if(state === "SUCCESS"){
                let customers = component.get("v.customers");
                customers.push(response.getReturnValue());
                component.set("v.customers", customers);
                console.log("success");
            } else {
                console.log("State: " + state);
            }
        });
        $A.enqueueAction(action);



    }
})
