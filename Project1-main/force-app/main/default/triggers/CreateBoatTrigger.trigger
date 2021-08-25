trigger CreateBoatTrigger on Boat_Sold__c (after insert) {
    CreateBoatTriggerHandler.createboatonsave(Trigger.new);
}