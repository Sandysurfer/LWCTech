import { LightningElement,wire,api } from 'lwc';
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
//import getAccountList from '@salesforce/apex/LWCAccountHelper.getAccountList';

export default class LwcToApexModeOne extends LightningElement {

//Wire a Property using fieldName...
@api recordId;

@wire(getRecord, {recordId : '$recordId',fields: [ACCOUNT_NAME_FIELD]})
record;

get name(){
    return getFieldValue(this.record.data, ACCOUNT_NAME_FIELD);
}

//Wire method using property......
   // @wire(getAccountList) accountRecords;
}