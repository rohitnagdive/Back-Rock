public with sharing class BidApplicationProvider {
    @AuraEnabled
    public static List<Bids_Application__c>  getRecordBidApplication(Tender_Application__c objTend){
        try {
            Id tendId= [Select id, Title__c, Name from Tender_Application__c where Name=:objTend.Name LIMIT 1].Id;
            
            if(objTend != null){
                return [Select Id, Bidder_s_Name__c,Name, Bidder_Budget__c from Bids_Application__c where Tender_Application__c =:tendId];
            }
            else {
                return null;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}