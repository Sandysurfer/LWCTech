import { LightningElement, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
import ProfileName from '@salesforce/schema/User.Profile.Name';


export default class LwcConditionalRendering extends LightningElement {
   /**  myValue="SalesforceBolt";
    showMe="false";

    handleValueChange(event){
        this.myValue = event.target.value;
    }
    handleChange(event){
        this.showMe = event.target.checked;
    }**/
    
    userId = Id;
isSystemAdministrator = false;

    @wire(getRecord, { recordId: Id, fields: [ProfileName] })
    userDetails({ error, data }) {
        if (error) {
            this.error = error;
        } else if (data) {
            if (data.fields.Profile.value != null && data.fields.Profile.value.fields.Name.value=='System Administrator') {
                this.isSystemAdministrator = true;
            }
        }
    }
}