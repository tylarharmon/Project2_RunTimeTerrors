@isTest
private class preApprovalController_test {
      static testMethod void runPositiveTestCases() {

        String actualLastName = '';
        final String testName = 'Test1';

        // set up user
        //User u1 = [SELECT Id FROM User WHERE Alias='THarm'];
          
          //System.RunAs(u1){

        // setup test by creating a customer record
        System.debug('Inserting 1 customer... (single record validation)');
        
        Customer__c testCustomer = new Customer__c(Last_Name__c='Test1');

        // test
        test.startTest();
        preApprovalController.saveCustomer(testCustomer);
        test.stopTest();
              
        // validate single insert
        for(Customer__c c:[SELECT Last_Name__c FROM Customer__c
            WHERE CreatedDate = TODAY
            //and CreatedById = :u1.id
            ]){
                actualLastName = c.Last_Name__c;
                System.debug('Actual Last Name: '+ c.Last_Name__c);
            }
        System.assertEquals(testName, actualLastName);
        //  }

        // dont need bulk test since the method only takes in one record and saves
        // one record at a time
        // Dont need negative case since the method has one path only        
    }

}