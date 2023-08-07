@RestResource(urlMapping='/v1/Class_29_1/*')
global class Class_29_1 {
	
    @httpGet
    global static ReturnWrapper sendMessage() {
        RestRequest req = RestContext.request;
        string accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> lstOfAccount = [SELECT Id, name from Account where id =:accId];
        ReturnWrapper ret = new ReturnWrapper();
        if(!lstOfAccount.isEmpty()) {
            List<Case> lstOfCases = [SELECT Id, subject FROM Case WHERE AccountId =: lstOfAccount[0].Id];
            List<Contact> lstOfContacts = [SELECT Id, name FROM Contact WHERE AccountId =: lstOfAccount[0].Id];
            ret.acc = lstOfAccount[0];
            ret.con = lstOfContacts[0];
            ret.cs = lstOfCases[0];
            return ret;
        }
        return ret;
    }
    
    global class ReturnWrapper {
        global Account acc;
        global Contact con;
        global Case cs;
        
    }
}