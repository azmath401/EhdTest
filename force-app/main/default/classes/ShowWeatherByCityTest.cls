@isTest
public with sharing class ShowWeatherByCityTest 
{
    public static testMethod void ShowWeatherByCityTest() 
    {
        test.setMock(HttpCalloutMock.class, new ShowWeatherMockup());
        WeatherResponse resp = ShowWeatherByCity.getWeatherDetails(null);
        system.assertEquals(resp.city, 'Abu Dhabi');
    }
}
