public class basicHttpCallout {

    public static void methodForCallout()
    {
        Http h = new HTTP();
        HttpRequest hr = new HttpRequest();
        
        hr.setEndPoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        hr.setMethod('GET');
        
        HttpResponse res = h.send(hr);
        
        Map<String,object> jsonResponse = (Map<String,object>)json.deserializeUntyped(hr.getBody());
        
        system.debug(jsonResponse);
        
        
        
    }
}