global class ScheduleBatchAccDescUpdate implements Schedulable {
    
    global void execute(SchedulableContext sc)
    {
        //Inoke Batch Class....
        BatchAccountDescriptionUpdate bc = new BatchAccountDescriptionUpdate();
        Database.executeBatch(bc, 2);
    }
    
}