@isTest 
private class PartOrderEdit_Test {
 
    @isTest
    private static void ControllerTest() {
        Test.startTest();
        Test.setCurrentPage(Page.PartOrderEditPage);
        // Test null controller for stdController getter 
        ApexPages.StandardSetController stdSetController = NULL;
        stdSetController = PartOrderEdit_CX.stdController;
        PartOrderEdit_CX extController = new PartOrderEdit_CX(stdSetController);
        Test.stopTest();
    }

    @isTest
    private static void PartTest() {
        List <Parts_Order_List__c> parts = new List<Parts_Order_List__c>();
        parts.add(new Parts_Order_List__c(Name = 'Test', Part_Type__c = 'Accessories'));
        insert parts;
    }

    
    @isTest
    private static void PartBulkTest() {
        List <Parts_Order_List__c> parts = new List<Parts_Order_List__c>();
        for(Integer i = 0;i < 200;i++) {
            parts.add(new Parts_Order_List__c(Name = 'Test', Part_Type__c = 'Accessories'));
        }
        insert parts;
    }

    @isTest
    private static void PartInvalidTest() {
        Parts_Order_List__c part = new Parts_Order_List__c();
        // part.Name='Test';
        // part.Part_Type__c = 'Accessories';

        // get result of record insertion (a failure in this case) 
        Test.startTest();
        Database.SaveResult insertionResult = Database.insert(part, false);
        Test.stopTest();

        Integer errorCount = 0;
        if(!insertionResult.isSuccess()) {
                System.debug('Received error.');
            ++errorCount;
        }

        System.assertEquals(0, errorCount);
    }
}