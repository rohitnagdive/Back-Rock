trigger AccountTrigger on Account (before update) {
    
    for(Account objAcc: trigger.new){
        if((objAcc.Approval_Status__c== 'Pending' || objAcc.Approval_Status__c== 'Approved') && trigger.oldMap.get(objAcc.Id).Approval_Status__c=='Rejected' ){
            objAcc.addError('Cannot Change Status Once it gets Rejected');
        }
        
    }

}