@isTest
public class DelCustEmailsTest {
    Public static void test(){
    }
    @isTest static void testGetWeekTrue()    {
        //Insert acct with 
         Account acct1 = new Account(); 
         acct1.Name = 'test1';
         acct1.Delinquent_Customer__c = true; 
         Insert acct1; 
        
        
        //Insert cont 
        Contact myContact = new Contact(); 
        myContact.LastName = 'test'; 
        myContact.Email = 'test@test.com'; 
        myContact.AccountId = acct1.Id; 
        myContact.FirstName = 'test'; 
        Insert myContact;
   
   
        //Call class and then method to test if it works 
        DelCustEmails.getWeek(); 
            

    }
        @isTest static void testGetWeekFalse()    {
        //Insert acct with 
         Account acct1 = new Account(); 
         acct1.Name = 'test1';
         acct1.Delinquent_Customer__c = false; 
         Insert acct1; 
        
        //Insert cont 
        Contact myContact = new Contact(); 
        myContact.LastName = 'test'; 
        myContact.Email = 'test@test.com'; 
        myContact.AccountId = acct1.Id; 
        myContact.FirstName = 'test'; 
        Insert myContact;
   
   

        DelCustEmails.getWeek(); 
            

    }
}