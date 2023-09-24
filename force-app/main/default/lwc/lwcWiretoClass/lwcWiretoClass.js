import { LightningElement,wire } from 'lwc';
import findContacts from '@salesforce/apex/lwcWiretoCreateClass.findContacts';

export default class LwcWiretoClass extends LightningElement {

    searchkey;
    @wire (findContacts,{searchtext:'$searchkey'}) contact;

    handleChange(event){

        this.searchkey = event.target.value;
    }
}