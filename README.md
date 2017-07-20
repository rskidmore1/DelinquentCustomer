Delinquent Customer sends text and emails to customers who have fallen behind on their payment AND are not responding Customer Service's calls, text, or email. 
The script is deactivated once the customer responses.

HOW IT WORKS:
1. "Delinquent Customer" Field is marked True in Accounts object in customers account. 
2. Apex Scheduler marks that customer for the DelCustEmails class and DelCustText class to run for that customer 
3. Script sends them an email and text Monday, Wednesday, and Friday. 
4. When the customer responds the "Delinuqent Customer" field is marked False

Several customer have responded and resolved their delinquencies. 

DOES IT WORK:
Yes. It has been running in our Salesforce Instance for several months with no issue
It was developed in the Salesforce Developer Console and deployed to our production Salesforce Instance with sufficent code coverage.



DISCLAIMER:
SCRIPTS ARE INTENDED TO DEMONSTRATE MY CODING SKILLS IN SALESFORCE AND APEX. 


LICENSE: 
NO EXPLICIT OR IMPLICIT PERMISSION IS GIVEN ANY PERSON, GROUP, OR ORGANIZATION TO USE ANY OF THIS MATERIAL FOR ANY BUSINESS OR PERSONAL REASON UNRELATED TO MYSELF WITHOUT WRITTEN PERMISSION. 
# DelinquentCustomer
