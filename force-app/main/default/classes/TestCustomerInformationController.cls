@isTest
public class TestCustomerInformationController {
    @isTest static void testCustomer(){
       Customer__c cust = new Customer__c();
       cust.Last_Name__c = 'TestLastName';
        insert cust;
      
       
       
    }
    
    @IsTest static void testMethod1(){
       PageReference pageRef = Page.PreApproval1;

      Test.setCurrentPage(pageRef);

CustomerInformationController controller = new CustomerInformationController();
controller.Step1();
 }
   
    @IsTest static void testMethod2(){
       PageReference pageRef = Page.PreApproval2;

      Test.setCurrentPage(pageRef);

CustomerInformationController controller = new CustomerInformationController();
controller.Step2();
 }
    @IsTest static void testMethod3(){
       PageReference pageRef = Page.PreApproval1;

      Test.setCurrentPage(pageRef);

CustomerInformationController controller = new CustomerInformationController();
controller.Step3();
 } 
   
     @IsTest static void testMethod4(){
       PageReference pageRef = Page.CustomerPage;
      Test.setCurrentPage(pageRef);

CustomerInformationController controller = new CustomerInformationController();
controller.cancel();
 }
        @IsTest static void testMethod5(){
       PageReference pageRef = Page.CustomerPage;
      Test.setCurrentPage(pageRef);
       

CustomerInformationController controller = new CustomerInformationController();
controller.save();
 }
         @IsTest static void testMethod6(){
       PageReference pageRef = Page.CustomerPage;
      Test.setCurrentPage(pageRef);

CustomerInformationController controller = new CustomerInformationController();
controller.Begin();
         }  
}