@isTest
public class BideApplicationTriggerTest {
   
    
    public static TestMethod void BideApplicationTrigger1(){
         try{
        Tender_Application__c objTend= new Tender_Application__c(Account__c= '0015i00000OX5C6' );
        insert objTend;
        
       // string actualAccount =[select Account__c from Tender_Application__c where Id=:objTend.Id ].Account__c;
       // system.assertEquals('0015i00000OX5C6AAL', actualAccount);
        
        
   Bids_Application__c objBids = new Bids_Application__c(Tender_Application__c=objTend.Id ,Contact__c='0035i00000CsqpQ', Account__c='0015i00000OX5C6');
   insert objBids;
        Bids_Application__c objBids1 = new Bids_Application__c(Tender_Application__c=objTend.Id ,Contact__c='0035i00000CsqpQ', Account__c='0015i00000OX5C6');
   insert objBids1;
        
       // String result= [select Tender_Application__c,Contact__c,Account__c from Bids_Application__c where Id =:objBids.Id].Tender_Application__c;
       // system.assertEquals(objTend.Id, result);
    }
               catch(Exception ex){
             boolean result = ex.getMessage().contains('Only one Record is Allowed ...!!') ? true : false;
             System.assertEquals(true, result);
             
         }

        
    }
        
    
    
}