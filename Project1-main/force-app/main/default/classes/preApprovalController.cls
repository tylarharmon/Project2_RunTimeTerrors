public class preApprovalController {
 @AuraEnabled
 public static Customer__c saveCustomer(Customer__c customer){
     upsert customer;
     return customer;

 }
}
