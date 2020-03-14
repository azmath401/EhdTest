public with sharing class WeatherResponse 
{
    @AuraEnabled 
    public string city {get;set;}
    @AuraEnabled 
    public string country {get;set;}
    @AuraEnabled 
    public double temperature {get;set;}
    @AuraEnabled 
    public string weatherDesc {get;set;}
    @AuraEnabled 
    public string weatherIcon {get;set;}
    @AuraEnabled 
    public string error {get;set;}
    @AuraEnabled 
    public string status {get;set;}
}
