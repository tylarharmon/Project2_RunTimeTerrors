({
    
	getPicklistValues: function(component, event, helper) {
        var pickvar = component.get("c.getPartType");
        pickvar.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS'){
                var list = response.getReturnValue();
                component.set("v.fieldList", list);
            }
            else if(state === 'ERROR'){
                
                alert('ERROR OCCURED.');
            }
        })
        $A.enqueueAction(pickvar);
    },
     
    
    savePartOrder : function(component, event, helper) {
        var neworder = component.get("v.PartsOrder");
        
        var action = component.get("c.savePartsOrder");
        
        action.setParams({
            "order" : neworder
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            
            if(state === "SUCCESS"){
                component.set("v.PartsOrder", response.getReturnValue());
                alert('Record Created Successfully!!');
            } else if(state === "ERROR"){
                alert('Save Failed');
            }
        });       
        $A.enqueueAction(action);
    },
    
    handleSuccess : function(component, event, helper) {
        window.location.reload(false);
    }
    
})