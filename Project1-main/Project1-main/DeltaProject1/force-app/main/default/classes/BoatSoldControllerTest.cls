@isTest
public class BoatSoldControllerTest {

    //  Boat_Sold__c b = new Boat_Sold__c(Name= 'Boat1', Source__c='Web',  
    //   Works__c='Gen Repairs', S);
    //   insert b;
       
 //    Test.StartTest();
 //       pageRef.getParameters().put('Id', String.valueOf(b.Id));
  //System.assertEquals(null, pg); //assertion
    
    @isTest public static void BayBoat1Test(){
       
     PageReference pageRef = Page.Bayinshore;
     //   Test.setCurrentPage(pageRef);
              
     BoatSoldController cntr = new BoatSoldController();
     PageReference pg = cntr.Bayinshore();
     System.assertNotEquals(null, pg); 
    }

    @isTest public static void CenterinshoreBoat1test(){
       
        PageReference pageRef = Page.Centerinshore;
        //   Test.setCurrentPage(pageRef);
                 
        BoatSoldController cntr = new BoatSoldController();
          PageReference pg = cntr.Centerinshore();
          System.assertNotEquals(null, pg); //assertion
       }

       @isTest public static void FlatinshoreBoat1test(){
       
         PageReference pageRef = Page.Flatinshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
           PageReference pg = cntr.Flatinshore();
           System.assertNotEquals(null, pg); //assertion
        }
        @isTest public static void CenteroffshoreBoat1test(){
       
         PageReference pageRef = Page.Centeroffshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
           PageReference pg = cntr.Centeroffshore();
           System.assertNotEquals(null, pg); //assertion
        }
        @isTest public static void ConvertibleoffshoreBoat1test(){
       
         PageReference pageRef = Page.Convertibleoffshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
           PageReference pg = cntr.Convertibleoffshore();
           System.assertNotEquals(null, pg); //assertion
        }
        @isTest public static void WalkaroundoffshoreBoat1test(){
       
         PageReference pageRef = Page.Walkaroundoffshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
           PageReference pg = cntr.Walkaroundoffshore();
           System.assertNotEquals(null, pg); //assertion
        }

        @isTest public static void BayBoat2Test(){
       
         PageReference pageRef = Page.Bayinshore;
         //   Test.setCurrentPage(pageRef);
                  
         BoatSoldController cntr = new BoatSoldController();
         PageReference pf = cntr.Bayinshore();
         PageReference pg = cntr.boat1();
         System.assertNotEquals(null, pg); 
        }
     
        @isTest public static void CenterinshoreBoat2test(){
           
            PageReference pageRef = Page.Centerinshore;
            //   Test.setCurrentPage(pageRef);
                     
            BoatSoldController cntr = new BoatSoldController();
              PageReference pf = cntr.Centerinshore();
              PageReference pg = cntr.boat2();
              System.assertNotEquals(null, pg); //assertion
           }
     
           @isTest public static void FlatinshoreBoat2test(){
           
             PageReference pageRef = Page.Flatinshore;
             //   Test.setCurrentPage(pageRef);
                      
             BoatSoldController cntr = new BoatSoldController();
               PageReference pf = cntr.Flatinshore();
               PageReference pg = cntr.boat3();
               System.assertNotEquals(null, pg); //assertion
            }
            @isTest public static void CenteroffshoreBoat2test(){
           
             PageReference pageRef = Page.Centeroffshore;
             //   Test.setCurrentPage(pageRef);
                      
             BoatSoldController cntr = new BoatSoldController();
               PageReference pf = cntr.Centeroffshore();
               PageReference pg = cntr.boat4();
               System.assertNotEquals(null, pg); //assertion
            }
            @isTest public static void ConvertibleoffshoreBoat2test(){
           
             PageReference pageRef = Page.Convertibleoffshore;
             //   Test.setCurrentPage(pageRef);
                      
             BoatSoldController cntr = new BoatSoldController();
               PageReference pf = cntr.Convertibleoffshore();
               PageReference pg = cntr.boat5();
               System.assertNotEquals(null, pg); //assertion
            }
            @isTest public static void WalkaroundoffshoreBoat2test(){
           
             PageReference pageRef = Page.Walkaroundoffshore;
             //   Test.setCurrentPage(pageRef);
                      
             BoatSoldController cntr = new BoatSoldController();
               PageReference pf = cntr.Walkaroundoffshore();
               PageReference pg = cntr.boat6();
               System.assertNotEquals(null, pg); //assertion
            }

            @isTest public static void WalkaroundoffshoreBoatCanceltest(){
           
               PageReference pageRef = Page.Walkaroundoffshore;
               //   Test.setCurrentPage(pageRef);
                        
               BoatSoldController cntr = new BoatSoldController();
                 PageReference pf = cntr.Walkaroundoffshore();
                 PageReference pg = cntr.boat6();
                 Pagereference pb = cntr.cancel();
                 System.assertNotEquals(null, pb); //assertion
              }
              @isTest public static void WalkaroundoffshoreBoatSavetest(){
           
               PageReference pageRef = Page.Walkaroundoffshore;
               //   Test.setCurrentPage(pageRef);
               //Customer__c c1 = [SELECT ID,NAME FROM CUSTOMER__C LIMIT 1];
               BoatSoldController cntr = new BoatSoldController();
                 PageReference pf = cntr.Walkaroundoffshore();
                 PageReference pg = cntr.boat6();
                 //cntr.boatsold(new Boat_Sold__c(name='dave'));
                 cntr.boatsold = new Boat_Sold__c();
                 cntr.boatsold.name = 'dave';
                 cntr.boatsold.Email_of_Customer__c = 'dws@gmail.com';
                 cntr.boatsold.Price_of_Boat__c = 45000;
                 cntr.boatsold.Sold_to__c = 'a025e000007BTe6AAG';
                 cntr.boatsold.Date_Sold__c = System.today();
                 cntr.getboatsold();
                 Pagereference pb = cntr.save();
                 System.assertNotEquals(null, pb); //assertion
              }

}