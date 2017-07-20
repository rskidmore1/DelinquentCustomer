@istest 
public class TestscheduleDelCustText {
    static testmethod void test(){
        Test.startTest(); 
            scheduleDelCustText dt = new scheduleDelCustText(); 
            String sch = '0 0 23 * * ?'; system.schedule('Test Del Cust Email', sch, dt);
        Test.stopTest(); 
    }

}