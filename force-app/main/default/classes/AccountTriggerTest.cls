@isTest
public class AccountTriggerTest {
    
    @isTest
    public static void StatusAcceptedRejectedMethod(){
        try{
            
            Account objAcc= new Account(Name= 'Cinemax', Approval_Status__c= 'Rejected');
            Database.insert(objAcc,false);
            
            Account objAcc1= [Select id, Name, Approval_Status__c from Account where Id=:objAcc.Id];
            objAcc1.Approval_Status__c='Pending' ;
            update objAcc1;
            Account objAcc2= [Select id, Name, Approval_Status__c from Account where Id=:objAcc.Id];
            objAcc2.Approval_Status__c='Approved' ;
            update objAcc2;
        }
        catch(Exception ex){
            boolean result = ex.getMessage().contains('Can not change the Status Field') ? true : false;
            System.assertEquals(true, result);
            
        }
        
        
    }
}