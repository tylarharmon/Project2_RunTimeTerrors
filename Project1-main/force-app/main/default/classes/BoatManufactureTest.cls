@isTest
private with sharing class BoatManufactureTest {
    @isTest
    static void getBoatSingleTest(){
        List <Boat_Manufacturing__c> singlePosBoat = BoatTestDataFactory.BoatDataFactory(5);
        List <Boat_Manufacturing__c> testPosBoat = BoatManufactureComponentDataRetrieval.getBoat();
        
        System.assertEquals(testPosBoat[1], singlePosBoat[1]);
        
        List <Boat_Manufacturing__c> singleNegBoat = BoatTestDataFactory.BoatDataFactory(5);
        List <Boat_Manufacturing__c> testNegBoat = BoatManufactureComponentDataRetrieval.getBoat();
        
        System.assertNotEquals(testNegBoat[1], singleNegBoat[2]);
    }
    @isTest
    static void getBoatMultiTest(){
        List <Boat_Manufacturing__c> multiPosBoat = BoatTestDataFactory.BoatDataFactory(50);
     	List <Boat_Manufacturing__c> testMultiPosBoat = BoatManufactureComponentDataRetrieval.getBoat();
        
        for(Integer i; i<50; i++){
            System.assertEquals(multiPosBoat[i].name, testMultiPosBoat[i].name);
        }
        
        List <Boat_Manufacturing__c> multiNegBoat = BoatTestDataFactory.BoatDataFactory(50);
     	List <Boat_Manufacturing__c> testMultiNegBoat = BoatManufactureComponentDataRetrieval.getBoat();
        
        for(Integer i; i<50; i++){
            System.assertNotEquals(multiNegBoat[i].Boat_Length__c, testMultiNegBoat[i].name);
        }
    }
    @isTest
    static void updateBoatSingleTest() {
        List <Boat_Manufacturing__c> singlePosBoat = BoatTestDataFactory.BoatDataFactory(1);
        Boat_Manufacturing__c testPosBoat = [SELECT Name FROM Boat_Manufacturing__c WHERE Name = 'testBoat0'];
		BoatManufactureComponentDataRetrieval.updateBoat(singlePosBoat);
		        
        System.assertEquals('testBoat0', testPosBoat.Name);
		
		
        List <Boat_Manufacturing__c> singleNegBoat = BoatTestDataFactory.BoatDataFactory(5);
		Boat_Manufacturing__c testNegBoat = [SELECT Name FROM Boat_Manufacturing__c WHERE Name = 'testBoat1'];
        BoatManufactureComponentDataRetrieval.updateBoat(singleNegBoat);
        
        System.assertNotEquals('testBoat0', testNegBoat.Name);        
    }
    @isTest
    static void updateBoatMultiTest(){
     	List <Boat_Manufacturing__c> multiPosBoat = BoatTestDataFactory.BoatDataFactory(50);
     	List <Boat_Manufacturing__c> testMultiPosBoat = [SELECT Name FROM Boat_Manufacturing__c];
        BoatManufactureComponentDataRetrieval.updateBoat(multiPosBoat);
        for(Integer i; i<50; i++){
            System.assertEquals(multiPosBoat[i].name, testMultiPosBoat[i].name);
        }
        
     	List <Boat_Manufacturing__c> multiNegBoat = BoatTestDataFactory.BoatDataFactory(50);
        List <Boat_Manufacturing__c> testMultiNegBoat = [SELECT Boat_Length__c FROM Boat_Manufacturing__c];
        BoatManufactureComponentDataRetrieval.updateBoat(multiNegBoat);
        for(Integer i; i<50; i++){
            System.assertNotEquals(multiPosBoat[i].Boat_Length__c, testMultiPosBoat[i].name);
        }
    }
}