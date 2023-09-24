import { LightningElement,wire,track,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';

//import getAccountList  from '@salesforce/apex/LWCAccountHelper.getAccountList';

export default class LwcToApexModeTwo extends LightningElement {
  
  @api recordId;
  @track accountRecords;
  @track accountError;

  //Wire a Method by field Name AND Values......
  @wire(getRecord, {recordId : '$recordId',fields: [ACCOUNT_NAME_FIELD]})  wireAccounts({data,error}){
    if(data){
      //perform any action here
      this.accountRecords = data;
      console.log('Getting data from wire with function');
    }else{
      this.accountError = error;
      console.log('Error coming '+error.body.message);
    }
  }
}

   

  //  //Wire Method Using Function...........
   
  //   @wire(getAccountList) wiredAccounts ({data,error})
  //   {
  //     if(data)
  //     {
  //       this.accountRecords = data;
  //     }
  //     else
  //     {
  //       this.accountError = error;
  //     }
  //   }