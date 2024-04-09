global class BatchClassAccountPending implements  Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select id, Approval_Status__c,CreatedDate from Account where Approval_Status__c=\'Pending\'  ');
        
    }
    global void execute (Database.BatchableContext BC, List<Account> accList){
        if(!accList.isEmpty()){
            for(Account objAcc: accList){
                objAcc.Approval_Status__c= 'Rejected';
                
            }
            Database.update(accList,false);
            
        }
        
    }
    global void finish(Database.BatchableContext BC){
        
    }

}