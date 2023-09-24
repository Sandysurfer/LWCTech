import { LightningElement,api } from 'lwc';

export default class ChildComponentExample extends LightningElement {

    @api firstName = "John";
    @api department = "finance";

    handlebuttonclick(event){

        const childevent = new CustomEvent("childevent",{
            detail:{
                Name:this.firstName,
                Dept:this.department
            }
        });

        this.dispatchEvent(childevent);

    }

}