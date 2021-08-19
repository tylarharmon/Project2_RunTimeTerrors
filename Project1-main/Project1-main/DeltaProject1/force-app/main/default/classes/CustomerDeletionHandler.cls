public with sharing class CustomerDeletionHandler {
    public static void CustomerDeletionPrevention(Map<Id,Customer__c> m) {
        
        for (Customer__c c : [SELECT Id FROM Customer__c WHERE Id IN (SELECT Sold_to__c FROM Boat_Sold__c) 
                            AND Id IN :Trigger.old]) {

            Trigger.oldMap.get(c.Id).addError( 
                'Cannot delete customer who purchased a boat.');
        }
    }
}