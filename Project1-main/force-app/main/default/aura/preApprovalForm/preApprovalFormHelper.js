({
    createCustomer : function(component, newCustomer) {
        // create an addCustomer event with the customer to be added
        let addEvent = component.getEvent("addCustomer");
        addEvent.setParams({ "customer": newCustomer});
        addEvent.fire();
        component.set("v.newCustomer", { 'sobjectType': 'Customer__c',
        'First_Name__c': '',
        'Last_Name__c': '',
        'Phone__c': '',
        'Email__c': '',
        'Home_Owner__c': false,
        'Street_Address__c': '',
        'City__c': '',
        'State__c': '',
        'Occupation__c': '',
        'Company_Name__c': '',
        'Annual_Salary__c': 0,
        'Credit_Score__c': 0,
        'Estimated_Down_Payment__c': 0});

    }
})
