import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {

    handleClick(){
        this.template.querySelector("c-child-Comp").refresh();
    }
}