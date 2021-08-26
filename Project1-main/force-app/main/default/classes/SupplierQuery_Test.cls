@IsTest
Private class SupplierQuery_Test {
    @IsTest
    public static void SearchTest() {
        //insert a Supplier part with blank spots 

        Supplier__c InSupplier = new Supplier__c();
        InSupplier.Name = 'Blank Test Name';
        InSupplier.Phone__c = null;
        InSupplier.Website__c = null;
        Insupplier.region__c = null;
        insert InSupplier;

        //Retrieve that supplier part which was created ^
        Supplier__c Sup = [SELECT Name, Phone__c, Region__c, Website__c FROM Supplier__c WHERE Phone__c = null AND region__c= null AND Website__c = null LIMIT 1];
        List<Supplier__c> testSupList = [SELECT Name, Phone__c, Website__c, Region__c FROM Supplier__c WHERE Name =:Sup.Name];

        Test.startTest();

        Pagereference pr = Page.SupplierQuery;
        test.setCurrentPageReference(pr);

        Apexpages.currentPage().getParameters().put('Name', Sup.Name);

        Id [] fixedsearchresults = new Id[1];
        fixedsearchresults[0] = sup.Id;
        Test.setFixedSearchResults(fixedsearchresults);

        
        Supplier_CC SCC = new Supplier_CC();

        SCC.Search();
        system.assertEquals(1, testSupList.size());
        test.stopTest();

    }
   @Istest
   public static void FillInBlanksTest(){
       
       Supplier__c SUP123 = new Supplier__c();
       SUP123.name = 'Blank Name1';
       SUP123.Phone__c = null;
       SUP123.Website__c = null;
       SUP123.Region__c = null;

       insert SUP123;
       Supplier_CC sc1 = new Supplier_CC();
       System.assertEquals(1,sc1.Supple.size());
       

   }
   @IsTest 
   public static void testSampleSearch1(){
       test.startTest();
       Supplier__c Supp = new Supplier__c();
       Supp.Name = 'Blank Test Name Again';
       Supp.Phone__c = null;
       Supp.Website__c = null;
       Supp.Region__c = null;
       insert Supp;

       Pagereference pageRef = Page.SupplierQuery;
       Test.setCurrentPage(pageRef);

       Supplier_CC myclass = new Supplier_CC();
       myclass.SearchText = 'Blank Test Name*';
       myclass.search();
    
       test.stopTest();
   }
}
