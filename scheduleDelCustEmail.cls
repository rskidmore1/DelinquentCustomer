global class scheduleDelCustEmail implements Schedulable {
    global void execute(SchedulableContext SC){
         DelCustEmails.getWeek(); 
    }
}