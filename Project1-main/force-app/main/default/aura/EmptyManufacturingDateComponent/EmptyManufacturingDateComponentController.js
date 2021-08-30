({
    init: function (cmp, event, helper) {
         cmp.set('v.mycolumns', [
             { label: 'Name', fieldName: 'Name', type: 'text', editable : "True"},
             { label: 'Boat Length', fieldName: 'Boat_Length__c', type: 'text', editable : "True"},
             { label: 'Manufacturing Start Date', fieldName: 'Manufacturing_Start_Date__c', type: 'date'}
         ]);
         helper.getData(cmp);
     },
    saveBoat: function (cmp, event, helper) {
        var draftValuesToSave = event.getParam('draftValues');
        var action = cmp.get("c.updateBoat");
        
        action.setParams({updatedBoat : draftValuesToSave});
        action.setCallback(this, function(response){
            var state = response.getState();
            
            if(state === "SUCCESS"){
                var res = response.getReturnValue();
                $A.get('e.force:refreshView').fire();
                alert('Update Successful!');
            }
            else if (state === "ERROR"){
                 var errors = response.getError();
                 if(errors){
                     if(errors[0] && errors[0].message){
                         console.log("Error message: " + 
                                     errors[0].message);
                     }
                 }  
                else{
                    console.log(response.getReturnValue());
                }   
            }
         });
        $A.enqueueAction(action);
     }
 })