public class showTenderApplicationInfoVF_CX {

    public Tender_Application__c objTend {get;set;}
    public showTenderApplicationInfoVF_CX(ApexPages.StandardController controller) {

        String tendId= ApexPages.currentPage().getParameters().get('tendId');
        system.debug('Recevied tendId =' +tendId);
        objTend = [select Id, Account__c,Title__c,Start_Date__c,Close_Date__c,Approved_Bid_Applicantion__c,Category__c,Computer_Device_Name__c,Electrical_Device_Name__c,Electronics_Device_Name__c,Mechanical_Device_Name__c,Budget__c,Minimum_Bid__c,Maximum_Bid__c,Sum_of_Bidder_Budget__c,Total_Bid_Application__c from Tender_Application__c where Id=: tendId];
    }
    

}