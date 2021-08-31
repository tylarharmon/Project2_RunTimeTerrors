({
    getSupplierList : function(component) {
        var action = component.get('c.getSuppliers');
        var self = this;
        action.setCallback(this, function(actionResult) {
            component.set('v.suppliers', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})
