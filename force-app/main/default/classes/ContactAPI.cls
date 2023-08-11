@RestResource(urlMapping='/ContactAPI/*')
global with sharing class ContactAPI {
    
    //Get Method
    @HTTPGet
    global static List<Contact> getLstOfContacts() {
        List<Contact> lstOfContactsToBeReturned = new List<Contact>();
        RestRequest req = RestContext.request;
        String uriAddress = req.requestURI;
        String soqlLimit = uriAddress.substring(uriAddress.lastindexOf('/')+1);
        String query = 'SELECT FIELDS(STANDARD) FROM Contact LIMIT '+soqlLimit;
        lstOfContactsToBeReturned = Database.query(query);       
        return lstOfContactsToBeReturned;
    }
}