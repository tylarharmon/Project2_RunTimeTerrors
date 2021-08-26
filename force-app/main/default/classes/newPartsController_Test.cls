@isTest
private class newPartsController_Test {
    @IsTest 
    static void partSaveTest() {
        Parts_Order_List__c part = new Parts_Order_List__c();
        newPartsController ControllerObj = new newPartsController();
        Test.startTest();
            ControllerObj.getParts();
            ControllerObj.step1();
            ControllerObj.step2();
            ControllerObj.step3();
            ControllerObj.cancel();
            ControllerObj.parts.Name = 'Deck';
            ControllerObj.parts.Part_Type__c = 'Decking';
            ControllerObj.save();
            apexPages.Currentpage().getParameters().put('Id',part.id);
        Test.stopTest();
    }
    @IsTest
    static void partBulkTest() {
        newPartsController ControllerObj = new newPartsController();
        Parts_Order_List__c part = new Parts_Order_List__c();
        Test.startTest();
        for(Integer i = 0;i < 100;i++) {
            ControllerObj.getParts();
            ControllerObj.step1();
            ControllerObj.step2();
            ControllerObj.step3();
            ControllerObj.cancel();
            ControllerObj.parts.Name = 'Test';
            ControllerObj.parts.Part_Type__c = 'Decking';
            ControllerObj.save();
            apexPages.Currentpage().getParameters().put('Id',part.id);
        }
        Test.stopTest();
    }
    @IsTest
    public static void  PartsInvalidTest() {
        newPartsController ControllerObj = new newPartsController();
        Parts_Order_List__c part = new Parts_Order_List__c();
        try {
            ControllerObj.getParts();
            ControllerObj.step1();
            ControllerObj.step2();
            ControllerObj.step3();
            ControllerObj.cancel();
            ControllerObj.parts.Part_Type__c = null;
            ControllerObj.save();
            apexPages.Currentpage().getParameters().put('Id',part.id);
        } catch (Exception ex) {
            if (ex.getMessage().contains('Part_Type__c is blank')) {
                System.assert(true);
            }else {
                system.assert(false);
            }
        }
    }
    @isTest(SeeAllData=true)
    static void RestrictedUserTest(){
        newPartsController ControllerObj = new newPartsController();
        Parts_Order_List__c part = new Parts_Order_List__c();
        Profile p = [SELECT id FROM Profile WHERE Name='Director of Sales'];
        User u = new user(Alias = 'direct', Email='director@test.org', EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
        LocaleSidKey='en_US', ProfileId = p.Id, 
        TimeZoneSidKey='America/Los_Angeles', UserName='DirectorofSales@testorg.net');
        Test.startTest();
        System.runAs(u){
            ControllerObj.getParts();
            ControllerObj.step1();
            ControllerObj.step2();
            ControllerObj.step3();
            ControllerObj.cancel();
            ControllerObj.parts.Name = 'Deck';
            ControllerObj.parts.Part_Type__c = 'Decking';
            ControllerObj.save();
            apexPages.Currentpage().getParameters().put('Id',part.id);
            
        }
        Test.stopTest();
        
    }
}