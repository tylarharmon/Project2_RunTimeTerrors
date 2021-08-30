({
    clickCreateCustomer : function(component, event, helper) {
        let validCustomer = component.find('customerForm').reduce(function(validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validCustomer){
            let newCustomer = component.get("v.newCustomer");
            helper.createCustomer(component, newCustomer);
        }





    },
    cancel : function(component, event, helper){
        component.set("v.newCustomer", { 'sobjectType': 'Customer__c',
        'First_Name__c': '',
        'Last_Name__c': '',
        'Phone__c': '',
        'Email__c': '',
        'Home_Owner__c': false,
        'Street_Address__c': '',
        'City__c': '',
        'State__c': '',
        'Zip_Code__c': '',
        'Occupation__c': '',
        'Company_Name__c': '',
        'Company_Phone__c': '',
        'Annual_Salary__c': 0,
        'Credit_Score__c': 0,
        'Estimated_Down_Payment__c': 0});
    }
})
