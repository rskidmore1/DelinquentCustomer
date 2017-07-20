public class DelCustText {
    //This works in Exec Console in Production. API key in San Box isn't set up. 
    public static void sendText(){
		List <smagicinteract__smsmagic__c> smsObjectList = new List <smagicinteract__smsmagic__c>(); //creates new list of texts to send 
        List<Contact> myCont = [SELECT Id, Email, FirstName, Phone, Account.Delinquent_Customer__c FROM Contact WHERE Account.Delinquent_Customer__c = true]; //Get from account with a delinquent cust Id, email, firstName,  phone, Account.Delinquent_Customer__c

        for(Contact cont : myCont)        {
			String senderId = 'Carmine'; //sets name if available. I think. 
			smagicinteract__SMS_Template__c templateText = [SELECT smagicinteract__Name__c, smagicinteract__Text__c FROM smagicinteract__SMS_Template__c WHERE smagicinteract__Name__c = 'Delinquent Customer'];  // selects text template based on name 
			smagicinteract__smsMagic__c smsObject = new smagicinteract__smsMagic__c(); //creates new text object to send text
			smsObject.smagicinteract__SenderId__c = senderId; //Sets sender Id
			smsObject.smagicinteract__PhoneNumber__c = cont.Phone; //Sets phone to phone from contact instead of mobile 
			smsObject.smagicinteract__Name__c = cont.FirstName; // records name
			smsObject.smagicinteract__ObjectType__c = 'Contact'; // record type
			smsObject.smagicinteract__disableSMSOnTrigger__c = 0; // this field either be 0 or 1, if you specify the value as 1 then sms will not get send but entry of sms will get create under SMS History object
			smsObject.smagicinteract__external_field__c = smagicinteract.ApexAPI.generateUniqueKey();
			smsObject.smagicinteract__SMSText__c = templateText.smagicinteract__Text__c; //Sets text template 
			smsObjectList.add(smsObject); //Adds sms object to list 
        } 
		Database.insert(smsObjectList,false); //Inserts list into sfdc

    }
    
}