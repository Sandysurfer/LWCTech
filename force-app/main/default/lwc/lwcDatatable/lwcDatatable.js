import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/lwcDataTableController.getContactList';
import {updateRecord} from 'lightning/uiRecordApi';
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import ID_FIELD  from '@salesforce/schema/Contact.Id';
import {refreshApex} from '@salesforce/apex';

const columns = [
    { label: 'First Name', fieldName: 'FirstName', type:'text',editable:true},
    { label: 'Last Name', fieldName: 'LastName', type:'text',editable:true},
    { label: 'Phone', fieldName: 'Phone', type: 'Phone'},
    { label: 'Email', fieldName: 'Email', type: 'email'}

];

export default class LwcDatatable extends LightningElement {
   
    col = columns; 
    draftValues=[];
   @wire(getContactList) contacts;
   
   handleSave(event){

    const fields={};
    fields[ID_FIELD.fieldApiName]= event.detail.draftValues[0].Id;
    fields[FIRST_NAME_FIELD.fieldApiName]= event.detail.draftValues[0].FirstName;
    fields[LAST_NAME_FIELD.fieldApiName]= event.detail.draftValues[0].LastName;

    const recordData = {fields};

    updateRecord(recordData).then(response=>{
      alert('Record Updated Successfully');
      this.draftValues=[];
      return refreshApex(this.contacts);
    }).catch();

   }

}