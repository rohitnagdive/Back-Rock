@isTest
public class BatchClassAccountPendingTest {
  
    @isTest
    public static void AccountPendindTest(){
        List<Account> accList= new List<Account>();
        for(Integer i=1; i<=200; i++){
            Account objAcc= new Account(Name= 'Cinemax'+i, Approval_Status__c='Pending');
            accList.add(objAcc);
        }
        if(!accList.isEmpty()){
            Database.insert(accList,false);
            
        }
        Test.startTest();
        Database.executeBatch(new BatchClassAccountPending(),200);
        Test.stopTest();
	
        List<Account> accResult=[select Id,Approval_Status__c from Account where Approval_Status__c='Rejected' ];
        system.assertEquals(200, accResult.size());
		        
    }

}