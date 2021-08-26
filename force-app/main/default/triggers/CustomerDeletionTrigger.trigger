trigger CustomerDeletionTrigger on Customer__c (before delete) {
    CustomerDeletionHandler.CustomerDeletionPrevention(Trigger.oldMap);
}