/*
URL : https://ronushi-dev-ed.develop.my.salesforce.com/services/apexrest/v1/Welcome/
*/

@RestResource(urlMapping='/v1/Welcome/*')
global class WelcomeClass {
	global final static String message = 'Hello Rohan Welcome';
    
    @httpGet
    global static String sendMessage() {
        return JSON.serialize(message) ;
    }
}