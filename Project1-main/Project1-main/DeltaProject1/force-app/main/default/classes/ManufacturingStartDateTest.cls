@isTest
public class ManufacturingStartDateTest {
    static Integer numNull = 100; //number of records populated with null start dates
    static Integer notNull = 30; //number of records populated with non-null start dates

    @TestSetup
    static void makeData(){
        List<Boat_Manufacturing__c> boats = new List<Boat_Manufacturing__c>();
        for(Integer i=0; i<numNull; i++){
            boats.add(new Boat_Manufacturing__c(Name = 'NullDate', Manufacturing_Start_Date__c = Null));
        }
        for(Integer i=0; i<notNull; i++){
            boats.add(new Boat_Manufacturing__c(Name = 'NotNull', Manufacturing_Start_Date__c = System.today()));
        }
        insert boats;
    }
    @isTest
    static void testSOQL(){
        Test.startTest();
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();
        System.assertEquals(emdc.boats.size(), numNull);
        emdc.setAllToday();
        emdc.saveAll();
        System.assertEquals(emdc.boats[0].Manufacturing_Start_Date__c, System.today());
        Test.stopTest();
    }

    @isTest
    static void testSetAllToday(){
        Test.startTest();
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();
        emdc.setAllToday();
        for(Boat_Manufacturing__c boat:emdc.boats){
            System.assertEquals(boat.Manufacturing_Start_Date__c, System.today());
        }
        Test.stopTest();
    }

    @isTest
    static void testSaveAll(){
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();

        //checks saveAll for random number of edits
        Double randomNumber = Math.random(); 
        Integer arrayLength = emdc.boats.size(); 
        Integer randomNum = (randomNumber *(arrayLength-1)).intValue();
        Integer counter = 0;
        for(Boat_Manufacturing__c boat:emdc.boats){
            if(counter<randomNum){
                boat.Manufacturing_Start_Date__c = System.Today();
            }
            counter++;
        }
        emdc.saveAll();
        List<Boat_Manufacturing__c> updatedList = Database.Query('SELECT id '+
        'FROM Boat_Manufacturing__c '+
        'WHERE Manufacturing_Start_Date__c = null ');
        System.assertEquals(numNull-randomNum, updatedList.size());

        //chekc trigger validation for saveAll
        Test.startTest();
        getRanBoat(emdc.boats).Manufacturing_Start_Date__c = Date.newInstance(2021, 12, 25);
        List<Apexpages.Message> msgs;
        emdc.saveAll();
        msgs = ApexPages.getMessages();
        System.assert(ApexPages.hasMessages());
        boolean b = false;
        for(Apexpages.Message msg:msgs){
            if (msg.getDetail().contains('Boat manufacturing start date cannot be scheduled on a holiday')) b = true;
        }
        system.assert(b);//Assert the Page Message was Properly Displayed
        Test.stopTest();
    }

    @isTest
    static void testSave(){
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController(); 

        emdc.setAllToday();
        emdc.boatId = getRanBoat(emdc.boats).id;
        emdc.save();
        Integer count = 0;
        for(Boat_Manufacturing__c boat:emdc.boats){
            if(boat.Manufacturing_Start_Date__c != Null){
                count++;
            }
        }
        List<Boat_Manufacturing__c> updatedList = Database.Query('SELECT id '+
        'FROM Boat_Manufacturing__c '+
        'WHERE Manufacturing_Start_Date__c = null ');
        System.assertEquals(numNull-1, updatedList.size());

        Test.startTest();
        getRanBoat(emdc.boats).Manufacturing_Start_Date__c = Date.newInstance(2021, 12, 25);
        List<Apexpages.Message> msgs;
        for(Boat_Manufacturing__c boat:emdc.boats){
            if(boat.Manufacturing_Start_Date__c == Date.newInstance(2021, 12, 25)){
                emdc.boatId = boat.id;
            }
        }
        emdc.save();
        msgs = ApexPages.getMessages();
        System.assert(ApexPages.hasMessages());
        boolean b = false;
        for(Apexpages.Message msg:msgs){
            if (msg.getDetail().contains('Boat manufacturing start date cannot be scheduled on a holiday')) b = true;
        }
        system.assert(b);//Assert the Page Message was Properly Displayed
        Test.stopTest();
    }

    @isTest
    static void testClearMethods(){
        Pagereference currentPage = Page.EmptyManufacturingDatePage;
        Test.setCurrentPage(currentPage);
        EmptyManufacturingDateController emdc = new EmptyManufacturingDateController();
        emdc.setAllToday();
        emdc.boatId = getRanBoat(emdc.boats).id;
        emdc.clear();
        Integer count = 0;
        for(Boat_Manufacturing__c boat:emdc.boats){
            if(boat.Manufacturing_Start_Date__c == NULL){
                count++;
            }
        }
        system.assertEquals(1, count);
        emdc.clearAll();
        for(Boat_Manufacturing__c boat:emdc.boats){
            if(boat.Manufacturing_Start_Date__c != NULL){
                count++;
            }
        }
        system.assertEquals(1, count);
    }

    static Boat_Manufacturing__c getRanBoat(List<Boat_Manufacturing__c> input){
        Double randomNumber = Math.random(); 
        Integer arrayLength = input.size(); 
        Integer randomIndex = (randomNumber *(arrayLength-1)).intValue();
        return input[randomIndex];
    }
}