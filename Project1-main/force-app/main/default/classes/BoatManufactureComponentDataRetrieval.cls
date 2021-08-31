public with sharing class BoatManufactureComponentDataRetrieval {
    @AuraEnabled
    public static List<Boat_Manufacturing__c> getBoat() {
        List<Boat_Manufacturing__c> boats = [SELECT Id, Boat_Length__c, Name, Manufacturing_Start_Date__c FROM Boat_Manufacturing__c];
      
        return boats;
    }
    @AuraEnabled
    public static List<Boat_Manufacturing__c> updateBoat(List<Boat_Manufacturing__c> updatedBoat) {
      	update updatedBoat;
        return updatedBoat;
    }
}
