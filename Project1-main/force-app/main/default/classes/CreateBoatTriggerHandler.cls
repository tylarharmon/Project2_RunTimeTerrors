public with sharing class CreateBoatTriggerHandler {
    
    public static void createBoatOnSave(List<Boat_Sold__c> bS){
        List<Boat_Manufacturing__c> bM = new List<Boat_Manufacturing__c>();
        for (Boat_Sold__c s : bS) {
            Boat_Manufacturing__c b = new Boat_Manufacturing__c(Name = s.Name,
                                                                Boat_Length__c = s.Boat_Length__c);

            bM.add(b);
        }
        insert bM;
    }
}