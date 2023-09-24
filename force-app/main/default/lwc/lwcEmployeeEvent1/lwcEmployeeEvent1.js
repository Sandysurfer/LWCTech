import { LightningElement } from 'lwc';
export default class LwcEmployeeEvent1 extends LightningElement {
    name;
    phone;
    city;

    empName(event) {
     this.name = event.target.value;
    }
    empPhone(event) {
      this.phone = event.target.value;
    }
    empCity(event) {
      this.city = event.target.value;
    }
    empEvent(event) {
      this.dispatchEvent(new CustomEvent('empdetails',{detail:{ena:this.name,eph:this.phone,eci:this.city}}));
    }
}