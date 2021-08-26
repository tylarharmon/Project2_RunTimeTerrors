public with sharing class PartOrderEdit_CX {
    public static List<Parts_Order_List__c> Parts = new List<Parts_Order_List__c> ([SELECT Id, Name, Part_Type__c, Quantity__c, 
                                                                                    Supplier__c, Date_Ordered__c, Expected_Arrival_Date__c
                                                                                    FROM Parts_Order_List__c]);
    public static ApexPages.StandardSetController stdController {
        get {
            if(stdController == null) {
                stdController = new ApexPages.StandardSetController(Parts);
            }
            return stdController;
        }
        set;
    }
    public PartOrderEdit_CX(ApexPages.StandardSetController Controller) {
        stdController = Controller;
    }
    
    public PageReference listView() {
        return new ApexPages.Action('{!List}').invoke();
    }
    public PageReference cancel() {
        PageReference pr = new PageReference('/'+Schema.SObjectType.Parts_Order_List__c.getKeyPrefix());
        pr.setRedirect(true);
        return pr;
    }
}