import { LightningElement } from 'lwc';
export default class LifeCycleHooks extends LightningElement {

   constructor(){
      // myList = [];
       super();
       console.log('constructor');
   }

   connectedCallback() {
       //this.myList.push('Salesforce Bolt');
       console.log('connectedCallback');
   }

   disconnectedCallback() {
       //this.myList = [];
       console.log('disconnectedCallback');
   }

   renderedCallback(){
       console.log('renderedCallback');
   }

   errorCallback(error, stack) {
       console.log('Error CallBack '+error);
   }
}