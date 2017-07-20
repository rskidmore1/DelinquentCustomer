@isTest


public class DelCustTextTest {
    Public static void test(){
    }
    @isTest static void testSendTextTrue()    {
        smagicinteract__SMS_Template__c temp = new smagicinteract__SMS_Template__c(); 
        temp.smagicinteract__Name__c = 'Delinquent Customer'; 
        temp.smagicinteract__Text__c = 'heres some great stuff'; 
       
        Insert temp; 
        
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
        DelCustText.sendText(); 
            

    }
        @isTest static void testSendTextFalse()    {
        smagicinteract__SMS_Template__c temp = new smagicinteract__SMS_Template__c(); 
        temp.smagicinteract__Name__c = 'Delinquent Customer'; 
        temp.smagicinteract__Text__c = 'heres some great stuff'; 
       
        Insert temp; 
            
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
   
   

       DelCustText.sendText(); 
            

    }

}