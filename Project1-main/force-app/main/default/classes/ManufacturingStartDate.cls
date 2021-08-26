public with sharing class ManufacturingStartDate {
    public static Set<Date> allHolidays = new Set<Date>();
    static {
        For (List<Holiday> holidays : [SELECT ActivityDate FROM Holiday]) {
            For (Holiday h : holidays) {
                allholidays.add(h.ActivityDate);
            }
        }
    }
    public static void preventInvalidManufacturingStartDate(
        List<Boat_Manufacturing__c> newManufacturingStartDate,
        Map<ID, Boat_Manufacturing__c> oldManufacturingMap ){
        for (Boat_Manufacturing__c manufacturingStartDate : newManufacturingStartDate) {
            Boolean checkDate = (Trigger.isInsert || 
            oldManufacturingMap.get(manufacturingStartDate.id).Manufacturing_Start_Date__c != 
            manufacturingStartDate.Manufacturing_Start_Date__C);
            if (checkDate && manufacturingStartDate.Manufacturing_Start_Date__c != null) {
                if (allHolidays.contains(manufacturingStartDate.Manufacturing_Start_Date__c)) {
                    manufacturingStartDate.Manufacturing_Start_Date__c.addError(
                    'Boat manufacturing start date cannot be scheduled on a holiday');
                }
            }
        }
    }
}