({
	myAction : function(component, event, helper) {
        component.set('v.columns', [
            
            {label:'Part Name', fieldName:'Name', type:'text', editable:'true'},
            {label:'Part Type', fieldName:'Part_Type__c', type:'picklist', editable:'true'},
            {label:'Quantity', fieldName:'Quantity__c', type:'number', editable:'true'},
            {label:'Supplier', fieldName:'Supplier__c', type:'text', editable:'true'},
            {label:'Date Ordered', fieldName:'Date_Ordered__c', type:'date', editable:'true'},
            {label:'Expected Arrival Date', fieldName:'Expected_Arrival_Date__c', type:'date', editable:'true'}
        ]);
        var action = component.get('c.orderedParts');
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                component.set('v.data', a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    saveorder : function(component, event, helper) {
    	var action = component.get('c.savePartsOrder');
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                component.set('v.data', a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
}
})