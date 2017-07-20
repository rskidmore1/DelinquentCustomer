public class DelCustEmails {
    public static void getWeek(){

      List<Account> delcust = [SELECT Id, Name, Delinquent_Customer__c FROM Account WHERE Delinquent_Customer__c = true]; //Looks for Del Cust field true and gets all other fields she needs. Love that gal
      OrgWideEmailAddress email = [SELECT Id, DisplayName FROM OrgWideEmailAddress WHERE DisplayName = 'Carmine Customer Support']; 
        
        

      //Selecting template 
      Double rand = Math.random(); //Generate rand between .0 and 1.0 to pick email template 
      EmailTemplate temp; //Stores email template from if else 
      if (rand < .25){ //Select 1 of 4 email temp to send that week by rand value 
        temp = [select id, name, body, subject from EmailTemplate where name = 'Delinquent Week 1']; 

     } else if ( rand < .5 ){
        temp = [select id, name, body,  subject from EmailTemplate where name = 'Delinquent Week 2'];
     } else if (rand < .75){
        temp = [select id, name, body, subject from EmailTemplate where name = 'Delinquent Week 3'];
     } else{
        temp = [select id, name, body, subject from EmailTemplate where name = 'Delinquent Week 4'];
     }

      //String temp; 

      List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>(); //Creates mail List 
      List<Contact> myCont = [SELECT Id, Email, FirstName, Account.Name, Account.Delinquent_Customer__c FROM Contact WHERE Account.Delinquent_Customer__c = true]; //Gets all Contacts on an Account that has del cust 
      for (Contact myContact : myCont) {

      

      // Step 1: Create a new Email
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); //Another mail thing

    
      // Step 2: Set list of people who should get the email
      List<String> sendTo = new List<String>(); //Create List of strings that email addresses will go into
      sendTo.add(myContact.Email); //Add emails to sendTo list 
      mail.setToAddresses(sendTo); //Adds email addresses to mail List 
    
      // Step 3: Set who the email is sent from
      mail.setOrgWideEmailAddressId(email.Id);  //Sets reply to address 
     //Sets sender name 
       
    

      // Step 4. Set email contents - you can use variables! //-Place template stuff here  
      mail.setTargetObjectId(myContact.Id); //Set Id of object that other fields 
      
      mail.setTemplateId(temp.Id); //Sets template Id
      mail.setHtmlBody(temp.Body); //Sets email body
      mail.setSubject(temp.Subject);
      // Step 5. Add your email to the master list

      mails.add(mail); //Add small mail list to larger one 

         }
         
    
    
   
    // Step 6: Send all emails in the master list
    Messaging.sendEmail(mails); //Sends messages 
    
   
    
    }
}