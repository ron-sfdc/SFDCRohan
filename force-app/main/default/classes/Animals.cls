public class Animals {
	
    @AuraEnabled
    public static string fetchAnimalNames() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:AnimalHitIntegration');
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        if(res.getStatusCode() == 200) {
            system.debug('### res : '+res.getBody());
        }
        return 'Rohan';
    }
    
    @AuraEnabled
    public static string fetchAnimalNames1() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        if(res.getStatusCode() == 200) {
            system.debug('### res : '+res.getBody());
        }
        return 'Rohan';
    }
    
    
}