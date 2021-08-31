@isTest
public with sharing class SearchSupplierController_Test {
    
    @isTest static void getSuppliersTest(){
        List<Supplier__c> recordData = SearchSupplierController.getSuppliers();
        List<Supplier__c> testData =  [SELECT Name, Phone__c, Website__c, Region__c, CreatedById FROM Supplier__c];

        System.assertEquals(recordData, testData);
    }


    @isTest static void testFindByName(){

        String searchKey = 'test';
        List<Supplier__c> recordData = SearchSupplierController.findByName(searchKey);

        List<Supplier__c> testData = [SELECT Name, Phone__c, Website__c, Region__c, CreatedById FROM Supplier__c WHERE Name LIKE:searchKey];
        
        System.assertEquals(recordData, testData);
    }
    
}
