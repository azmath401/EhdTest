@isTest
global  class ShowWeatherMockup implements HttpCalloutMock 
{
    global HttpResponse respond(HttpRequest req)
    {
        HttpResponse resp = new HttpResponse();
        resp.setBody('{"coord":{"lon":54.37,"lat":24.47},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":27.16,"feels_like":27.67,"temp_min":26,"temp_max":30,"pressure":1012,"humidity":47},"visibility":10000,"wind":{"speed":1.5,"deg":10},"clouds":{"all":100},"dt":1584206551,"sys":{"type":1,"id":7533,"country":"AE","sunrise":1584153148,"sunset":1584196260},"timezone":14400,"id":292968,"name":"Abu Dhabi","cod":200}');
        resp.setStatusCode(200);
        return resp;
    }
}
