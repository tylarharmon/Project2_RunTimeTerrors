public with sharing class EmptyManufacturingDateController {
    public List<Boat_Manufacturing__c> boats{get; set;}
    public string boatId{get; set;}

    public EmptyManufacturingDateController(){
        List<Boat_Manufacturing__c> manufacturingList = Database.query(
            'SELECT Id, Name, Manufacturing_Start_Date__c '+
            'FROM Boat_Manufacturing__c '+
            'WHERE Manufacturing_Start_Date__c = null '
        );
        boats = manufacturingList;
    }

    public PageReference save(){
        List<Boat_Manufacturing__c> boatSave = new List<Boat_Manufacturing__c>();
        for(Boat_Manufacturing__c boat:boats){
            if(boat.id == boatId){
                boatSave.add(boat);
            }
        }
        try{
        update boatSave;
        }catch(Exception e){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, e.getMessage()));
        }
        return null;
    }

    public PageReference saveAll(){
        try{
            update boats;
            }catch(Exception e){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, e.getMessage()));
            }
        return null;
    }

    public PageReference clear(){
        for(Boat_Manufacturing__c boat:boats){
            if(boat.id == boatId){
                boat.Manufacturing_Start_Date__c = NULL;
            }
        }
        return null;
    }

    public PageReference clearAll(){
        for(Boat_Manufacturing__c boat:boats){
            boat.Manufacturing_Start_Date__c = NULL;
        }
        return null;
    }

    public Pagereference setAllToday(){
        for(Boat_Manufacturing__c boat:boats){
            boat.Manufacturing_Start_Date__c = System.today();
        }
        return null;
    }
}