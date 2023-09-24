import { LightningElement } from 'lwc';

export default class SendDataJstoCmp extends LightningElement {

selectedSalutation ='--Select--';
firstName='';
middleName='';
lastName='';

get salutationOptions(){
      return [
            {label: '--Select--', value: ''},
            {label: 'Mr.', value: 'Mr.'},
            {label: 'Mrs', value: 'Mrs.'},
        ];
}

handleFirstNamechange(event){
    this.firstName = event.target.value; 
}
handleMiddleNamechange(event){
    this.middleName = event.target.value;
}
handleLastNamechange(event){
    this.lastName = event.target.value;
}
handleSalutationChange(event){
    this.selectedSalutation = event.target.value;
}

}