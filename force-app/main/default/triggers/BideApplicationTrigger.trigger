trigger BideApplicationTrigger on Bids_Application__c (before insert, before update) {
    
    set<Id> tendIdSet = new  set<Id>();
    
    for(Bids_Application__c objBidApp: trigger.new){
        if(objBidApp.Tender_Application__c != null){
            tendIdSet.add(objBidApp.Tender_Application__c);   
        }
        
    }
    Map<Id,Tender_Application__c> tendMap = new  Map<Id,Tender_Application__c>();
    if(!tendIdSet.isEmpty()){
        for(Tender_Application__c objTend:[select id,(select id from Bids_Applications__r) from Tender_Application__c where Id IN:tendIdSet ]){
            tendMap.put(objTend.Id, objTend);
        }
    }
    if(!tendMap.isEmpty()){
        for(Bids_Application__c objBidApp: trigger.new){
            if(tendMap.containsKey(objBidApp.Tender_Application__c)){
                if(tendMap.get(objBidApp.Tender_Application__c).Bids_Applications__r.size()>0){
                    objBidApp.addError('Only one Record is Allowed');
                } 
            }
        }
        
    }
}