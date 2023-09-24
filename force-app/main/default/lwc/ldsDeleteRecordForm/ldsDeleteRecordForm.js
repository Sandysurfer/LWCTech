import { LightningElement, api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

export default class LdsDeleteRecordForm extends LightningElement {

    @api recordId;

    callDelete(event) {
        deleteRecord(this.recordId).then((result) => {
            this[NavigationMixin.Navigate]({
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Account',
                    actionName: 'home',
                },
            });


        }).catch((error) => {
           const event = new ShowToastEvent({
            title: 'Error',
            message:
                'Cannot delete the account',
        });
        this.dispatchEvent(event);
        });
    }
}