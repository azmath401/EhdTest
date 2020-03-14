import { LightningElement, wire,track,api } from 'lwc';
import getWeatherDetails from '@salesforce/apex/ShowWeatherByCity.getWeatherDetails';
 
 
export default class showWeather extends LightningElement {
    @track response;
    @track error;
    inputCity='';
    @track outputtext;

    handleStringChange(event) {
        this.inputCity = event.target.value;
    }

    handleLoad() {
        console.log('*****'+this.inputCity);
        getWeatherDetails({city : this.inputCity})
            .then(result => {
                this.response = result;
               // console.log(result);
            })
            .catch(error => {
                this.error = error;
            });
    }
}