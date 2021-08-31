public with sharing class PartOrderEdit_CX {
    
    @AuraEnabled
    public static List<Parts_Order_List__c> orderedParts() {
    	List<Parts_Order_List__c> Parts = new List<Parts_Order_List__c>([SELECT Id, Name, Part_Type__c, Quantity__c, Supplier__c, Date_Ordered__c, Expected_Arrival_Date__c FROM Parts_Order_List__c]);
      return Parts;  
    }
    /*
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
    
    
    public PageReference cancel() {
        PageReference pr = new PageReference('/'+Schema.SObjectType.Parts_Order_List__c.getKeyPrefix());
        pr.setRedirect(true);
        return pr;
    }
*/
    
    @AuraEnabled 
    Public static Parts_Order_List__c savePartsOrder(Parts_Order_List__c order){
        insert order;
        return order;
    }
    
    @AuraEnabled
    public static List<String> getPartType() {
        List<String> pickListValuesList = new List<String>();
        Schema.DescribeFieldResult fieldResult = Parts_Order_List__c.Part_Type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
            System.debug('Values in Rating are: '+pickListValuesList);
        }     
        return pickListValuesList;
    }
        
    }
