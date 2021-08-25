public with sharing class newPartsController {
    //whenever a user enters data, its stored in these variables.
    public Parts_Order_List__c parts;

    public Parts_Order_List__c getParts() {
        if (parts == null) parts = new Parts_Order_List__c();
        return parts;
    }

    public PageReference step1() {
        return Page.partPage1;
    }

    public PageReference step2() {
        return Page.partPage2;
    }
    
    public PageReference step3() {
        return Page.partPage3;
    }

    public PageReference cancel() {
        PageReference pr = new PageReference('/'+Schema.SObjectType.Parts_Order_List__c.getKeyPrefix());
        pr.setRedirect(true);
        return pr;
    }
    public PageReference save() {
        try{
        insert parts;
        Pagereference partPage = new ApexPages.StandardController(parts).view();
        partPage.setRedirect(true);
        return partPage;
            }catch(Exception e){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, e.getMessage()));
            }
            return null;

    }
}