import Name from '@salesforce/schema/Account.Name';
import Department from '@salesforce/schema/Contact.Department';
import { LightningElement } from 'lwc';

export default class ForLoopExample extends LightningElement {

    //Arrays of Objects

    contacts = [
        {
            Name:'John',
            Department:"IT",
            Id:1
        },
        {
            Name:'Rohit',
            Department:"CS",
            Id:2
        },
        {
            Name:'Dinesh',
            Department:"Mech",
            Id:3
        }
    ]

   // cities=['Hyd','Blr','Mum','Ch'];

}