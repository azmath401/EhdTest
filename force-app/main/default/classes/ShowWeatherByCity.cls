/**
 * @Author : Azmath
 * @Description : This class will call the weather api and return the results based on city provided.
 * @Created Date : 14-03-2020
 * @ Version : v1.0
 */

public with sharing class ShowWeatherByCity {
    @AuraEnabled(cacheable=true)
    public static WeatherResponse getWeatherDetails(string city)
    {
        WeatherResponse Wresp = new WeatherResponse();
        system.debug('entered city is' +city);
        if(string.isEmpty(city)){
            city = 'Abu Dhabi';
        }
        try{
            HttpRequest req = new HttpRequest();
            req.setEndpoint(WeatherConstants.END_POINT+'?q='+city+'&APPID='+WeatherConstants.API_KEY+'&units=metric');
            req.setMethod('GET');
            Http http = new Http();
            HTTPResponse res = http.send(req);
            string resBody = res.getBody();
            system.debug('----callout response---'+res.getBody());

            if(res.getStatusCode() == 200){
                Map<String, Object> responseMap = (Map<String,Object>)JSON.deserializeUntyped(resBody);
                String cityName = String.valueOf(responseMap.get('name'));
                Map<String,Object> sysMap = (Map<String,Object>)responseMap.get('sys');
                String countryName = String.valueOf(sysMap.get('country'));
                Map<String,Object> mainMap = (Map<String,Object>)responseMap.get('main');
                Double temperature = Double.valueOf(mainMap.get('temp'));
                List<Object> weatherList = (List<Object>)responseMap.get('weather');
                Map<String,Object> weatherInfo = (Map<String,Object>)weatherList[0];
                String weatherDesc = String.valueOf(weatherInfo.get('description'));
                String weatherIcon = String.valueOf(weatherInfo.get('icon'));

                system.debug('===cityName'+cityName);
                system.debug('===countryName'+countryName);
                system.debug('===temperature'+temperature);
                system.debug('===weatherDesc'+weatherDesc);
                system.debug('===weatherIcon'+weatherIcon);

                Wresp.status = 'SUCCESS';
                Wresp.city = cityname;
                Wresp.country = countryName;
                Wresp.temperature = temperature;
                Wresp.weatherDesc = weatherDesc;
                Wresp.weatherIcon = weatherIcon;
            }else if(res.getStatusCode() == 401){
                Wresp.status = 'ERROR';
                Wresp.error = 'Incorrect API Key.';
            }
            else if(res.getStatusCode() == 404){
                Wresp.status = 'ERROR';
                Wresp.error = 'City not found. Please enter correct city.';
            }    
        }catch(exception ex){
            Wresp.status = 'ERROR';
            Wresp.error = 'Something went wrong.';
        }
        return Wresp;
    }
}
