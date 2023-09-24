import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi'
export default class LdsCreateRecordForm extends LightningElement {
  name;
  phone;
  fax;
  industry;

  callName(event) {
    this.name = event.target.value;
  }
  callPhone(event) {
    this.phone = event.target.value;
  }
  callFax(event) {
    this.fax = event.target.value;
  }
  callIndustry(event) {
    this.industry = event.target.value;
  }

  callSave(event) {
    //Step 1: create List Fields........
    const fields = { 'Name': this.name, 'Phone': this.phone, 'Fax': this.fax, 'Industry': this.industry };

    //Step 2: create api record with fields.....
    const recordData = { apiName: 'Account', fields };

    //step 3: call Using imperation.......
    createRecord(recordData).then((result) => {
      alert('Account is Created Successfully with AccountId: ' + result.id)
    }).catch((error) => {
      alert('Account Creation Failed: ' + error.body.message);
    });
  }

}