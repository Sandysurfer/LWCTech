import { LightningElement } from 'lwc';

import getAccountList from '@salesforce/apex/LWCAccountHelper.getAccountList';
import { getDataConnectorSourceFields } from 'lightning/analyticsWaveApi';

export default class LwcToApexModeThree extends LightningElement {

     accountRecords;

    async handleLoad()
    {
        this.accountRecords = await getAccountList();
         console.log(this.accountRecords);

        //By Using Promises........

        //getAccountList().then(result=>{
            //this.accountRecords = result;
       // }).catch(error=>{
           // console.log(error);
        //})

    }
}