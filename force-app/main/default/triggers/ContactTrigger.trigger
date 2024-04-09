trigger ContactTrigger on Contact (before insert) {
    
    set<Id> accId= new set<Id>();
    List<Contact> conList = [Select id, Name,AccountId, RecordType.Name FROM Contact WHERE recordtypeid in (Select Id From RecordType where sobjecttype = 'Contact' and DeveloperName IN ('Tender_Partner'))];
    for(Contact objCon : conList){
        accId.add(objCon.AccountId);
    }
    Map<Id,Account> accMap = new Map<Id,Account>();
    if(!accId.isEmpty()){
        for(Account objAcc : [Select Id,(Select Id From Contacts) From Account Where Id IN : accId]){
            accMap.put(objAcc.Id,objAcc);
        }
        
    }
     for(Contact objCon : trigger.new){
        if(accMap.containskey(objCon.AccountId) && objCon.RecordTypeId == '0125i000001Rw2f' && accMap.get(objCon.AccountId).Contacts.size() > 0)
            objCon.addError('Cannot create more than one Contact of Record Type Tender Partner per Account...!! ');
    }
}