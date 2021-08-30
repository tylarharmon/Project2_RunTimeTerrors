({
    handleSuccess : function(component, event, helper) {
        component.find('notifLib').showToast({
            "title" : "Supplier Record Created",
            "message" : "Record Created",
        });
    },
    handleError : function(component, event, helper){
        component.find('notifLib').showToast({
            "title" : "Something has gone wrong",
            "message" : event.getParam("message"),
        });
    }
})