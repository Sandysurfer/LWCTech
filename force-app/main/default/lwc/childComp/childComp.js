import { LightningElement,api } from 'lwc';

export default class ChildComp extends LightningElement {
    
    timestamp = new Date();

    @api
    refresh(){
        this.timestamp = new Date();
    }
}