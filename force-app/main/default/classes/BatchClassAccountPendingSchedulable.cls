global class BatchClassAccountPendingSchedulable implements Schedulable {
    
    global void execute (SchedulableContext SC){
        Database.executeBatch(new BatchClassAccountPending());
        
    }
}