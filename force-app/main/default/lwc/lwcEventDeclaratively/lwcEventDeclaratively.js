import { LightningElement } from 'lwc';

export default class LwcEventDeclaratively extends LightningElement {

    handleDecrease(event){
    //Step 1: Create Event......
    const dec = new CustomEvent('decrease',{detail:'Volume is Decreasing'});

    //Step 2: Dispatch Event.....
    this.dispatchEvent(dec);
    }

    handleIncrease(event){
    //Step 1: Create and dispatch Event in one step........
    this.dispatchEvent(new CustomEvent('increase',{detail:'Volume is Increasing'}));
       /* const inc = new CustomEvent('increase');
        this.dispatchEvent(inc);*/
    }
}