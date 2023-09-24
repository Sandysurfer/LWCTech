import { LightningElement } from 'lwc';

export default class GetterDataBinding extends LightningElement {
     firstname='';
     lastname='';

    handleChange(event){
       const field = event.target.name;
       if(field === 'firstname'){
        this.firstname = event.target.value;
       }
       if(field === 'lastname'){
        this.lastname = event.target.value;
       }
    }

    get uppercasedFullName(){
        return `${this.firstname} ${this.lastname}`.toUpperCase();
    }
}