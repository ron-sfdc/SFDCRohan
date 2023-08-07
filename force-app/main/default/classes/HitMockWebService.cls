public class HitMockWebService {
    public void method1() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.postalpincode.in/postoffice/New Delhi');
        req.setMethod('GET');
        req.setHeader('Content-Type','text/html');
        Http h = new Http();
        HttpResponse res = h.send(req);
        System.debug('### res : '+res.getBody());
        System.debug('### res : '+res.getStatusCode());
        
    }
}