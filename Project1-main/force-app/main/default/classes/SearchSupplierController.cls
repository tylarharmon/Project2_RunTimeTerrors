public with sharing class SearchSupplierController {
    @AuraEnabled
    public static List<Supplier__c> getSuppliers(){
        return [SELECT Name, Phone__c, Website__c, Region__c, CreatedById FROM Supplier__c];
    }
    @AuraEnabled
    public static List<Supplier__c> findByName(String searchKey){
        String name = + searchKey + '%';
        return [SELECT Name, Phone__c, Website__c, Region__c, CreatedById FROM Supplier__c WHERE Name LIKE:name];
    }
}
