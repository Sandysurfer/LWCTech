import { LightningElement } from 'lwc';
export default class LwcEmployeeEventParent extends LightningElement {
    empName;
    empPhone;
    empCity;

    handleEvent(event) {
        this.empName = event.details.ena;
        this.empPhone = event.details.eph;
        this.empcity = event.details.eci;
    }
}