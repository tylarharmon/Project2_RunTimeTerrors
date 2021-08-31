@IsTest
public class BoatTestDataFactory {
    public static List <Boat_Manufacturing__c> BoatDataFactory(Integer numBoats){
        List<Boat_Manufacturing__c> boatList = new List<Boat_Manufacturing__c>();
        for(Integer i = 0; i<numBoats; i++){
            Boat_Manufacturing__c testBoat = new Boat_Manufacturing__c(Boat_Length__c = 'i', Name = 'testBoat' + i);
            boatList.add(testBoat);
        }
        insert boatList;
        return boatList;
    }
}