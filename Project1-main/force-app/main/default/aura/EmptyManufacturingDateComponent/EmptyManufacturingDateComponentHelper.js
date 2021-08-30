({
    getData : function(cmp, event) {
         var action = cmp.get('c.getBoat');
         action.setCallback(this, function (response) {
             var state = response.getState();
             if (state === "SUCCESS") {
                 cmp.set('v.boat', response.getReturnValue());
             } 
             else if (state === "ERROR") {
                 var errors = response.getError();
                 if(errors){
                     if(errors[0] && errors[0].message){
                         console.log("Error message: " + 
                                     errors[0].message);
                     }
                 }  
             }
             else{
                  console.log(response.getReturnValue());   
                 } 
                 
         });
         $A.enqueueAction(action);
  }
  
 })