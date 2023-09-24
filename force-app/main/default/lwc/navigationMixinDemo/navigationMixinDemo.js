import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/Navigation';


export default class NavigationMixinDemo extends NavigationMixin(LightningElement){ 

     welcomeTitle = "Navigation Mixin Demo";

    handleWithLWCComponent(){

        let componentDef = {
            componentDef : "c:navigatetoLWC",
            attributes : {
                label: 'Navigated From Another LWC Without using Aura',
                welcomeTitle: this.welcomeTitle
            }
        };


        //Base 64 encode the componentDefinition in JS Component.

        let encodedCompDef = btoa(JSON.stringify(componentDef));
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage', //page Reference
            attributes: {
                url:'/one/one.app#' +encodedCompDef
            },
        });
    }

}