import { LightningElement,wire,track } from 'lwc';
import getAllLeads from '@salesforce/apex/LWCFetchLeads.getAllLeads'

export default class FetchLLeads extends LightningElement {

    @track leadRecords;
    @track leadError;

   //Wire Method Using Function...........
   
    @wire(getAllLeads)
    wiredleads ({data,error})
    {
      if(data)
      {
        this.leadRecords = data;
      }
      else
      {
        this.leadError = error;
      }
    }
}