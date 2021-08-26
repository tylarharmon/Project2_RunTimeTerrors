public with sharing class Supplier_CC {

    //Search bar functionailty plus implementation of Supplier data query 
    //getter and setter of search text
    public String SearchText{
        get{
            return SearchText;
        }
        Set{
            SearchText = value;
         }
    }

    //getter and setter of searched and the apexpage instant
    public Boolean Searched {get;set;}
    public Apexpages.StandardSetController setSup {get;set;}

    //default set searched = to flase
    public Supplier_CC(){
        searched=false;
    }
    //defualt view screen shows all records orignially set in the "Else" statement below. Once setSup isnt null after search it gets the records searched.
    public List<Supplier__c> Supple {
        get{
            if(setSup != null){
                return (List<Supplier__c>)setSup.getRecords();
            }
            else{
                List<Supplier__c> Supple = [SELECT Name, Phone__c, Website__c, Region__c, CreatedById FROM Supplier__c];

                //Iteration to see if values are left blank in order to populate
        
                for(Supplier__c SP : Supple){
                    if(SP.Phone__c == null){
                        SP.Phone__c = 'Not Provided';
                    }if (SP.Website__c == null){
                        SP.Website__c = 'google.com/search?q=' + SP.Name;
                    }if (SP.Region__c == null){
                        SP.Region__c = 'Not Provided';
                    }
                }
                //return the list for VF page to read
        
                return Supple;
            }
        }
        set;
    }
    //search button method
    public void Search(){
        //if you are acutally searching something
        if (String.isNotBlank(searchText) && searchtext.length() > 1){
            //add in the wildcard 
            if (!searchText.endsWith('*')) {
                searchText = searchText + '*';
            }
            //commence the actual search binded to :searchText
            List<Supplier__c> Supple1 = [FIND :searchText
                                        IN ALL FIELDS
                                        RETURNING Supplier__c (Name, Phone__c, Website__c, Region__c, CreatedById)][0];
            //another fill in the blanks feature implemented above to let the search include the values below
            for(Supplier__c SP : Supple1){
                if(SP.Phone__c == null){
                    SP.Phone__c = 'Not Provided';
                }if (SP.Website__c == null){
                    SP.Website__c = 'google.com/search?q=' + SP.Name;
                }if (SP.Region__c == null){
                    SP.Region__c = 'Not Provided';

            }
            }
            //reinstatiate the setSup variable and set searched = true
            setSup = new ApexPages.StandardSetController(Supple1);

            Searched = True;
            //display an error message if characters is not long enough to search

        } else{
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,
                       'Please enter search text at least two characters long'));

        }
    }
}