public with sharing class TenderApplicationProvider {
    @AuraEnabled
    public static string createTenderApplicationRecord(Tender_Application__c objTenderApplication){
        try {
            if(objTenderApplication != null){
                insert objTenderApplication;
                return 'Record has been Created Successfully';

            }
            else{
                return 'Locha';
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}