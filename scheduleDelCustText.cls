global class scheduleDelCustText implements Schedulable {
    global void execute(SchedulableContext SC){
        DelCustText.sendText(); 
    }
}