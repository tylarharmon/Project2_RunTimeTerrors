public class BoatSoldController {
    
    // This member variable maintain the state of the wizard.
   // When users enter data into the wizard, their input is stored
   // in these variables. 
   public Boat_Sold__c boatsold;
   Integer boattype;

   public Pagereference boat1() {
        boattype = 1;
        return Page.CreateBoat;
    }
   
   public Pagereference boat2() {
        boattype = 2;
        return Page.CreateBoat;
    }

    public Pagereference boat3() {
        boattype = 3;
        return Page.CreateBoat;
    }

    public Pagereference boat4() {
        boattype = 4;
        return Page.CreateBoat;
    }

    public Pagereference boat5() {
        boattype = 5;
        return Page.CreateBoat;
    }

    public Pagereference boat6() {
        boattype = 6;
        return Page.CreateBoat;
    }


   
   // This method returns filled out data for one picklist
   public Boat_Sold__c getBoatSold() {
      if(boatsold == null) boatsold = new Boat_Sold__c();
      switch on boattype {
          when 1 {
              boatsold.Boat_Type_Inshore__c = 'Bay';
          }
          when 2 {
              boatsold.Boat_Type_Inshore__c = 'Center Console';
          }
          when 3 {
            boatsold.Boat_Type_Inshore__c = 'Flats';
          }
          when 4 {
            boatsold.Boat_Type_Offshore__c = 'Center Console';
          } 
          when 5 {
            boatsold.Boat_Type_Offshore__c = 'Convertible';
          } 
          when 6 {
            boatsold.Boat_Type_Offshore__c = 'Walkaround';
          }
          
      }
      return boatsold;
   }
    
   // This method cancels the wizard, and returns the user to the 
   // Boat_Sold Page
    public PageReference cancel() {
      PageReference boatPage = new PageReference('/'+ Schema.SObjectType.Boat_Sold__c.getKeyPrefix());
      boatPage.setRedirect(true);
      return boatPage; 
    }

   // This method performs save for the Boat_Sold, and
   // then returns the user to the Boat_Sold Home page.
   public PageReference save() {
        insert boatsold;
       
        PageReference boatPage = new PageReference('/'+ Schema.SObjectType.Boat_Sold__c.getKeyPrefix());
        boatPage.setRedirect(true);

        return boatPage;
    }
    
    public PageReference Bayinshore() {
        return Page.Bayinshore;
    }
     
    public PageReference Centerinshore() {
        return Page.Centerinshore;
    }    
    
    public PageReference Flatinshore() {
        return Page.Flatinshore;
    }
     
    public PageReference Centeroffshore() {
        return Page.Centeroffshore;
    }
    
    public PageReference Convertibleoffshore() {
        return Page.Convertibleoffshore;
    }
    
    public PageReference Walkaroundoffshore() {
        return Page.Walkaroundoffshore;
    }
}