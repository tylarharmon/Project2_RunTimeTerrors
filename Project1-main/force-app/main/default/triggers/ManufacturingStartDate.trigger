trigger ManufacturingStartDate on Boat_Manufacturing__c (before insert, before update) {
    ManufacturingStartDate.preventInvalidManufacturingStartDate(Trigger.new, Trigger.oldMap);
    
}